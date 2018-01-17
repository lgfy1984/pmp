package com.tianjian.comm.business.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.tianjian.comm.bean.CommConfigStaffChargeType;
import com.tianjian.comm.business.ICommConfigStaffChargeService;
import com.tianjian.comm.dao.ICommConfigStaffChargeDAO;
import com.tianjian.comm.struts.form.CommConfigStaffChargeForm;
import com.tianjian.util.Converter;

public class CommConfigStaffChargeServiceImpl implements
		ICommConfigStaffChargeService {
	private static final Logger log = LogManager  
			.getLogger(CommConfigStaffChargeServiceImpl.class);
	private ICommConfigStaffChargeDAO commConfigStaffChargeDAO;
	// ------------------------DAO--
	// 声明结束---------------------------------------------------


	public ICommConfigStaffChargeDAO getCommConfigStaffChargeDAO() {
		return commConfigStaffChargeDAO;
	}

	public void setCommConfigStaffChargeDAO(
			ICommConfigStaffChargeDAO commConfigStaffChargeDAO) {
		this.commConfigStaffChargeDAO = commConfigStaffChargeDAO;
	}

	public void addInit(CommConfigStaffChargeForm form) {
		init(form);
		form.setSeqNo(String.valueOf(this.commConfigStaffChargeDAO.seqNoMaker("CommConfigStaffChargeType")));

	}

	public void serchInit(CommConfigStaffChargeForm form) {
		searchInit(form);
	}

	/** 获取记录对象 */
	public CommConfigStaffChargeType checkData(String id) {
		CommConfigStaffChargeType data = commConfigStaffChargeDAO.findById(id);
		return data;
	}

	/** 获取记录对象 */
	public CommConfigStaffChargeType checkDataByName(String itemName) {
		CommConfigStaffChargeType data = commConfigStaffChargeDAO
				.findByItemName(itemName);
		return data;
	}

	/** 提交保存 */
	public void save(CommConfigStaffChargeForm form) {
		CommConfigStaffChargeType data = new CommConfigStaffChargeType();
		this.setData(form, data);
		commConfigStaffChargeDAO.save(data);
	}

	/** 修改之前初始化 */
	public void updateInit(CommConfigStaffChargeForm form) {
		CommConfigStaffChargeType data = commConfigStaffChargeDAO.findById(form
				.getItemCodeHidden());
		this.setForm(form, data);
		init(form);
	}

	/** 提交修改 */
	public void update(CommConfigStaffChargeForm form) {
		CommConfigStaffChargeType data = commConfigStaffChargeDAO.findById(form
				.getItemCodeHidden());
		this.setData(form, data);
		commConfigStaffChargeDAO.update(data);
	}

	/** 提交察看详细 */
	public void showInit(CommConfigStaffChargeForm form) {
		CommConfigStaffChargeType data = commConfigStaffChargeDAO.findById(form
				.getItemCodeHidden());
		this.setForm(form, data);
		init(form);
	}

	/** 提交删除 */
	public void delete(CommConfigStaffChargeForm form) {
		CommConfigStaffChargeType data = commConfigStaffChargeDAO.findById(form
				.getItemCodeHidden());
		commConfigStaffChargeDAO.delete(data);
	}

	/** 获取总记录数 */
	public int getCount(String itemCode, String itemName, String inputCode,
			String seqNo) {
		return commConfigStaffChargeDAO.getCount(itemCode, itemName, inputCode,
				seqNo);
	}

	/** 根据查询条件获取当前显示页的数据 */
	public void getSearch(CommConfigStaffChargeForm form, int curCount,
			int pageSize) {
		try {

			String order = "";
			if (form.getOrderNo().equals("1")) {
				order = " a.itemCode";
			} else if (form.getOrderNo().equals("2")) {
				order = " a.itemName";
			} else if (form.getOrderNo().equals("3")) {
				order = " a.seqNo";
			} else if (form.getOrderNo().equals("4")) {
				order = " a.inputCode";

			} else {
				order = " a.seqNo";
			}

			if (form.getAsc().equals("1")) {
				order += " desc";
			} else {
				order += " asc";
			}

			List<?> list = commConfigStaffChargeDAO.getData(form.getItemCode(),
					form.getItemName(), form.getInputCode(), form.getSeqNo(),
					order, curCount, pageSize);

			if (list != null && list.size() > 0) {

				String[] itemCodes = new String[list.size()];
				String[] itemNames = new String[list.size()];
				String[] inputCodes = new String[list.size()];
				String[] comments = new String[list.size()];
				String[] seqNos = new String[list.size()];
				List<CommConfigStaffChargeType> ccsList = new ArrayList<CommConfigStaffChargeType>();
				for (int i = 0; i < list.size(); i++) {
					CommConfigStaffChargeType ccs = new CommConfigStaffChargeType();
					ccs
							.setItemCode(String
									.valueOf(transNullToString(((Object[]) list
											.get(i))[0])));
					ccs
							.setItemName(String
									.valueOf(transNullToString(((Object[]) list
											.get(i))[1])));
					ccs
							.setInputCode(String
									.valueOf(transNullToString(((Object[]) list
											.get(i))[2])));
					ccs
							.setComments(String
									.valueOf(transNullToString(((Object[]) list
											.get(i))[3])));
					ccs
					.setItemCost(Converter.toInteger(((Object[]) list.get(i))[5]));
					ccs
					.setItemUnit(String	.valueOf(transNullToString(((Object[]) list.get(i))[6])));
					ccs.setSeqNo(((Object[]) list.get(i))[4] == null ? 0
							:Converter.toLong(((Object[]) list.get(i))[4]));
					itemCodes[i] = String
							.valueOf(transNullToString(((Object[]) list.get(i))[0]));
					itemNames[i] = String
							.valueOf(transNullToString(((Object[]) list.get(i))[1]));
					inputCodes[i] = String
							.valueOf(transNullToString(((Object[]) list.get(i))[2]));
					comments[i] = String
							.valueOf(transNullToString(((Object[]) list.get(i))[3]));
					seqNos[i] = ((Object[]) list.get(i))[4] == null ? "0"
							: String.valueOf(((Object[]) list.get(i))[4]);
					ccsList.add(ccs);
				}
				form.setCcsList(ccsList);
				form.setItemCodeList(itemCodes);
				form.setItemNameList(itemNames);
				form.setInputCodeList(inputCodes);
				form.setCommentsList(comments);
				form.setSeqNoList(seqNos);

			}
		} catch (Exception e) {
			log.error("getSearch fail!", e);
			e.printStackTrace();
		}
	}

	/** 构造data */
	private void setData(CommConfigStaffChargeForm form, CommConfigStaffChargeType data) {
		try {
			data.setItemCode(transNullToString(form.getItemCode()));
			data.setItemName(transNullToString(form.getItemName()));
			data.setInputCode(transNullToString(form.getInputCode()));
			data.setComments(transNullToString(form.getComments()));
			data.setItemCost(Converter.toInteger(form.getItemCost()));
			data.setItemUnit(transNullToString(form.getItemUnit()));
			data.setSeqNo(Long.valueOf((form.getSeqNo() == null || "".equals(form.getSeqNo().trim())) ? "0" : form.getSeqNo()));
		} catch (Exception e) {
			log.error("setData fail!", e);
			e.printStackTrace();
		}
	}

	/**
	 * 去掉字串中的空格
	 * */
	public String transNullToString(Object obj) {
		String temp = "";
		if (obj != null) {
			temp = ((String) obj).trim();
		}
		return temp;
	}

	public String transNullToZero(Object obj) {
		String temp = "0";
		if (obj != null) {
			temp = ((String) obj).trim();
		}
		return temp;
	}

	/** 在传递数据到页面之前构造form */
	private void setForm(CommConfigStaffChargeForm form, CommConfigStaffChargeType data) {
		try {
			form.setItemCodeHidden(transNullToString(data.getItemCode()));
			form.setItemName(transNullToString(data.getItemName()));
			form.setItemCode(transNullToString(data.getItemCode()));
			form.setItemCost(Converter.toBlank(data.getItemCost()));
			form.setItemUnit(transNullToString(data.getItemUnit()));
			form.setInputCode(transNullToString(data.getInputCode()));
			form.setComments(transNullToString(data.getComments()));
			form.setSeqNo(data.getSeqNo() == null ? "0" : String.valueOf(data
					.getSeqNo()));
		} catch (Exception e) {
			log.error("setForm fail!", e);
			e.printStackTrace();
		}
	}

	/** 在初始化阶段将字典库传入form中 */
	private void init(CommConfigStaffChargeForm form) {
		if (form.getSeqNo() == null || form.getSeqNo().equals(""))
			form.setSeqNo(commConfigStaffChargeDAO.getMaxSeqNo() + "");

	}

	/***/
	public void getDetail(CommConfigStaffChargeForm form) {

	}

	/** 获取查询结果之前初始化 */
	/** 在进行查找之前将字典库传入form中 */
	private void searchInit(CommConfigStaffChargeForm form) {
	}

}
