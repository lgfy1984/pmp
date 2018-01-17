package com.tianjian.comm.business;


 
import com.tianjian.comm.bean.CommConfigStaffChargeType;
import com.tianjian.comm.struts.form.CommConfigStaffChargeForm;
 
public interface ICommConfigStaffChargeService {
	public CommConfigStaffChargeType checkDataByName(String itemName);
  /**新增之前的初始化*/
	public void addInit(CommConfigStaffChargeForm form);
	/** checkData*/
	public CommConfigStaffChargeType checkData(String id);
	/**保存*/
	public void save(CommConfigStaffChargeForm form);
	/**更新之前初始化*/
	public void updateInit(CommConfigStaffChargeForm form);
	/**更新*/
	public void update(CommConfigStaffChargeForm form);
	/**显示之前初始化*/
	public void showInit(CommConfigStaffChargeForm form);
	/**删除*/
	public void delete(CommConfigStaffChargeForm form);	
	/**获取总记录数*/
	public int getCount(String itemCode, String itemName, String inputCode, String seqNo);
	/**获取当页记录*/
	public void getSearch(CommConfigStaffChargeForm form, int curCount, int pageSize);
	/**serchInit*/
	public void serchInit(CommConfigStaffChargeForm form);
	/**getDetail*/
	public void getDetail(CommConfigStaffChargeForm form);
	
}
