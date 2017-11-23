package com.tianjian.pm.struts.comm;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;



/**
 * Action 基类
 *
 * <li>从 context 获得 bean 对象。
 * <li>统一 log： 所有继承本类的 dispatch action ，只需要直接使用 log ，不需要再重新定义
 */

public  class BaseAction extends Action {

    protected Log log = LogFactory.getLog(this.getClass());

    protected final static String SUCCESS = "success";
    protected final static String LIST = "list";
    protected final static String FORM = "form";
    protected final static String VIEW = "view";
    protected final static String EDIT = "edit";
    protected final static String ERROR = "error";
    protected final static String FAILURE = "failure";

    protected static final String ADD = "add";
    protected static final String MDF = "mdf";
    protected static final String DEL = "del";
    protected static final String MSG = "msg";

    //设置请求参数到系统环境里
    protected void path(HttpServletRequest request) {
		ServletContext ctx = request.getSession().getServletContext();
		if (ctx.getAttribute(Globals.CONTEXT_PATH) == null) {
			ctx.setAttribute(Globals.CONTEXT_PATH, request.getContextPath());
		}
    	StringBuilder abPath = new StringBuilder();
    	abPath.append(request.getScheme()).append("://").append(request.getServerName());
    	int port = request.getServerPort();
    	if(port != 80)
    	{
    		abPath.append(":");
    		abPath.append(port);
    	}
    	abPath.append(request.getContextPath()).append("/");
		if (ctx.getAttribute(Globals.CONTEXT_ABSOLUTEPATH) == null) {
			ctx.setAttribute(Globals.CONTEXT_ABSOLUTEPATH, abPath);
		}
	}


    protected String patientId(HttpServletRequest request)
    {
    	return "";
    }
    protected void saveError(HttpServletRequest request, ActionMessage error) {
        ActionMessages errors = (ActionMessages) request
                .getAttribute(org.apache.struts.Globals.ERROR_KEY);
        if (errors == null) {
            errors = new ActionMessages();
        }
        errors.add(ActionMessages.GLOBAL_MESSAGE, error);
        this.saveErrors(request, errors);
    }

    protected void saveMessage(HttpServletRequest request, ActionMessage message) {
        ActionMessages messages = (ActionMessages) request
                .getAttribute(org.apache.struts.Globals.MESSAGE_KEY);
        if (messages == null) {
            messages = new ActionMessages();
        }
        messages.add(ActionMessages.GLOBAL_MESSAGE, message);
        this.saveErrors(request, messages);
    }
}
