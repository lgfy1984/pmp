package com.tianjian.security.struts.form;

/**
 * SECURITY_STAFF_BASEINFO医务人员基本信息表用ActionForm<br>
 * MODUFY BY DZENALL 08-3-25 15:07
 * @author 
 */
public class SecurityStaffBaseinfoVo  {
	
	private static final long serialVersionUID = 2717849952365436900L;
	/*Bean Fields*/
	private String id                     ;
	private String staffCode              ;
	private String staffType			  ;//操作人员类别字段	
	private String passwd                 ;//原來的Bean中沒有這個字段
	private String hspConfigBaseinfoId	  ;
	private String hspStaffBaseinfoId	  ;
	private String email                  ;
	private String name                   ;
	private String nameEn                 ;
	private String inputCode              ;
	private String pinyinInputCode        ;
	private String commConfigSexId        ;
//	private String dateOfBirth            ;
	private String year                   ;
	private String month                  ;
	private String day                    ;
	private String commConfigStafftypeId  ;
	private String commConfigStaffChargeTypeId        ;
	private String idNo                   ;
	private String phone                  ;
	private String islocation             ;
	private String islocationName         ;
	private String comments               ;
	private String seqNo             ;
	private String tenantId           ;
	private String createDate;
	private String createUserId;
	private String createUserName;
	//时间
	private String createDateYear="";
	private String createDateMonth="";
	private String createDateDay="";  
	
	/*Selected Names In Each Selection*/
	private String hspConfigBaseinfoName    ;
	private String commConfigSexName        ;
	private String commConfigStaffChargeTypeName        ;
	private String commConfigStafftypeName  ;

	private String staffId;
    
    //注册信息
    private String registCode;
    private String regTime;
    private String startTime;
    private String stopDate;

	/*Constructor*/
	public SecurityStaffBaseinfoVo(){
		this.id                     = "";   
		this.staffCode              = "";  
		this.passwd 				= "";//原來的Bean中沒有這個字段
		this.hspConfigBaseinfoId    = "";  
		this.hspStaffBaseinfoId     = "";
		this.email                  = "";
		this.name                   = "";   
		this.nameEn                 = "";  
		this.inputCode              = "";
		this.pinyinInputCode        = "";
		this.commConfigSexId        = ""; 
//		this.dateOfBirth            = ""; 
		this.year                   = "";
		this.month                  = "";
		this.day                    = "";
		this.commConfigStafftypeId  = ""; 
		this.idNo                   = ""; 
		this.phone                  = "";  
		this.islocation             = "";  
		this.comments               = ""; 
		this.seqNo                  = ""; 
		this.islocationName 		= "";		
		this.hspConfigBaseinfoName  = "";   
		this.commConfigSexName      = ""; 
		this.commConfigStafftypeName= ""; 
		
		this.staffType   			= "";
		this.createUserId			= "";
		this.createUserName			= "";
		this.staffId    			= "";    
		
		this.registCode             = "";
		this.regTime 				= "";
		this.startTime				= "";
		this.stopDate 				= "";
	}

	public String getPinyinInputCode() {
		return pinyinInputCode;
	}

	public void setPinyinInputCode(String pinyinInputCode) {
		this.pinyinInputCode = pinyinInputCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getHspConfigBaseinfoId() {
		return hspConfigBaseinfoId;
	}

	public void setHspConfigBaseinfoId(String hspConfigBaseinfoId) {
		this.hspConfigBaseinfoId = hspConfigBaseinfoId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public String getInputCode() {
		return inputCode;
	}

	public void setInputCode(String inputCode) {
		this.inputCode = inputCode;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public String getCommConfigSexId() {
		return commConfigSexId;
	}

	public void setCommConfigSexId(String commConfigSexId) {
		this.commConfigSexId = commConfigSexId;
	}

//	public String getDateOfBirth() {
//		return dateOfBirth;
//	}
//
//	public void setDateOfBirth(String dateOfBirth) {
//		this.dateOfBirth = dateOfBirth;
//	}

	public String getCommConfigStafftypeId() {
		return commConfigStafftypeId;
	}

	public void setCommConfigStafftypeId(String commConfigStafftypeId) {
		this.commConfigStafftypeId = commConfigStafftypeId;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIslocation() {
		return islocation;
	}

	public void setIslocation(String islocation) {
		this.islocation = islocation;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getHspConfigBaseinfoName() {
		return hspConfigBaseinfoName;
	}

	public void setHspConfigBaseinfoName(String hspConfigBaseinfoName) {
		this.hspConfigBaseinfoName = hspConfigBaseinfoName;
	}

	public String getCommConfigSexName() {
		return commConfigSexName;
	}

	public void setCommConfigSexName(String commConfigSexName) {
		this.commConfigSexName = commConfigSexName;
	}

	public String getCommConfigStafftypeName() {
		return commConfigStafftypeName;
	}

	public void setCommConfigStafftypeName(String commConfigStafftypeName) {
		this.commConfigStafftypeName = commConfigStafftypeName;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}


	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getIslocationName() {
		return islocationName;
	}

	public void setIslocationName(String islocationName) {
		this.islocationName = islocationName;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getCreateDateYear() {
		return createDateYear;
	}

	public void setCreateDateYear(String createDateYear) {
		this.createDateYear = createDateYear;
	}

	public String getCreateDateMonth() {
		return createDateMonth;
	}

	public void setCreateDateMonth(String createDateMonth) {
		this.createDateMonth = createDateMonth;
	}

	public String getCreateDateDay() {
		return createDateDay;
	}

	public void setCreateDateDay(String createDateDay) {
		this.createDateDay = createDateDay;
	}

	
	public String getSeqNo() {
		return seqNo;
	}

	
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStaffType() {
		return staffType;
	}

	public void setStaffType(String staffType) {
		this.staffType = staffType;
	}
	
	

	public void setRegistCode(String registCode) {
		this.registCode = registCode;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStopDate() {
		return stopDate;
	}

	public void setStopDate(String stopDate) {
		this.stopDate = stopDate;
	}


	public String getHspStaffBaseinfoId() {
		return hspStaffBaseinfoId;
	}

	public void setHspStaffBaseinfoId(String hspStaffBaseinfoId) {
		this.hspStaffBaseinfoId = hspStaffBaseinfoId;
	}

	public String getCommConfigStaffChargeTypeId() {
		return commConfigStaffChargeTypeId;
	}

	public void setCommConfigStaffChargeTypeId(String commConfigStaffChargeTypeId) {
		this.commConfigStaffChargeTypeId = commConfigStaffChargeTypeId;
	}

	public String getCommConfigStaffChargeTypeName() {
		return commConfigStaffChargeTypeName;
	}

	public void setCommConfigStaffChargeTypeName(
			String commConfigStaffChargeTypeName) {
		this.commConfigStaffChargeTypeName = commConfigStaffChargeTypeName;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getRegistCode() {
		return registCode;
	}
	

}