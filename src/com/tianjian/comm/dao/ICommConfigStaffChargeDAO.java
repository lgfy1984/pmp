package com.tianjian.comm.dao;

import java.util.List;
import com.tianjian.comm.bean.CommConfigStaffChargeType;
 

public interface ICommConfigStaffChargeDAO {
	public CommConfigStaffChargeType findByItemName(String itemName);
	
    public CommConfigStaffChargeType findById(String id);
    
    public List<?> findAll();
    
	public String getItemName(String id);
	
    public void save(CommConfigStaffChargeType CommConfigStaffChargeType);
    
    public void update(CommConfigStaffChargeType CommConfigStaffChargeType);
    
    public void delete(CommConfigStaffChargeType CommConfigStaffChargeType);
    
    public List<?> getData(String itemCode, String itemName, String inputCode, String seqNo, String orderNo, int curCount,int pageSize);
    
    public int getCount(String itemCode, String itemName, String inputCode, String seqNo);
    
    public int getMaxSeqNo();    
    
	 public Long seqNoMaker(String nameOfTable);
}