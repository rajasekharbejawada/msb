/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.msp.general;

import com.mss.msp.security.SecurityServiceProvider;
import com.mss.msp.util.ApplicationConstants;
import com.mss.msp.util.DataSourceDataProvider;
import com.mss.msp.util.Properties;
import com.mss.msp.util.ServiceLocator;
import com.mss.msp.util.ServiceLocatorException;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 *
 * @author miracle
 */
public class GeneralAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {

	private String resultType;
	private String emailId;
	private String password;
	private String sessionId;
	private String oldpwd;
	private String newpwd;
	private String cnfrmpwd;
	int id;
	// dash board
	private int userSessionId;
	private Map custerMap;
	private List csrDashBoardList;
	private int year;
	private Map vendorMap;
	private String typeOfUser;
	private String currentPwd;
	/**
	 * The resultMessage is used for storing resultMessage.
	 */
	private String resultMessage;
	/**
	 * The httpServletRequest is used for storing httpServletRequest Object.
	 */
	private HttpServletRequest httpServletRequest;
	private HttpServletResponse httpServletResponse;

	private String first_name;
	private String middle_name;
	private String last_name;
	private String phone;
	private String office_Phone;
	private String office_emailId;
	private String address1;
	private String address2;
	private String city;
	private int country;
	private int state1;
	private String zip;
	private String phone2;
	private String fax;
	private String orgName;
	private String org_web_address;
	private String org_address1;
	private String org_address2;
	private String org_city;
	private int org_country;
	private int org_state;
	private String org_zip;
	private String org_fax;
	private String region;
	private String teritory;
	private String noOfEmployees;
	private String title;

	private Map countryList;
	private String home;
	private String email_ext;

	private int regionId;
	private String priSkillId;

	private String businessType;
	private String businessTypeDesc;
	private String minorityGroup;
	private String staffingMode;
	private String venSpecialization;

	private String consultantEmail;
	private String consultantMobile;
	private String consultantFirstName;
	private String consultantLastName;
	private String consultantDob;
	private String consultantSsn;

	private String consultantTitle;
	private File consultantResume;
	private String consultantResumeFileName;
	private String consultantResumeFilePath;
	private String consultantRatePerSalary;
	// private String consultantPhoto;
	private String consultantPrimarySkills;
	private String consultantSecondarySkills;

	private String consultantEducation;
	private String consultantIndustry;
	private String consultantExperience;
	private String consultantWorkingCountry;

	private String consultantPerAddress1;
	private String consultantPerAddress2;
	private String consultantPerCity;
	private String consultantPerCountry;
	private String consultantPerState;
	private String consultantPerZip;

	private String consultantCurAddress1;
	private String consultantCurAddress2;
	private String consultantCurCity;
	private String consultantCurCountry;
	private String consultantCurState;
	private String consultantCurZip;

	private String consultantAddrsFlag;
	private String checkAddress;

	private Map consultantExperienceList;
	private Map consultantIndustryList;
	private Map primarySkillValueList;
	private String regFlag;
	private String usersPrivateKey;

	public String getUsersPrivateKey() {
		return usersPrivateKey;
	}

	public void setUsersPrivateKey(String usersPrivateKey) {
		this.usersPrivateKey = usersPrivateKey;
	}

	public String getRegFlag() {
		return regFlag;
	}

	public void setRegFlag(String regFlag) {
		this.regFlag = regFlag;
	}

	public Map getConsultantExperienceList() {
		return consultantExperienceList;
	}

	public void setConsultantExperienceList(Map consultantExperienceList) {
		this.consultantExperienceList = consultantExperienceList;
	}

	public Map getConsultantIndustryList() {
		return consultantIndustryList;
	}

	public void setConsultantIndustryList(Map consultantIndustryList) {
		this.consultantIndustryList = consultantIndustryList;
	}

	public Map getPrimarySkillValueList() {
		return primarySkillValueList;
	}

	public void setPrimarySkillValueList(Map primarySkillValueList) {
		this.primarySkillValueList = primarySkillValueList;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getBusinessTypeDesc() {
		return businessTypeDesc;
	}

	public void setBusinessTypeDesc(String businessTypeDesc) {
		this.businessTypeDesc = businessTypeDesc;
	}

	public String getMinorityGroup() {
		return minorityGroup;
	}

	public void setMinorityGroup(String minorityGroup) {
		this.minorityGroup = minorityGroup;
	}

	public String getStaffingMode() {
		return staffingMode;
	}

	public void setStaffingMode(String staffingMode) {
		this.staffingMode = staffingMode;
	}

	public String getVenSpecialization() {
		return venSpecialization;
	}

	public void setVenSpecialization(String venSpecialization) {
		this.venSpecialization = venSpecialization;
	}

	public int getRegionId() {
		return regionId;
	}

	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}

	public String getPriSkillId() {
		return priSkillId;
	}

	public void setPriSkillId(String priSkillId) {
		this.priSkillId = priSkillId;
	}

	public GeneralAction() {
	}

	private DataSourceDataProvider dataSourceDataProvider;

	/**
	 * ***********************************************************************
	 *
	 * @dosetPassword() to get the status of the forgot password link status
	 * 
	 *
	 *************************************************************************
	 */

	public String dosetPassword() {

		System.out.println("********************GeneralAction :: dosetPassword Action Start*********************");
		setHome("No");
		try {
			String linkStatus = ServiceLocator.getGeneralService().forGotPwdLinkStatus(getEmailId(), getSessionId());

			if (linkStatus.equalsIgnoreCase("Active")) {
				resultType = SUCCESS;
			} else {
				resultType = "LinkExperied";
			}

		} catch (Exception ex) {

			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());

			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: dosetPassword Action End*********************");
		return resultType;
	}

	/**
	 ************************************************************
	 *
	 * @doResetPassword() to update the password of the user
	 * 
	 *
	 ************************************************************
	 */
	public String doResetPassword() {
		int isUpdated = 0;
		int linkInactive = 0;
		System.out.println("********************GeneralAction :: doResetPassword Action Start*********************");
		try {

			isUpdated = ServiceLocator.getGeneralService().doUpdateResetPassword(getPassword(), getEmailId());
			if (isUpdated > 0) {

				linkInactive = ServiceLocator.getGeneralService().doPasswordLinkStatusUpdate(getEmailId());
				resultType = SUCCESS;
				resultMessage = "Password Updated successfully";
			} else {

				resultType = ERROR;
			}
		} catch (Exception ex) {

			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());

			resultType = ERROR;
		}
		System.out.println("********************GeneralAction :: doResetPassword Action End*********************");

		return resultType;
	}

	/**
	 ***********************************************************
	 *
	 * @doAddRegistration() to get the add registration page
	 * 
	 *
	 ***********************************************************
	 */
	public String doAddRegistration() {
		int isUpdated = 0;
		int linkInactive = 0;
		System.out.println("********************GeneralAction :: doAddRegistration Action Start*********************");

		try {
			resultType = SUCCESS;

		} catch (Exception ex) {

			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());

			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: doAddRegistration Action End*********************");
		return resultType;
	}

	/**
	 ***********************************************************
	 *
	 * @resetUserPassword() to get the reset password page
	 * 
	 *
	 ***********************************************************
	 */
	public String resetUserPassword() {
		int isUpdated = 0;
		System.out.println("********************GeneralAction :: resetUserPassword Action Start*********************");
		resultType = LOGIN;
		try {
			if (httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID) != null) {
				setResultMessage(getResultMessage());
				resultType = SUCCESS;

			}
		} catch (Exception ex) {

			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());

			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: resetUserPassword Action End*********************");
		return resultType;
	}

	/**
	 ***********************************************************
	 *
	 * @changeMyPassword() to get the change my password page
	 * 
	 *
	 ***********************************************************
	 */
	public String changeMyPassword() {
		int isUpdated = 0;
		System.out.println("********************GeneralAction :: changeMyPassword Action Start*********************");
		resultType = LOGIN;
		try {
			if (httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID) != null) {
				setResultMessage(getResultMessage());
				resultType = SUCCESS;
			}
		} catch (Exception ex) {

			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());

			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: changeMyPassword Action End*********************");
		return resultType;
	}

	/**
	 *************************************************
	 *
	 * @doResetMyPassword() to reset password page
	 * 
	 *
	 ************************************************
	 */
	public String doResetMyPassword() {
		int isUpdated = 0;
		int linkInactive = 0;
		System.out.println("********************GeneralAction :: doResetMyPassword Action Start*********************");
		try {

			isUpdated = ServiceLocator.getGeneralService().doUpdateResetPassword(getNewpwd(),
					httpServletRequest.getSession(false).getAttribute(ApplicationConstants.LOGIN_ID).toString());
			if (isUpdated > 0) {
				setResultMessage("Password Updated Successfully");
				resultType = SUCCESS;
			}
		} catch (Exception ex) {

			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());

			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: doResetMyPassword Action End*********************");
		return resultType;
	}

	/**
	 *************************************************
	 *
	 * @doResetUserPassword() to reset user password
	 * 
	 *
	 ************************************************
	 */
	public String doResetUserPassword() {
		int isUpdated = 0;
		int linkInactive = 0;
		System.out
				.println("********************GeneralAction :: doResetUserPassword Action Start*********************");
		try {

			isUpdated = ServiceLocator.getGeneralService().doUpdateResetPassword(getNewpwd(), getEmailId());
			if (isUpdated > 0) {
				setResultMessage("User Password Updated Successfully");
				resultType = SUCCESS;
			} else {
				setResultMessage("Please enter existing user id!");
				resultType = SUCCESS;
			}
		} catch (Exception ex) {

			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());

			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: doResetUserPassword Action End*********************");
		return resultType;
	}

	/**
	 *************************************************
	 *
	 * @dosetSuccessMessage() to set success message
	 * 
	 *
	 ************************************************
	 */
	public String dosetSuccessMessage() {

		System.out
				.println("********************GeneralAction :: dosetSuccessMessage Action Start*********************");
		try {

			setResultMessage(getResultMessage());
			resultType = SUCCESS;

		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: dosetSuccessMessage Action End*********************");
		return resultType;
	}

	/**
	 *************************************************
	 *
	 * @doseterrorMessage() to set error message
	 * 
	 *
	 ************************************************
	 */
	public String doseterrorMessage() {

		System.out.println("********************GeneralAction :: doseterrorMessage Action Start*********************");
		try {

			setResultMessage(getResultMessage());
			resultType = SUCCESS;

		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: doseterrorMessage Action End*********************");
		return resultType;
	}

	public String regerrorDirect() {

		System.out.println("********************GeneralAction :: regerrorDirect Action Start*********************");
		try {

			setResultMessage(getResultMessage());
			resultType = SUCCESS;

		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			resultType = ERROR;
		}

		System.out.println("********************GeneralAction :: regerrorDirect Action End*********************");
		return resultType;
	}

	/**
	 ***********************************************
	 *
	 * @getState() to get the states of country
	 * 
	 *
	 ***********************************************
	 */
	public String getState() {

		System.out.println("********************GeneralAction :: getState Action Start*********************");
		try {

			String states = ServiceLocator.getGeneralService().getStatesOfCountry(httpServletRequest, getId());

			httpServletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			httpServletResponse.setHeader("Pragma", "no-cache");
			httpServletResponse.setDateHeader("Expires", 0);
			httpServletResponse.setContentType("text");
			httpServletResponse.setCharacterEncoding("UTF-8");
			httpServletResponse.getWriter().write(states);

		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			// resultType = ERROR;
		}
		System.out.println("********************GeneralAction :: getState Action End*********************");
		return null;
	}

	/**
	 ***********************************************
	 *
	 * @getStateBasedOnRegion() to get the states of country region wise
	 *
	 *
	 ***********************************************
	 */

	public String getStateBasedOnRegion() {
		System.out.println(
				"********************GeneralAction :: getStateBasedOnRegion Action Start*********************");
		try {
			String states = dataSourceDataProvider.getInstance().getStatesOfCountryBasedOnRegion(getRegionId(),
					getId());
			httpServletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			httpServletResponse.setHeader("Pragma", "no-cache");
			httpServletResponse.setDateHeader("Expires", 0);
			httpServletResponse.setContentType("text");
			httpServletResponse.setCharacterEncoding("UTF-8");
			httpServletResponse.getWriter().write(states);
		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			// resultType = ERROR;
		}
		System.out
				.println("********************GeneralAction :: getStateBasedOnRegion Action End*********************");
		return null;
	}

	/**
	 * *******************************************************************
	 *
	 * @dashBoardDetails() to represent the requirements details for csr
	 * 
	 *
	 *********************************************************************
	 */
	public String dashBoardDetails() throws ServiceLocatorException {
		String resulttype = LOGIN;
		System.out.println("********************GeneralAction :: dashBoardDetails Action Start*********************");
		if (httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID) != null) {
			setUserSessionId(Integer.parseInt(
					httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID).toString()));
			setTypeOfUser(
					httpServletRequest.getSession(false).getAttribute(ApplicationConstants.TYPE_OF_USER).toString());
			setCusterMap(
					com.mss.msp.util.DataSourceDataProvider.getInstance().customerList(typeOfUser, getUserSessionId()));
			setVendorMap(com.mss.msp.util.DataSourceDataProvider.getInstance().getVendorList());
			csrDashBoardList = (ServiceLocator.getGeneralService().getDefaultRequirementDashBoardDetails(this));

			setYear(Calendar.getInstance().get(Calendar.YEAR));
			resulttype = SUCCESS;
		}
		System.out.println("********************GeneralAction :: dashBoardDetails Action End*********************");
		return resulttype;
	}

	/**
	 * *************************************
	 *
	 * @resetEmailVerify() to verify the email for password reset
	 *
	 *
	 * @Author:Aklakh Ahmad<mahmad@miraclesoft.com>
	 *
	 * @Created Date:07/15/2015
	 *
	 **************************************
	 */
	public String resetEmailVerify() throws ServiceLocatorException {
		String resulttype = LOGIN;
		int result = 0;
		System.out.println("********************GeneralAction :: resetEmailVerify Action Start*********************");
		if (httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID) != null) {

			try {
				result = DataSourceDataProvider.getInstance().checkResetEmailId(getEmailId(), Integer.parseInt(
						httpServletRequest.getSession(false).getAttribute(ApplicationConstants.ORG_ID).toString()));

				httpServletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				httpServletResponse.setHeader("Pragma", "no-cache");
				httpServletResponse.setDateHeader("Expires", 0);
				if (result == 0) {
					httpServletResponse.setContentType("text");
					httpServletResponse.setCharacterEncoding("UTF-8");
					httpServletResponse.getWriter().write(SUCCESS);
				} else {
					httpServletResponse.setContentType("text");
					httpServletResponse.setCharacterEncoding("UTF-8");
					httpServletResponse.getWriter().write(ERROR);
				}
				System.err.println("resultString---->" + result);

			} catch (Exception ex) {
				httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			}
		}
		System.out.println("********************GeneralAction :: resetEmailVerify Action End*********************");
		return null;
	}

	/**
	 * *************************************
	 *
	 * @verfiyCurrentPassword() to verify the current password for password
	 *                          reset
	 *
	 * @Author:Aklakh Ahmad<mahmad@miraclesoft.com>
	 *
	 * @Created Date:09/11/2015
	 *
	 **************************************
	 */
	public String verfiyCurrentPassword() throws ServiceLocatorException {
		System.out.println(
				"********************GeneralAction :: verfiyCurrentPassword Action Start*********************");
		String resulttype = LOGIN;
		int result = 0;

		if (httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID) != null) {
			setUserSessionId((Integer.parseInt(
					httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID).toString())));
			try {
				result = ServiceLocator.getGeneralService().verifyCurrentPassword(this);

				if (result > 0) {
					httpServletResponse.setContentType("text");
					httpServletResponse.setCharacterEncoding("UTF-8");
					httpServletResponse.getWriter().write(SUCCESS);
				} else {
					httpServletResponse.setContentType("text");
					httpServletResponse.setCharacterEncoding("UTF-8");
					httpServletResponse.getWriter().write(ERROR);
				}
				httpServletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				httpServletResponse.setHeader("Pragma", "no-cache");
				httpServletResponse.setDateHeader("Expires", 0);

			} catch (Exception ex) {
				httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			}
		}
		System.out
				.println("********************GeneralAction :: verfiyCurrentPassword Action End*********************");
		return null;
	}

	/**
	 ********************************************************
	 *
	 * @register() to get the vendor registration page
	 * 
	 *
	 ********************************************************
	 */
	public String register() {
		System.out.println("********************GeneralAction :: register Action Start*********************");
		try {
			setCountryList(ServiceLocator.getLocationService().getCountriesNamesMap());

			resultType = SUCCESS;

		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			resultType = ERROR;
		}
		System.out.println("********************GeneralAction :: register Action End*********************");
		return resultType;
	}

	public String UserRegistration() {
		System.out.println("********************GeneralAction :: UserRegistration Action Start*********************");
		try {
			String result = ServiceLocator.getGeneralService().UserRegistration(this);

			setHome("Logout");
			if ("Added successfully".equalsIgnoreCase(result)) {
				setResultMessage(getFirst_name() + "." + getLast_name());
				String from = com.mss.msp.util.Properties.getProperty("MSB.from").toString();

				addActionMessage("Your account " + getOrgName()
						+ " is in a pending status and must now be approved.This should happen within the next few days.In case of any problems or not being able to login please contact "
						+ from);
				resultType = SUCCESS;
			} else {
				setResultMessage("Not Registered !!");
				resultType = ERROR;
			}
		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			setResultMessage("Error Occured");
			setHome("null");
			resultType = ERROR;
		}
		System.out.println("********************GeneralAction :: UserRegistration Action End*********************");
		return resultType;
	}

	/**
	 ***********************************************************
	 *
	 * @doMailExtensionVerify() to verify the email extension
	 * 
	 *
	 ***********************************************************
	 */
	public String doMailExtensionVerify() throws ServiceLocatorException {

		System.out.println(
				"********************GeneralAction :: doMailExtensionVerify Action start*********************");
		int result = 0;
		try {
			result = DataSourceDataProvider.getInstance().doMailExtensionVerify(getEmail_ext());

			httpServletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			httpServletResponse.setHeader("Pragma", "no-cache");
			httpServletResponse.setDateHeader("Expires", 0);
			httpServletResponse.setContentType("text");
			httpServletResponse.setCharacterEncoding("UTF-8");
			if (result > 0) {
				httpServletResponse.getWriter().write("Exist");
			} else {
				httpServletResponse.getWriter().write("Not Exist");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out
				.println("********************GeneralAction :: doMailExtensionVerify Action End*********************");
		return null;
	}

	/**
	 ***********************************************
	 *
	 * @getSkillsBasedOnPrimarySkill() to get the skills of primary role
	 *
	 *
	 ***********************************************
	 */

	public String getSkillsBasedOnPrimarySkill() {
		System.out.println(
				"********************GeneralAction :: getSkillsBasedOnPrimarySkill Action Start*********************");
		try {
			String skills = dataSourceDataProvider.getInstance().getSkillsBasedOnPrimarySkill(getPriSkillId());
			System.out.println("skillbasedonPrimamrySkill---->" + skills);
			httpServletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			httpServletResponse.setHeader("Pragma", "no-cache");
			httpServletResponse.setDateHeader("Expires", 0);
			httpServletResponse.setContentType("text");
			httpServletResponse.setCharacterEncoding("UTF-8");
			httpServletResponse.getWriter().write(skills);
		} catch (Exception ex) {
			httpServletRequest.getSession(false).setAttribute("errorMessage:", ex.toString());
			// resultType = ERROR;
		}
		System.out.println(
				"********************GeneralAction :: getSkillsBasedOnPrimarySkill Action End*********************");
		return null;
	}

	public String consultantregister() {

		System.out.println("********************GeneralAction :: consultantregister  Start*********************");
		try {
			setCountryList(ServiceLocator.getLocationService().getCountriesNamesMap());
			setConsultantIndustryList(ServiceLocator.getLookUpHandlerService().getIndustryTypesMap());
			setConsultantExperienceList(DataSourceDataProvider.getInstance().getYearsOfExp());
			setPrimarySkillValueList(DataSourceDataProvider.getInstance().getRequiteCategory(1));

			resultType = SUCCESS;

		} catch (Exception ex) {
			// httpServletRequest.getSession(false).setAttribute("errorMessage:",
			// ex.toString());
			resultType = ERROR;
		}
		System.out.println("********************GeneralAction :: consultantregister  End*********************");
		return resultType;

	}

	/**
	 * *************************************
	 *
	 * consultantRegistration() is to Register consultant reset
	 *
	 * @Author:Manikanta Eeralla <meeralla@miraclesoft.com>
	 *
	 * @Created Date:03/21/2017
	 *
	 **************************************
	 */
	public String doConsultantRegistration() {
		System.out.println(
				"********************GeneralAction :: Consultant Registration Action Start*********************");
		try {

			if (getConsultantResumeFileName() == null) {
			} else {
				consultantResumeFilePath = Properties.getProperty("Task.Attachment");
				//RandomStringUtils().radom(24);
				setUsersPrivateKey(SecurityServiceProvider.getSecretAESKeyAsString());
				//System.out.println("getUserPrivateKey()-->"+getUsersPrivateKey());
				//System.out.println("consultantResume-->"+consultantResume);
				setConsultantResumeFilePath(DataSourceDataProvider.getInstance()
						.createFileInFileSystem(consultantResumeFilePath,consultantResumeFileName,consultantResume,getUsersPrivateKey()));
				//System.out.println("getConsultantResumeFilePath-->"+getConsultantResumeFilePath());
				/*
				 * File createPath = new File(consultantResumeFilePath); Date dt
				 * = new Date();
				 * 
				 * String month = ""; if (dt.getMonth() == 0) { month = "Jan"; }o
				 * else if (dt.getMonth() == 1) { month = "Feb"; } else if
				 * (dt.getMonth() == 2) { month = "Mar"; } else if
				 * (dt.getMonth() == 3) { month = "Apr"; } else if
				 * (dt.getMonth() == 4) { month = "May"; } else if
				 * (dt.getMonth() == 5) { month = "Jun"; } else if
				 * (dt.getMonth() == 6) { month = "Jul"; } else if
				 * (dt.getMonth() == 7) { month = "Aug"; } else if
				 * (dt.getMonth() == 8) { month = "Sep"; } else if
				 * (dt.getMonth() == 9) { month = "Oct"; } else if
				 * (dt.getMonth() == 10) { month = "Nov"; } else if
				 * (dt.getMonth() == 11) { month = "Dec"; } short week = (short)
				 * (Math.round(dt.getDate() / 7));
				 * 
				 * createPath = new File(createPath.getAbsolutePath() +
				 * File.separator + String.valueOf(dt.getYear() + 1900) +
				 * File.separator + month + File.separator +
				 * String.valueOf(week)); createPath.mkdir();
				 * 
				 * File theFile = new File(createPath.getAbsolutePath());
				 * setConsultantResumeFilePath(theFile.toString());
				 * 
				 * File destFile = new File(theFile + File.separator +
				 * consultantResumeFileName);
				 * FileUtils.copyFile(consultantResume, destFile);
				 */
			}

			
		
			String result = ServiceLocator.getGeneralService().consultantRegistration(this);

			 setHome("No");
			if ("success".equalsIgnoreCase(result)) {
				// setResultMessage(getFirst_name()+"."+getLast_name());
				String from = com.mss.msp.util.Properties.getProperty("MSB.from").toString();

				//addActionMessage(
				//		"Congratulations! Your registration completed successfully. In case of any problems or not being able to login Please contact "
				//				+ from);
				
				//addActionMessage("<h3 style='color: #188DD0'><i class='fa fa-thumbs-o-up' aria-hidden='true'> </i>Congratulations!</h3>Your registration completed successfully. In case of any problems or not being able to login<br> Please contact <b>"+ from+"</b>");
				addActionMessage("<h1 style='color: #188DD0'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>Congratulations!</h1><p style='font-size: 16px;'>Your registration completed successfully. In case of any problems or not being able to login<br> Please contact: <a href='mailto:"+from+"' target='_top'>"+from+"</a></p>");
												
				resultType = SUCCESS;
			} else {
				System.out.println("Error in Consultant Reg");
				// setResultMessage("Not Registered !! Please Try Later.");
				addActionMessage("Not Registered !! Please Try Later.");
				resultType = ERROR;
			}
		} catch (Exception ex) {
			System.out.println("Error in Consultant Reg Catch-->"+ex.getStackTrace());
			System.out.println("Error in Consultant Reg Catch-->"+ex.getMessage());
			// httpServletRequest.getSession(false).setAttribute("errorMessage:",
			// ex.toString());
			// setResultMessage("Error Occured");
			addActionMessage("Error Occured.");
			 setHome("null");
			resultType = ERROR;
		}
		System.out.println(
				"********************GeneralAction :: Consultant Registration Action End*********************");
		return resultType;
	}

	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}

	/**
	 *
	 * This method is used to set the Servlet Response
	 *
	 * @param httpServletResponse
	 */
	public void setServletResponse(HttpServletResponse httpServletResponse) {
		this.httpServletResponse = httpServletResponse;
	}

	public String getResultMessage() {
		return resultMessage;
	}

	/**
	 * @return the emailId
	 */
	public String getEmailId() {
		return emailId;
	}

	/**
	 * @param emailId
	 *            the emailId to set
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}

	public String resetPwd() {

		// System.out.println("::::in resetPwd:::");
		// System.out.println("::::getpwd :::"+getPwd());

		return "success";
	}

	/**
	 * @return the sessionId
	 */
	public String getSessionId() {
		return sessionId;
	}

	/**
	 * @param sessionId
	 *            the sessionId to set
	 */
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getCnfrmpwd() {
		return cnfrmpwd;
	}

	public void setCnfrmpwd(String cnfrmpwd) {
		this.cnfrmpwd = cnfrmpwd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserSessionId() {
		return userSessionId;
	}

	public void setUserSessionId(int userSessionId) {
		this.userSessionId = userSessionId;
	}

	public Map getCusterMap() {
		return custerMap;
	}

	public void setCusterMap(Map custerMap) {
		this.custerMap = custerMap;
	}

	public List getCsrDashBoardList() {
		return csrDashBoardList;
	}

	public void setCsrDashBoardList(List csrDashBoardList) {
		this.csrDashBoardList = csrDashBoardList;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public Map getVendorMap() {
		return vendorMap;
	}

	public void setVendorMap(Map vendorMap) {
		this.vendorMap = vendorMap;
	}

	public String getTypeOfUser() {
		return typeOfUser;
	}

	public void setTypeOfUser(String typeOfUser) {
		this.typeOfUser = typeOfUser;
	}

	public String getCurrentPwd() {
		return currentPwd;
	}

	public void setCurrentPwd(String currentPwd) {
		this.currentPwd = currentPwd;
	}

	public String getResultType() {
		return resultType;
	}

	public void setResultType(String resultType) {
		this.resultType = resultType;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOffice_Phone() {
		return office_Phone;
	}

	public void setOffice_Phone(String office_Phone) {
		this.office_Phone = office_Phone;
	}

	public String getOffice_emailId() {
		return office_emailId;
	}

	public void setOffice_emailId(String office_emailId) {
		this.office_emailId = office_emailId;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getState1() {
		return state1;
	}

	public void setState1(int state1) {
		this.state1 = state1;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrg_web_address() {
		return org_web_address;
	}

	public void setOrg_web_address(String org_web_address) {
		this.org_web_address = org_web_address;
	}

	public String getOrg_address1() {
		return org_address1;
	}

	public void setOrg_address1(String org_address1) {
		this.org_address1 = org_address1;
	}

	public String getOrg_address2() {
		return org_address2;
	}

	public void setOrg_address2(String org_address2) {
		this.org_address2 = org_address2;
	}

	public String getOrg_city() {
		return org_city;
	}

	public void setOrg_city(String org_city) {
		this.org_city = org_city;
	}

	public int getOrg_country() {
		return org_country;
	}

	public void setOrg_country(int org_country) {
		this.org_country = org_country;
	}

	public int getOrg_state() {
		return org_state;
	}

	public void setOrg_state(int org_state) {
		this.org_state = org_state;
	}

	public String getOrg_zip() {
		return org_zip;
	}

	public void setOrg_zip(String org_zip) {
		this.org_zip = org_zip;
	}

	public String getOrg_fax() {
		return org_fax;
	}

	public void setOrg_fax(String org_fax) {
		this.org_fax = org_fax;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getTeritory() {
		return teritory;
	}

	public void setTeritory(String teritory) {
		this.teritory = teritory;
	}

	public String getNoOfEmployees() {
		return noOfEmployees;
	}

	public void setNoOfEmployees(String noOfEmployees) {
		this.noOfEmployees = noOfEmployees;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Map getCountryList() {
		return countryList;
	}

	public void setCountryList(Map countryList) {
		this.countryList = countryList;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getEmail_ext() {
		return email_ext;
	}

	public void setEmail_ext(String email_ext) {
		this.email_ext = email_ext;
	}

	public String getConsultantEmail() {
		return consultantEmail;
	}

	public void setConsultantEmail(String consultantEmail) {
		this.consultantEmail = consultantEmail;
	}

	public String getConsultantMobile() {
		return consultantMobile;
	}

	public void setConsultantMobile(String consultantMobile) {
		this.consultantMobile = consultantMobile;
	}

	public String getConsultantFirstName() {
		return consultantFirstName;
	}

	public void setConsultantFirstName(String consultantFirstName) {
		this.consultantFirstName = consultantFirstName;
	}

	public String getConsultantLastName() {
		return consultantLastName;
	}

	public void setConsultantLastName(String consultantLastName) {
		this.consultantLastName = consultantLastName;
	}

	public File getConsultantResume() {
		return consultantResume;
	}

	public void setConsultantResume(File consultantResume) {
		this.consultantResume = consultantResume;
	}

	public String getConsultantPrimarySkills() {
		return consultantPrimarySkills;
	}

	public void setConsultantPrimarySkills(String consultantPrimarySkills) {
		this.consultantPrimarySkills = consultantPrimarySkills;
	}

	public String getConsultantEducation() {
		return consultantEducation;
	}

	public void setConsultantEducation(String consultantEducation) {
		this.consultantEducation = consultantEducation;
	}

	public String getConsultantIndustry() {
		return consultantIndustry;
	}

	public void setConsultantIndustry(String consultantIndustry) {
		this.consultantIndustry = consultantIndustry;
	}

	public String getConsultantExperience() {
		return consultantExperience;
	}

	public void setConsultantExperience(String consultantExperience) {
		this.consultantExperience = consultantExperience;
	}

	public String getConsultantWorkingCountry() {
		return consultantWorkingCountry;
	}

	public void setConsultantWorkingCountry(String consultantWorkingCountry) {
		this.consultantWorkingCountry = consultantWorkingCountry;
	}

	public String getConsultantPerAddress1() {
		return consultantPerAddress1;
	}

	public void setConsultantPerAddress1(String consultantPerAddress1) {
		this.consultantPerAddress1 = consultantPerAddress1;
	}

	public String getConsultantPerAddress2() {
		return consultantPerAddress2;
	}

	public void setConsultantPerAddress2(String consultantPerAddress2) {
		this.consultantPerAddress2 = consultantPerAddress2;
	}

	public String getConsultantPerCity() {
		return consultantPerCity;
	}

	public void setConsultantPerCity(String consultantPerCity) {
		this.consultantPerCity = consultantPerCity;
	}

	public String getConsultantPerCountry() {
		return consultantPerCountry;
	}

	public void setConsultantPerCountry(String consultantPerCountry) {
		this.consultantPerCountry = consultantPerCountry;
	}

	public String getConsultantPerState() {
		return consultantPerState;
	}

	public void setConsultantPerState(String consultantPerState) {
		this.consultantPerState = consultantPerState;
	}

	public String getConsultantPerZip() {
		return consultantPerZip;
	}

	public void setConsultantPerZip(String consultantPerZip) {
		this.consultantPerZip = consultantPerZip;
	}

	public String getConsultantCurAddress1() {
		return consultantCurAddress1;
	}

	public void setConsultantCurAddress1(String consultantCurAddress1) {
		this.consultantCurAddress1 = consultantCurAddress1;
	}

	public String getConsultantCurAddress2() {
		return consultantCurAddress2;
	}

	public void setConsultantCurAddress2(String consultantCurAddress2) {
		this.consultantCurAddress2 = consultantCurAddress2;
	}

	public String getConsultantCurCity() {
		return consultantCurCity;
	}

	public void setConsultantCurCity(String consultantCurCity) {
		this.consultantCurCity = consultantCurCity;
	}

	public String getConsultantCurCountry() {
		return consultantCurCountry;
	}

	public void setConsultantCurCountry(String consultantCurCountry) {
		this.consultantCurCountry = consultantCurCountry;
	}

	public String getConsultantCurState() {
		return consultantCurState;
	}

	public void setConsultantCurState(String consultantCurState) {
		this.consultantCurState = consultantCurState;
	}

	public String getConsultantCurZip() {
		return consultantCurZip;
	}

	public void setConsultantCurZip(String consultantCurZip) {
		this.consultantCurZip = consultantCurZip;
	}

	public String getConsultantSecondarySkills() {
		return consultantSecondarySkills;
	}

	public void setConsultantSecondarySkills(String consultantSecondarySkills) {
		this.consultantSecondarySkills = consultantSecondarySkills;
	}

	public String getConsultantDob() {
		return consultantDob;
	}

	public void setConsultantDob(String consultantDob) {
		this.consultantDob = consultantDob;
	}

	public String getConsultantTitle() {
		return consultantTitle;
	}

	public void setConsultantTitle(String consultantTitle) {
		this.consultantTitle = consultantTitle;
	}

	public String getConsultantSsn() {
		return consultantSsn;
	}

	public void setConsultantSsn(String consultantSsn) {
		this.consultantSsn = consultantSsn;
	}

	public String getConsultantRatePerSalary() {
		return consultantRatePerSalary;
	}

	public void setConsultantRatePerSalary(String consultantRatePerSalary) {
		this.consultantRatePerSalary = consultantRatePerSalary;
	}

	public String getConsultantResumeFileName() {
		return consultantResumeFileName;
	}

	public void setConsultantResumeFileName(String consultantResumeFileName) {
		this.consultantResumeFileName = consultantResumeFileName;
	}

	public String getConsultantResumeFilePath() {
		return consultantResumeFilePath;
	}

	public void setConsultantResumeFilePath(String consultantResumeFilePath) {
		this.consultantResumeFilePath = consultantResumeFilePath;
	}

	public String getConsultantAddrsFlag() {
		return consultantAddrsFlag;
	}

	public void setConsultantAddrsFlag(String consultantAddrsFlag) {
		this.consultantAddrsFlag = consultantAddrsFlag;
	}

	public String getCheckAddress() {
		return checkAddress;
	}

	public void setCheckAddress(String checkAddress) {
		this.checkAddress = checkAddress;
	}

}
