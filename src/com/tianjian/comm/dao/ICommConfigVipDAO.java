package com.tianjian.comm.dao;

import java.util.List;

import com.tianjian.comm.bean.CommConfigVip;
 

public interface ICommConfigVipDAO {
   
    public CommConfigVip findById(String id);
    
    public List<?> findAll();
    public List<?> findVIPAll();
    
	public String getItemName(String id);
	
    public void save(CommConfigVip commConfigSex);
    
    public void update(CommConfigVip commConfigSex);
    
    public void delete(CommConfigVip commConfigSex);
    
    public List<?> getData(String itemCode, String itemName, String inputCode, String seqNo, String orderNo, int curCount,int pageSize);
    
    public int getCount(String itemCode, String itemName, String inputCode, String seqNo);
    
    public int getMaxSeqNo();   
}