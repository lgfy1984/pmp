package com.tianjian.comm.dao.hibernate;


import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.tianjian.comm.bean.CommConfigAbo;
import com.tianjian.comm.dao.ICommConfigAboDAO;
import com.tianjian.util.HqlUtil;
 


public class CommConfigAboDAO extends HibernateDaoSupport implements  ICommConfigAboDAO{

	private static final Logger log = LogManager.getLogger(CommConfigAboDAO.class);
	
	public CommConfigAbo findById(String id){
		try{
			CommConfigAbo fac = null;
			List<?> ls = getHibernateTemplate().find(" from CommConfigAbo a where a.itemCode = ? ", id);
			if(ls != null && ls.size() >0){
				fac = (CommConfigAbo) ls.get(0);
			}
			log.debug("findById success!");
			return fac;
		}catch(Exception re){
			log.error("findById fail!",re);
			re.printStackTrace();
			return null; 
		}
	}
	public String getItemName(String id){
		String itemName = "";
		try {
			List<?> l = getHibernateTemplate().find(" from CommConfigAbo aa where aa.itemCode = ? ", id);
			if(l != null && l.size() > 0){
				CommConfigAbo pub = (CommConfigAbo)l.get(0);
				itemName = pub.getItemName();
			}
			log.debug("getClassName success!");
			return itemName;
        } catch (Exception re) {
        	log.error("getClassName fail!",re);
        	re.printStackTrace();
			return null; 
        }
	} 
    
    public void save(CommConfigAbo commConfigCountry){
    	try {
        	getHibernateTemplate().save(commConfigCountry);
        	log.debug("save success!");
        } catch (Exception re) {
        	log.error("save fail!",re);
        	re.printStackTrace(); 
        }
    }
    
    public void update(CommConfigAbo commConfigCountry){
    	try {
        	getHibernateTemplate().update(commConfigCountry);
        	log.debug("update success!");
        } catch (Exception re) {
        	log.error("update fail!",re);
        	re.printStackTrace(); 
        }
    }
    
    public void delete(CommConfigAbo commConfigCountry){
    	try {
        	getHibernateTemplate().delete(commConfigCountry);
        	log.debug("delete success!");
        } catch (Exception re) {
        	log.error("delete fail!",re);
        	re.printStackTrace(); 
        }
    } 
    
    public List<?> findAll(){
    	try {
    		String sql = " from CommConfigAbo a  ";
	       
	    	Query q = getSession().createQuery(sql); 
			List<?> l=q.list();
			log.debug("findAll success!");
			return l;
    	} catch (Exception re) {
        	log.error("findAll fail",re);
        	re.printStackTrace(); 
        	return null;
        }
    }
    
    public List<?> getData(String itemCode, String itemName, String inputCode, String seqNo, String orderNo, int curCount,int pageSize){
    	try {
    		List<Object> params = new ArrayList<Object>();
    		StringBuffer sql = new StringBuffer(" select a.itemCode, a.itemName,a.inputCode,a.comments,a.seqNo  ");
	    	sql .append(" from CommConfigAbo a");
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
    
    public int getCount( String itemCode, String itemName, String inputCode,String seqNo){
    	try {
    		int count = 0;
    		List<Object> params = new ArrayList<Object>();
    		StringBuffer sql = new StringBuffer("select count(*) ");
	    	sql .append( " from CommConfigAbo a");
	    	
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