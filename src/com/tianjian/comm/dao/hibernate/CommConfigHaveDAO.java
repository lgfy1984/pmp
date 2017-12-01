package com.tianjian.comm.dao.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tianjian.comm.bean.CommConfigHave;
import com.tianjian.comm.dao.ICommConfigHaveDAO;
import com.tianjian.util.HqlUtil;

public class CommConfigHaveDAO extends HibernateDaoSupport implements ICommConfigHaveDAO {

	private static final Logger log = LogManager.getLogger(CommConfigHaveDAO.class);
	/**
	 * 通过主键获取纪录
	 * @param id
	 * @return
	 */
	public CommConfigHave findById(String id) {
		CommConfigHave data=null;
		try{
			List<?> l=this.getHibernateTemplate().find("from CommConfigHave a where a.itemCode = ? ", id);
			if(l!=null&&l.size()>0){
				data=(CommConfigHave) l.get(0);
			}
			log.debug("findById success!");
			return data;
		}catch(Exception re){
			log.error("findById error!",re);
			re.printStackTrace();
			return null;
			
		}
		
	}
	/**
	 * 查找所有记录
	 * @return
	 */
	public List<?> findAll() {
		try{
			Query q=getSession().createQuery("from CommConfigHave a");
			List<?> l=q.list();
			log.debug("findAll success!");
			return l;
		}catch(Exception re){
			log.error("findAll error!",re);
			re.printStackTrace();
			return null;
		}
	}
	/**
	 * 通过ID获取职称名称
	 * @param id
	 * @return
	 */
	public String getNameById(String id) {
		String name="";
		try{
			List<?> l= this.getHibernateTemplate().find("from CommConfigHave a where a.itemName=?",id);
			if(l!=null&&l.size()>0){
				CommConfigHave commConfigHave= (CommConfigHave) l.get(0);
				name=commConfigHave.getItemName();
			}
			log.debug("getNameById success!");
			return name;
		}catch(Exception re){
			log.error("getNameById error!",re);
			re.printStackTrace();
			return null;
			
		}
	}
	/**
	 * 保存记录
	 * @param commConfigHave
	 */
	public void save(CommConfigHave commConfigHave) {
		try{
			this.getHibernateTemplate().save(commConfigHave);
			log.debug("save success!");
		}catch(Exception re){
			log.error("save error!",re);
			re.printStackTrace();
		}
	}
	/**
	 * 修改记录
	 * @param commConfigHave
	 */
	public void update(CommConfigHave commConfigHave) {
		try{
			this.getHibernateTemplate().update(commConfigHave);
			log.debug("update success!");
		}catch(Exception re){
			log.error("update error!",re);
			re.printStackTrace();
		}
	}
	/**
     * 删除记录
     * @param commConfigHave
     */
	public void delete(CommConfigHave commConfigHave) {
		try{
			this.getHibernateTemplate().delete(commConfigHave);
			log.debug("delete success!");
		}catch(Exception re){
			log.error("delete error!",re);
			re.printStackTrace();
		}
	}

	/**
	 * 根据条件获取当前页记录
	 * @param itemCode
	 * @param itemName
	 * @param inputCode
	 * @param seqNo
	 * @param orderNo
	 * @param curCount
	 * @param pageSize
	 * @return l
	 */
	public List<?> getData(String itemCode, String itemName, String inputCode,
			String seqNo, String orderNo, int curCount, int pageSize) {
		try {
			List<Object> params = new ArrayList<Object>();
    		StringBuffer sql = new StringBuffer(" select a.itemCode, a.itemName,a.inputCode,a.comments,a.seqNo  ");
	    	sql .append( " from CommConfigHave a ");
	       
	    
	    	if(itemCode.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)
						+ " a.itemCode = ? ");
				params.add(itemCode.trim());
	    	}
	    	if(itemName.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)+ " lower(a.itemName) like ? ");
	    		params.add("%" + itemName.trim().toLowerCase() + "%");
	    	}
	    	if(inputCode.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)+ " a.inputCode like ? ");
	    		params.add("%" + inputCode.trim().toUpperCase() + "%");
	    	}
	    	if(seqNo.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)+ " a.seqNo = ?");
	    		params.add(seqNo.trim());
	    	}
	    	if(orderNo.trim().length() > 0){
	    		sql .append(" order by " + orderNo);
	    	}
	    	
	    	Query q = getSession().createQuery(sql.toString());
	    	for (int i = 0; i < params.size(); i++) {
				q.setParameter(i, params.get(i));
			}
			q.setFirstResult(curCount); 
			q.setMaxResults(pageSize); 
			List<?> l=q.list();
			log.debug("getData success!");
			return l;
    	} catch (Exception re) {
        	log.error("getData fail!",re);
        	re.printStackTrace(); 
        	 return null;
        }
	}
	 /**
     * 根据查询条件获取记录总数
     * @param itemCode
     * @param itemName
     * @param inputCode
     * @param seqNo
     * @return
     */
	public int getCount(String itemCode, String itemName, String inputCode,
			String seqNo) {
		try {
    		int count = 0;
    		List<Object> params = new ArrayList<Object>();
    		StringBuffer sql = new StringBuffer("select count(*) ");
	    	sql .append(" from CommConfigHave a ");
	    	
	    	if(itemCode.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)
						+ " a.itemCode = ? ");
				params.add(itemCode.trim());
	    	}
	    	if(itemName.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)+ " lower(a.itemName) like ? ");
	    		params.add("%" + itemName.trim().toLowerCase() + "%");
	    	}
	    	if(inputCode.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)+ " a.inputCode like ? ");
	    		params.add("%" + inputCode.trim().toUpperCase() + "%");
	    	}
	    	if(seqNo.trim().length() > 0){
	    		sql .append(" " + HqlUtil.whereOrAnd(params)+ " a.seqNo = ?");
	    		params.add(seqNo.trim());
	    	}
	    	
	    	Query q = getSession().createQuery(sql.toString());
	    	for (int i = 0; i < params.size(); i++) {
				q.setParameter(i, params.get(i));
			}
			
			List<?> list =q.list();
	    	if(list != null && list.size() > 0){
	    		count = Integer.valueOf(String.valueOf(list.get(0))).intValue();
	    	}
	    	log.debug("getCount success!");
	    	return count;
	    } catch (Exception re) {
	    	log.error("getCount fail!",re);
	    	re.printStackTrace();
	    	return new Integer("0");
	    }
	}


	/**
     * 自动获取序号
     * @param commConfigYes
     */
	public Long seqNoMaker(String nameOfTable) {
		try {
			Long temp = (Long)this.getSession().createQuery(" select max(a.seqNo) from " + nameOfTable + " a ").uniqueResult();
			if(temp==null)
				return 1L;
			else
				return temp+1;
		}
		catch (Exception re) {
			log.error("seqNoMaker error!", re);
			return 1L;
		}

	}
}
