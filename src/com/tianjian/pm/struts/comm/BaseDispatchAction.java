/*
 * $Id: BaseDispatchAction.java,v 1.2 2015/08/24 08:26:17 lengj Exp $
 */

package com.tianjian.pm.struts.comm;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.MessageResources;

import com.tianjian.security.struts.form.SessionForm;

/**
 * Dispatch Action 基类
 */

public class BaseDispatchAction extends BaseAction {
	protected static final String SYMBOL=" : ";

	/*
	 * =================================================================== from
	 * struts dispatch action
	 * ====================================================================
	 */
	/**
	 * The Class instance of this <code>DispatchAction</code> class.
	 */
	protected Class clazz = this.getClass();

	/**
	 * The message resources for this package.
	 */
	protected static MessageResources messages = MessageResources
			.getMessageResources("org.apache.struts.actions.LocalStrings");

	/**
	 * The set of Method objects we have introspected for this class, keyed by
	 * method name. This collection is populated as different methods are
	 * called, so that introspection needs to occur only once per method name.
	 */
	protected HashMap methods = new HashMap();

	/**
	 * The set of argument type classes for the reflected method call. These are
	 * the same for all calls, so calculate them only once.
	 */
	protected Class[] types = { ActionMapping.class, ActionForm.class,
			HttpServletRequest.class, HttpServletResponse.class };

	// --------------------------------------------------------- Public Methods

	/**
	 * Process the specified HTTP request, and create the corresponding HTTP
	 * response (or forward to another web component that will create it).
	 * Return an <code>ActionForward</code> instance describing where and how
	 * control should be forwarded, or <code>null</code> if the response has
	 * already been completed.
	 * 
	 * @param mapping
	 *            The ActionMapping used to select this instance
	 * @param form
	 *            The optional ActionForm bean for this request (if any)
	 * @param request
	 *            The HTTP request we are processing
	 * @param response
	 *            The HTTP response we are creating
	 * 
	 * @exception Exception
	 *                if an exception occurs
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		path(request);
		
		String unurl = request.getServletPath();
		/*
		System.out.println(unurl);
		System.out.println(request.getPathInfo());
		System.out.println(request.getContextPath());
		System.out.println(request.getPathTranslated());
		System.out.println(request.getServletPath());
		*/
		//以/information/或/call/开始的Action是给云通讯平台调用的回调地址，不做登陆验证
		if(!(unurl.startsWith("/information/") || unurl.startsWith("/call/")||unurl.startsWith("/kbs/")||unurl.startsWith("/hsp/")))
		{
			SessionForm sform = (SessionForm)request.getSession().getAttribute("sessionForm");
			if(sform == null)
			{
				return mapping.findForward("noLogin");
			}
		}
		if (isCancelled(request)) {
			ActionForward af = cancelled(mapping, form, request, response);
			if (af != null) {
				return af;
			}
		}
		// Identify the request parameter containing the method name
		String parameter = mapping.getParameter();
		if (parameter == null) {
			String message = messages.getMessage("dispatch.handler",
					mapping.getPath());

			log.error(message);

			throw new ServletException(message);
		}

		// Get the method's name. This could be overridden in subclasses.
		String name = getMethodName(mapping, form, request, response, parameter);

		// Prevent recursive calls
		if ("execute".equals(name) || "perform".equals(name)) {
			String message = messages.getMessage("dispatch.recursive",
					mapping.getPath());

			log.error(message);
			throw new ServletException(message);
		}

		// Invoke the named method, and return the result
		return dispatchMethod(mapping, form, request, response, name);

	}

	/**
	 * Method which is dispatched to when there is no value for specified
	 * request parameter included in the request. Subclasses of
	 * <code>DispatchAction</code> should override this method if they wish to
	 * provide default behavior different than throwing a ServletException.
	 */
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String message = messages.getMessage("dispatch.parameter",
				mapping.getPath(), mapping.getParameter());

		log.error(message);

		throw new ServletException(message);
	}

	/**
	 * Method which is dispatched to when the request is a cancel button submit.
	 * Subclasses of <code>DispatchAction</code> should override this method if
	 * they wish to provide default behavior different than returning null.
	 * 
	 * @since Struts 1.2.0
	 */
	protected ActionForward cancelled(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		return null;
	}

	// ----------------------------------------------------- Protected Methods

	/**
	 * Dispatch to the specified method.
	 * 
	 * @since Struts 1.1
	 */
	protected ActionForward dispatchMethod(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, String name) throws Exception {

		// Make sure we have a valid method name to call.
		// This may be null if the user hacks the query string.
		if (name == null) {
			return this.unspecified(mapping, form, request, response);
		}

		// Identify the method object to be dispatched to
		Method method = null;
		try {
			method = getMethod(name);

		} catch (NoSuchMethodException e) {
			String message = messages.getMessage("dispatch.method",
					mapping.getPath(), name);
			log.error(message, e);
			throw e;
		}

		ActionForward forward = null;
		try {
			Object args[] = { mapping, form, request, response };
			forward = (ActionForward) method.invoke(this, args);

		} catch (ClassCastException e) {
			String message = messages.getMessage("dispatch.return",
					mapping.getPath(), name);
			log.error(message, e);
			throw e;

		} catch (IllegalAccessException e) {
			String message = messages.getMessage("dispatch.error",
					mapping.getPath(), name);
			log.error(message, e);
			throw e;

		} catch (InvocationTargetException e) {
			// Rethrow the target exception if possible so that the
			// exception handling machinery can deal with it
			Throwable t = e.getTargetException();
			if (t instanceof Exception) {
				throw ((Exception) t);
			} else {
				String message = messages.getMessage("dispatch.error",
						mapping.getPath(), name);
				log.error(message, e);
				throw new ServletException(t);
			}
		}

		// Return the returned ActionForward instance
		return (forward);
	}

	/**
	 * Introspect the current class to identify a method of the specified name
	 * that accepts the same parameter types as the <code>execute</code> method
	 * does.
	 * 
	 * @param name
	 *            Name of the method to be introspected
	 * 
	 * @exception NoSuchMethodException
	 *                if no such method can be found
	 */
	protected Method getMethod(String name) throws NoSuchMethodException {

		synchronized (methods) {
			Method method = (Method) methods.get(name);
			if (method == null) {
				method = clazz.getMethod(name, types);
				methods.put(name, method);
			}
			return (method);
		}

	}

	/**
	 * Returns the method name, given a parameter's value.
	 * 
	 * @param mapping
	 *            The ActionMapping used to select this instance
	 * @param form
	 *            The optional ActionForm bean for this request (if any)
	 * @param request
	 *            The HTTP request we are processing
	 * @param response
	 *            The HTTP response we are creating
	 * @param parameter
	 *            The <code>ActionMapping</code> parameter's name
	 * 
	 * @return The method's name.
	 * @since Struts 1.2.0
	 */
	protected String getMethodName(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response,
			String parameter) throws Exception {

		// Identify the method name to be dispatched to.
		// dispatchMethod() will call unspecified() if name is null
		return request.getParameter(parameter);
	}
	
}