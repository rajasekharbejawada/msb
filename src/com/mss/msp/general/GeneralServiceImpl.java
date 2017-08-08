package com.mss.msp.general;

import com.mss.msp.general.GeneralService;
import com.mss.msp.security.SecurityServiceProvider;
import com.mss.msp.util.ApplicationConstants;
import com.mss.msp.util.ConnectionProvider;
import com.mss.msp.util.DataSourceDataProvider;
import com.mss.msp.util.HibernateServiceLocator;
import com.mss.msp.util.ServiceLocatorException;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.util.Iterator;
import java.util.Random;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.sql.CallableStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import com.mss.msp.util.Properties;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class GeneralServiceImpl implements GeneralService {

	Connection connection = null;
	CallableStatement callableStatement = null;
	PreparedStatement preparedStatement = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String queryString = "";

	/**
	 * Creates a new instance of GeneralServiceIml
	 */
	public GeneralServiceImpl() {
	}

	public String generateUserId(String mailId) {

		/* @param atOccurance is used to store index of mailId upto @ char */
		int atOccurance = mailId.indexOf("@");

		/* finally those string return here */
		return mailId.substring(0, atOccurance).toLowerCase();
	}

	/**
	 * *****************************************************************************
	 *
	 *
	 * doUpdateResetPassword() method to reset the password
	 *
	 *
	 * *****************************************************************************
	 */
	public int doUpdateResetPassword(String password, String email) throws ServiceLocatorException {

		System.out.println(
				"********************GeneralServiceImpl :: doUpdateResetPassword Method Start*********************");

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String queryString = "";

		int isUpdated = 0;
		String hexa16digitSalt = SecurityServiceProvider.generateRandamSecurityKey(16, 16, 4, 4, 4);

		String encPwd = SecurityServiceProvider.getEncrypt(password.trim(), hexa16digitSalt);

		queryString = "UPDATE usr_reg SET password=?,salt=? WHERE login_id=?";
		System.out.println("doUpdateResetPassword**************queryString---->" + queryString);
		try {
			connection = ConnectionProvider.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(queryString);

			preparedStatement.setString(1, encPwd);
			preparedStatement.setString(2, hexa16digitSalt);
			preparedStatement.setString(3, email);

			isUpdated = preparedStatement.executeUpdate();

		} catch (SQLException se) {

			throw new ServiceLocatorException(se);
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException se) {

				throw new ServiceLocatorException(se);
			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: doUpdateResetPassword Method End*********************");
		return isUpdated;
	}

	/**
	 * ****************************************************************
	 *
	 *
	 * doPasswordLinkStatusUpdate() method to reset the password
	 *
	 *
	 * ****************************************************************
	 */
	public int doPasswordLinkStatusUpdate(String email) throws ServiceLocatorException {

		System.out.println(
				"********************GeneralServiceImpl :: doPasswordLinkStatusUpdate Method Start*********************");
		int isUpdated = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String queryString = "UPDATE forgotpasswordlink SET status = ? WHERE email_id = ?";
		System.out.println("doPasswordLinkStatusUpdate**************queryString---->" + queryString);
		try {
			connection = ConnectionProvider.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(queryString);

			preparedStatement.setString(1, "InActive");
			preparedStatement.setString(2, email.trim());

			isUpdated = preparedStatement.executeUpdate();

		} catch (SQLException se) {
			throw new ServiceLocatorException(se);
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException se) {

				throw new ServiceLocatorException(se);

			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: doPasswordLinkStatusUpdate Method End*********************");
		return isUpdated;
	}

	/**
	 * ****************************************************************
	 *
	 *
	 * forGotPwdLinkStatus() method to get the password link status
	 *
	 *
	 * ****************************************************************
	 */
	public String forGotPwdLinkStatus(String mailId, String ssid) throws ServiceLocatorException {

		System.out.println(
				"********************GeneralServiceImpl :: forGotPwdLinkStatus Method Start*********************");

		String curStatus = "";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = ConnectionProvider.getInstance().getConnection();
		String queryString = "SELECT status FROM forgotpasswordlink WHERE email_id like '" + mailId + "' and code ='"
				+ ssid + "'";
		System.out.println("forGotPwdLinkStatus**************queryString---->" + queryString);
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);
			while (resultSet.next()) {
				curStatus = resultSet.getString("status");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {

			try {
				// resultSet Object Checking if it's null then close and set
				// null
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}

				if (statement != null) {
					statement.close();
					statement = null;
				}

				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException ex) {
				throw new ServiceLocatorException(ex);
			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: forGotPwdLinkStatus Method End*********************");
		return curStatus;
	}

	/**
	 * ****************************************************************
	 *
	 *
	 * getPrimaryAction() method to get the primary action
	 *
	 *
	 * ****************************************************************
	 */
	public String getPrimaryAction(int orgId, int roleId) throws ServiceLocatorException {
		String action = "";
		System.out.println(
				"********************GeneralServiceImpl :: getPrimaryAction Method Start*********************");
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";
		try {

			queryString = " SELECT action_name from home_redirect_action where org_id=" + orgId + " and primaryrole="
					+ roleId;
			System.out.println("getPrimaryAction**************queryString---->" + queryString);
			connection = ConnectionProvider.getInstance().getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);
			while (resultSet.next()) {
				action = resultSet.getString("action_name");
			}

		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (statement != null) {
					statement.close();
					statement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		System.out
				.println("********************GeneralServiceImpl :: getPrimaryAction Method End*********************");
		return action;
	}

	/**
	 * *****************************************************************************
	 * Date : April 28 2015
	 *
	 * Author : jagan chukkala<jchukkala@miraclesoft.com>
	 *
	 * getCountriesNames() method can be used to get the countries And returns
	 * countries Map
	 * *****************************************************************************
	 */
	public Map getCountriesNames() {
		System.out.println(
				"********************GeneralServiceImpl :: getCountriesNames Method Start*********************");
		Map countries = new LinkedHashMap();
		Session session = null;
		try {
			session = HibernateServiceLocator.getInstance().getSession();

			String hqlQuery = "select cv.id,cv.name from CountryVto cv";
			System.out.println("getCountriesNames**************hqlQuery---->" + hqlQuery);
			Query query = session.createQuery(hqlQuery);
			List list = query.list();
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				Object[] o = (Object[]) iterator.next();
				countries.put(o[0], o[1]);
			}
		} catch (ServiceLocatorException e) {
			e.printStackTrace();
		} finally {

			if (session != null) {
				session.close();

				if (session.isOpen()) {
					try {
						session.flush();
						session.close();
						session = null;
					} catch (HibernateException he) {
						he.printStackTrace();
					}
				}
			}
		}
		System.out
				.println("********************GeneralServiceImpl :: getCountriesNames Method End*********************");
		return countries;
	}

	/**
	 * *****************************************************************************
	 * Date : April 29 2015
	 *
	 * Author : jagan chukkala<jchukkala@miraclesoft.com>
	 *
	 * getStatesOfCountry() method can be used to get the states by passing
	 * country id And returns resultString
	 * *****************************************************************************
	 */
	public Map getStatesMapOfCountry(HttpServletRequest httpServletRequest, int id) {
		System.out.println(
				"********************GeneralServiceImpl :: getStatesMapOfCountry Method Start*********************");
		Map states = new LinkedHashMap();
		String resultString = "";
		Session session = null;

		try {
			session = HibernateServiceLocator.getInstance().getSession();

			String hqlQuery = "select id,name from State  WHERE countryId=:countryid";
			System.out.println("getStatesMapOfCountry**************hqlQuery---->" + hqlQuery);
			Query query = session.createQuery(hqlQuery);
			query.setInteger("countryid", id);
			List list = query.list();
			Iterator iterator = list.iterator();

			while (iterator.hasNext()) {
				Object[] o = (Object[]) iterator.next();

				states.put(o[0], o[1]);

			}

		} catch (ServiceLocatorException e) {
			System.out.println(e);
		} finally {

			if (session != null) {
				session.close();

				if (session.isOpen()) {
					try {
						session.flush();
						session.close();
						session = null;
					} catch (HibernateException he) {
						he.printStackTrace();
					}
				}
			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: getStatesMapOfCountry Method End*********************");
		return states;
	}

	/**
	 * ****************************************************************
	 *
	 *
	 * getStatesStringOfCountry() method to get the states of country
	 *
	 *
	 * ****************************************************************
	 */
	public String getStatesStringOfCountry(HttpServletRequest httpServletRequest, int id) {
		Map states = new LinkedHashMap();
		String resultString = "";
		Session session = null;
		System.out.println(
				"********************GeneralServiceImpl :: getStatesStringOfCountry Method Start*********************");
		try {
			session = HibernateServiceLocator.getInstance().getSession();

			String hqlQuery = "select id,name from State  WHERE countryId=:countryid";
			System.out.println("getStatesStringOfCountry**************hqlQuery---->" + hqlQuery);
			Query query = session.createQuery(hqlQuery);
			query.setInteger("countryid", id);
			List list = query.list();
			Iterator iterator = list.iterator();

			while (iterator.hasNext()) {
				Object[] o = (Object[]) iterator.next();

				resultString += o[0] + "#" + o[1] + "^";

			}

		} catch (ServiceLocatorException e) {
			System.out.println(e);
		} finally {
			// Closing hibernate session
			if (session != null) {
				session.close();

				if (session.isOpen()) {
					try {
						session.flush();
						session.close();
						session = null;
					} catch (HibernateException he) {
						he.printStackTrace();
					}
				}
			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: getStatesStringOfCountry Method End*********************");
		return resultString;
	}

	/**
	 * ****************************************************************
	 *
	 *
	 * getStatesOfCountry() method to get the states of country
	 *
	 *
	 * ****************************************************************
	 */
	public String getStatesOfCountry(HttpServletRequest httpServletRequest, int id) {
		System.out.println(
				"********************GeneralServiceImpl :: getStatesOfCountry Method Start*********************");
		Map states = new LinkedHashMap();
		String resultString = "";
		Session session = null;

		try {
			session = HibernateServiceLocator.getInstance().getSession();

			String hqlQuery = "select id,name from State s WHERE countryId=:countryid order by s.name asc";
			System.out.println("getStatesStringOfCountry**************hqlQuery---->" + hqlQuery);

			Query query = session.createQuery(hqlQuery);
			query.setInteger("countryid", id);
			List list = query.list();
			Iterator iterator = list.iterator();

			while (iterator.hasNext()) {
				Object[] o = (Object[]) iterator.next();

				resultString += o[0] + "#" + o[1] + "^";

			}

		} catch (ServiceLocatorException e) {
			System.out.println(e);
		} finally {
			// Closing hibernate session
			if (session != null) {
				session.close();

				if (session.isOpen()) {
					try {
						session.flush();
						session.close();
						session = null;
					} catch (HibernateException he) {
						he.printStackTrace();
					}
				}
			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: getStatesOfCountry Method End*********************");
		return resultString;
	}

	/**
	 * *************************************
	 *
	 * @getDefaultRequirementDashBoardDetails() update status in requirement
	 *                                          table
	 *
	 *
	 * @Author:ramakrishna<lankireddy@miraclesoft.com>
	 *
	 * @Created Date:06/03/2015
	 *
	 **************************************
	 */
	public List getDefaultRequirementDashBoardDetails(GeneralAction generalAction) throws ServiceLocatorException {
		System.out.println(
				"********************GeneralServiceImpl :: getDefaultRequirementDashBoardDetails Method Start*********************");
		String resultString = "";
		ArrayList<CsrDashBoardVTO> csrDashBoardList = new ArrayList<CsrDashBoardVTO>();
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";
		try {
			int year = Calendar.getInstance().get(Calendar.YEAR);
			connection = ConnectionProvider.getInstance().getConnection();
			if (generalAction.getTypeOfUser().equalsIgnoreCase("SA")) {
				queryString = "SELECT COUNT(requirement_id) AS total," + "COUNT(IF(req_status='O',1, NULL)) 'Open',"
						+ "COUNT(IF(req_status='R',1, NULL)) 'Released',"
						+ "COUNT(IF(req_status='C',1, NULL)) 'Closed'," + "a.account_name,a.account_id "
						+ "FROM acc_requirements " + "LEFT OUTER JOIN accounts a ON(a.account_id=acc_id) "
						+ "WHERE DATE_FORMAT(req_st_date,'%Y')=" + year + " " + "GROUP BY a.account_id";
			} else {
				queryString = "SELECT COUNT(requirement_id) AS total," + "COUNT(IF(req_status='O',1, NULL)) 'Open',"
						+ "COUNT(IF(req_status='R',1, NULL)) 'Released',"
						+ "COUNT(IF(req_status='C',1, NULL)) 'Closed'," + "a.account_name,a.account_id "
						+ "FROM acc_requirements " + "LEFT OUTER JOIN accounts a ON(a.account_id=acc_id) "
						+ "LEFT OUTER JOIN csrorgrel csr ON(a.account_id=csr.org_id)"
						+ "WHERE DATE_FORMAT(req_st_date,'%Y')=" + year + " " + "AND csr.STATUS = 'active'"
						+ "AND csr.csr_id=" + generalAction.getUserSessionId() + " " + "GROUP BY a.account_id";
			}

			System.out.println("getDefaultRequirementDashBoardDetails**************queryString---->" + queryString);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);
			while (resultSet.next()) {
				CsrDashBoardVTO csrDashBoardVTO = new CsrDashBoardVTO();
				csrDashBoardVTO.setTotal(resultSet.getString("total"));
				csrDashBoardVTO.setOpen(resultSet.getString("Open"));
				csrDashBoardVTO.setReleased(resultSet.getString("Released"));
				csrDashBoardVTO.setClosed(resultSet.getString("Closed"));
				csrDashBoardVTO.setCustomerName(resultSet.getString("account_name"));
				csrDashBoardVTO.setAccountId(resultSet.getString("account_id"));
				csrDashBoardList.add(csrDashBoardVTO);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (statement != null) {
					statement.close();
					statement = null;
				}

				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: getDefaultRequirementDashBoardDetails Method End*********************");
		return csrDashBoardList;
	}

	/**
	 * *************************************
	 *
	 * @verifyCurrentPassword() This method is used to verify the current
	 *                          password
	 * @Author:Aklakh Ahmad<mahmad@miraclesoft.com>
	 *
	 * @Created Date:09/11/2015
	 *
	 **************************************
	 */
	public int verifyCurrentPassword(GeneralAction generalAction) throws ServiceLocatorException {

		System.out.println(
				"********************GeneralServiceImpl :: verifyCurrentPassword Method Start*********************");
		int count = 0;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";

		String curPwd = "";
		String pwdSalt = "";

		queryString = "SELECT usr_id, salt,PASSWORD  from usr_reg where  usr_id=" + generalAction.getUserSessionId();
		System.out.println("verifyCurrentPassword**************queryString---->" + queryString);
		try {
			connection = ConnectionProvider.getInstance().getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);
			while (resultSet.next()) {
				curPwd = resultSet.getString("PASSWORD");
				pwdSalt = resultSet.getString("salt");
			}
			String encPwd = SecurityServiceProvider.getEncrypt(generalAction.getCurrentPwd().trim(), pwdSalt.trim());

			if (curPwd.equals(encPwd)) {
				count = 1;
			} else {
				count = 0;
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {

			try {
				// resultSet Object Checking if it's null then close and set
				// null
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}

				if (statement != null) {
					statement.close();
					statement = null;
				}

				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException ex) {
				throw new ServiceLocatorException(ex);
			}
		}
		System.out.println(
				"********************GeneralServiceImpl :: verifyCurrentPassword Method End*********************");
		return count;
	}

	/**
	 * ****************************************************************
	 *
	 *
	 * UserRegistration() method to add the contact
	 *
	 *
	 * ****************************************************************
	 */
public String UserRegistration(GeneralAction generalAction) throws ServiceLocatorException {
		
		int regFlag=0;//whether user is vendor or customer 
		String sRegFlag=null;
		System.out.println(
				"********************GeneralServiceImpl :: UserRegistration Method Start*********************");
		String result = null;
		Connection connection = null;
		CallableStatement callableStatement = null;

		Connection connection1 = null;

		CallableStatement callableStatement1 = null;
		boolean isExceute = false;
		if(generalAction.getRegFlag().equals("vc"))
		{
			regFlag=5;
			sRegFlag="VC";
		}
		else if(generalAction.getRegFlag().equals("ac"))
		{
			regFlag=1;
			sRegFlag="AC";
		}
		int updatedRows = 0;
		try {
			connection1 = ConnectionProvider.getInstance().getConnection();
			callableStatement1 = connection1
					.prepareCall("{CALL addAccounts(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			System.out.println("UserRegistration :: procedure name : addAccounts ");
			callableStatement1.setString(1, generalAction.getOrgName());
			callableStatement1.setString(2, generalAction.getOrg_web_address());
			callableStatement1.setString(3,null);//Org_address1
			callableStatement1.setString(4, null);//org_address2
			callableStatement1.setInt(5,0);//org_state

			callableStatement1.setInt(6, 0);
			callableStatement1.setString(7,null);//Org_city
			callableStatement1.setString(8,null);//Org_zip
			callableStatement1.setInt(9, 0);// created by. in sp frmUsr_id
			System.out.println("-------------" + generalAction.getOffice_Phone());
			callableStatement1.setString(10, generalAction.getOffice_Phone());
			callableStatement1.setString(11, null);//Org_fax
			callableStatement1.setString(12, null);// industry type
			callableStatement1.setString(13, null);// it budget
			callableStatement1.setString(14, null);
			callableStatement1.setString(15, "");// tax id

			callableStatement1.setString(16, null);
			callableStatement1.setString(17, "");// stock symbol
			callableStatement1.setString(18, generalAction.getNoOfEmployees());
			callableStatement1.setString(19, "");// description
			callableStatement1.setString(20, null);// revenue
			callableStatement1.setInt(21, 10001); // session orgId
			callableStatement1.setInt(22,regFlag); // Account Type check for null

			callableStatement1.setString(23, generalAction.getEmail_ext());// email
																			// ext

			callableStatement1.setString(24,null);//BusinessType
			callableStatement1.setString(25,null);//BusinessTypeDesc
			callableStatement1.setString(26,null);//MinorityGroup
			callableStatement1.setString(27,null);//StaffingMode
			//System.out.println("getVenSpecialization-->" + generalAction.getVenSpecialization());
			callableStatement1.setString(28,null);//VenSpecialization

			callableStatement1.registerOutParameter(29, Types.INTEGER);
			callableStatement1.execute();
			int status = callableStatement1.getInt(29);
			System.out.println("status is "+status);
			if (status > 0) {
				connection = ConnectionProvider.getInstance().getConnection();
				callableStatement = connection.prepareCall(
						"{CALL addAccContact(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				System.out.println("UserRegistration :: procedure name : addAccContact ");
				callableStatement.setString(1, generalAction.getFirst_name());
				callableStatement.setString(2,null);//Middle_name
				callableStatement.setNull(3, Types.NULL);// file path
				callableStatement.setString(4, generalAction.getLast_name());
				callableStatement.setString(5, generalAction.getOffice_emailId());
				callableStatement.setString(6, generalAction.getOffice_Phone());
				callableStatement.setInt(7, status);// generalAction.getAccountSearchOrgId());
				callableStatement.setString(8, null);//Phone
				callableStatement.setInt(9, 0);// not used in stored procedur e
												// so 0
				callableStatement.setString(10, generalAction.getAddress1());
				callableStatement.setString(11,null);//Address2
				callableStatement.setString(12, generalAction.getCity());
				callableStatement.setString(13,null);//Zip
				callableStatement.setInt(14, generalAction.getCountry());
				callableStatement.setInt(15, generalAction.getState1());
				callableStatement.setString(16,null);//Phone2
				callableStatement.setString(17,sRegFlag);//checking whether user is vendor or customer
				callableStatement.setString(18, "");// gender
				callableStatement.setInt(19, 0);// created by 0
				callableStatement.setString(20,null);//EmailId
				callableStatement.setInt(21, -1);
				callableStatement.setString(22,null);//Title
				callableStatement.setString(23, null);// Exp
				callableStatement.setInt(24, -1);// Industry
				callableStatement.setString(25, null);// SSn
				callableStatement.setString(26, null);// education
				callableStatement.setString(27, null);// skills
				callableStatement.setString(28, File.separator);
				callableStatement.setString(29, null);//mailBoxNumber
				callableStatement.registerOutParameter(30, Types.INTEGER);
				callableStatement.registerOutParameter(31, Types.INTEGER);

				isExceute = callableStatement.execute();
				updatedRows = callableStatement.getInt(30);
				int usrId = callableStatement.getInt(31);

				if (updatedRows > 0) {
					doAddMailManager(generalAction.getOffice_emailId(), generalAction.getFirst_name(),
							generalAction.getLast_name(), "serviceBayUserRegistration",null);
					result = "Added successfully";
				}

			}

		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
					connection = null;
				}
				if (connection1 != null) {
					connection1.close();
					connection1 = null;
				}
				if (callableStatement1 != null) {
					callableStatement1.close();
					callableStatement1 = null;
				}
				if (callableStatement != null) {
					callableStatement.close();
					callableStatement = null;
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		System.out
				.println("********************GeneralServiceImpl :: UserRegistration Method End*********************");
		return result;
	}


	/**
	 * ****************************************************************
	 *
	 *
	 * doAddMailManager() method to send the mail
	 *
	 *
	 * ****************************************************************
	 */
	public void doAddMailManager(String email1, String first_name, String last_name, String subject,String password)
			throws SQLException, ServiceLocatorException {
		System.out.println(
				"********************GeneralServiceImpl :: doAddMailManager Method Start*********************");
		String toAdd = "", bodyContent = "", bcc = "", cc = "", SubjectStatusActivation = "";
		String FromAdd = Properties.getProperty("MSB.from");
		String servicesbayLogo=com.mss.msp.util.Properties.getProperty("SERVICESBAYLOGO").toString();
		/* ONLINEEXAMURL refers to portals's home page */
		String homeUrl=com.mss.msp.util.Properties.getProperty("ONLINEEXAMURL").toString();
		
		String Empname = first_name;
		Empname = Empname.concat("." + last_name);

		toAdd = email1;

		SubjectStatusActivation = subject;
		StringBuilder htmlText = new StringBuilder();
		htmlText.append("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>");
        htmlText.append("<html xmlns='http://www.w3.org/1999/xhtml'>");
        htmlText.append("<head>");
         htmlText.append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
         htmlText.append("<title>ServicesBay Registration Success&#33;&#33;</title>");
         htmlText.append("<style type='text/css'>");
        
         htmlText.append("body {");
         htmlText.append("padding-top: 0 !important;");
         htmlText.append("padding-bottom: 0 !important;");
         htmlText.append("padding-top: 0 !important;");
         htmlText.append("padding-bottom: 0 !important;");
         htmlText.append("margin:0 !important;");
         htmlText.append("width: 100% !important;");
         htmlText.append("-webkit-text-size-adjust: 100% !important;");
         htmlText.append("-ms-text-size-adjust: 100% !important;");
         htmlText.append("-webkit-font-smoothing: antialiased !important;");
         htmlText.append("}");
         htmlText.append(".tableContent img {");
         htmlText.append("border: 0 !important;");
         htmlText.append("display: block !important;");
         htmlText.append("outline: none !important;");
         htmlText.append("}");
        htmlText.append("");
        htmlText.append("a{");
        htmlText.append("color:#382F2E;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("p, h1,h2,ul,ol,li,div{");
        htmlText.append("margin:0;");
        htmlText.append("padding:0;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("h1,h2{");
        htmlText.append("font-weight: normal;");
         htmlText.append("background:transparent !important;");
        htmlText.append("border:none !important;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".contentEditable h2.big,.contentEditable h1.big{");
         htmlText.append("font-size: 26px !important;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".contentEditable h2.bigger,.contentEditable h1.bigger{");
        htmlText.append("font-size: 37px !important;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("td,table{");
        htmlText.append("vertical-align: top;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("td.middle{");
        htmlText.append("vertical-align: middle;");
        htmlText.append("}");
        htmlText.append("");
         htmlText.append("a.link1{");
        htmlText.append("font-size:13px;");
        htmlText.append("color:#27A1E5;");
        htmlText.append("line-height: 24px;");
        htmlText.append("text-decoration:none;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("a{");
        htmlText.append("text-decoration: none;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".link2{");
        htmlText.append("color:#fc3f3f;");
        htmlText.append("border-top:0px solid #fc3f3f;");
        htmlText.append("border-bottom:0px solid #fc3f3f;");
        htmlText.append("border-left:10px solid #fc3f3f;");
        htmlText.append("border-right:10px solid #fc3f3f;");
        htmlText.append("border-radius:1px;");
        htmlText.append("-moz-border-radius:5px;");
        htmlText.append("-webkit-border-radius:5px;");
        htmlText.append("background:#fc3f3f;");
        htmlText.append("}");
        
        htmlText.append(".link3{");
        htmlText.append("color:#555555;");
        htmlText.append("border:1px solid #cccccc;");
        htmlText.append("padding:10px 18px;");
        htmlText.append("border-radius:3px;");
        htmlText.append("-moz-border-radius:3px;");
        htmlText.append("-webkit-border-radius:3px;");
        htmlText.append("background:#ffffff;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".link4{");
        htmlText.append("color:#27A1E5;");
        htmlText.append("line-height: 24px;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("h2,h1{");
        htmlText.append("line-height: 20px;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("p{");
        htmlText.append("font-size: 14px;");
        htmlText.append("line-height: 21px;");
         htmlText.append("color:#AAAAAA;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".contentEditable li{");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".appart p{");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".bgItem{");
        htmlText.append("background:#ffffff;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append(".bgBody{");
        htmlText.append("background: #0d416b;");
        htmlText.append("}");
        htmlText.append("");
        htmlText.append("img {");
        htmlText.append("outline:none;");
        htmlText.append("text-decoration:none;");
        htmlText.append("-ms-interpolation-mode: bicubic;");
        htmlText.append("width: auto;");
        htmlText.append("max-width: 100%;");
        htmlText.append("clear: both;");
        htmlText.append("display: block;");
        htmlText.append("float: none;");
        htmlText.append("}");
        htmlText.append("</style>");
        
        htmlText.append("<script type='colorScheme' class='swatch active'>");
        htmlText.append("{");
        htmlText.append("'name':'Default',");
        htmlText.append("'bgBody':'ffffff',");
        htmlText.append("'link':'27A1E5',");
        htmlText.append("'color':'AAAAAA',");
        htmlText.append("'bgItem':'ffffff',");
        htmlText.append("'title':'444444'");
        htmlText.append("}");
        
        htmlText.append("</script>");
        
        htmlText.append("</head>");
        htmlText.append("<body paddingwidth='0' paddingheight='0' bgcolor='#d1d3d4' style='padding-top: 0; padding-bottom: 0; padding-top: 0; padding-bottom: 0; background-repeat: repeat; width: 100% !important; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-font-smoothing: antialiased;' offset='0' toppadding='0' leftpadding='0' data-gr-c-s-loaded='true'>");
        htmlText.append("<table width='100%' border='0' cellspacing='0' cellpadding='0' class='tableContent bgBody' align='center' style='font-family:Helvetica, sans-serif;'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td align='center'>");
        htmlText.append("<table width='600' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td class='bgItem' align='center'>");
        htmlText.append("<table width='600' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td class='movableContentContainer' align='center'>");
        htmlText.append("<div class='movableContent'>");
        htmlText.append("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td style='background:#0d416b; border-radius:0px;-moz-border-radius:0px;-webkit-border-radius:0px' height='20'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td style='background:#0d416b; border-radius:0px;-moz-border-radius:0px;-webkit-border-radius:0px'>");
        htmlText.append("<table width='650' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td>");
        htmlText.append("<div class='contentEditableContainer contentImageEditable'>");
        htmlText.append("<div class='contentEditable'>");
        htmlText.append("<a>");
        htmlText.append("<img src='"+servicesbayLogo+"' alt='Logo' style='width:235px;height:70px;' height='45' data-default='placeholder' data-max-width='200'>");
        htmlText.append("</a>");
        htmlText.append("</div>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("<td valign='middle' style='vertical-align: middle;'>");
        htmlText.append("</td>");
        htmlText.append("<td valign='middle' style='vertical-align: middle;' width='150'>");
        htmlText.append("<br>");
        htmlText.append("<table width='300' border='0' cellpadding='0' cellspacing='0' align='right' style='text-align: right; font-size: 13px; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;' class='fullCenter'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td height='55' valign='middle' width='100%' style='font-family: Open Sans; color:#232527;'> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;");
        
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</div>");
        htmlText.append("<div class='movableContent'>");
        htmlText.append("<table width='580' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td style='border: 0px solid #ffffff; border-radius:0px;-moz-border-radius:0px;-webkit-border-radius:0px'>");
        htmlText.append("<div class='movableContent'>");
        htmlText.append("<table width='660' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td style='background:#00aae7; border-radius:0px;-moz-border-radius:0px;-webkit-border-radius:px'>");
        htmlText.append("<table width='630' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td height='15'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td>");
        htmlText.append("<div class='contentEditableContainer contentTextEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: left;'>");
        htmlText.append("<h2 style='font-size: 25px;'>");
        htmlText.append("<font color='#ffffff' face='Open Sans'>");
        htmlText.append("<b>Registered Successfully.</b>");
        htmlText.append("</font>");
        htmlText.append("</h2>");
        htmlText.append("<br>");
        htmlText.append("</div>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</div>");
        htmlText.append("<p>");
        htmlText.append("</p>");
        htmlText.append("<p>");
        htmlText.append("</p>");
        htmlText.append("<table width='600' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td height='5'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td>");
        htmlText.append("<div class='contentEditableContainer contentTextEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;'>");
        htmlText.append("<br>");
        htmlText.append("<p style='line-height:180%; text-align: justify; font-size: 14px;'>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
        htmlText.append("<b>Hello " + Empname + ",</b>");
        htmlText.append("</font>");
        htmlText.append("</p>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</div>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</div>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td height='0'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td>");
        htmlText.append("<div class='contentEditableContainer contentTextEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;'>");
        htmlText.append("<br>");
        htmlText.append("<p style='line-height:180%; text-align: justify; font-size: 14px;'>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
       htmlText.append("You have been recently Registered in ServiceBay");
       htmlText.append("<br/>Email :  " + toAdd + " ");
       if(password!=null)
       {
    	   htmlText.append("<br/>Password :  " + password + " <br/>");
       }
	    htmlText.append("</font>");
        htmlText.append("</p>");
		htmlText.append("<p style='line-height:180%; text-align: justify; font-size: 14px;'>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
        htmlText.append("<a href='"+homeUrl+"' style='color:blue'<u>Click here</u></a> to login.");
        htmlText.append("</font>");
        htmlText.append("</p>");
		htmlText.append("<p style='line-height:180%; text-align: justify; font-size: 14px;'>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
       
        htmlText.append("If you have not registered, you can safely ignore this email.");
		htmlText.append("</font>");
		htmlText.append("</p>");
		
        htmlText.append("<font color='#232527' face='Open Sans'>");
        
        htmlText.append("</font>");
        htmlText.append("</div>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</div>");
        htmlText.append("<font color='#232527' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td style='padding-top: 0px;' align='left' valign='top'>");
        htmlText.append("<table class='textbutton' style='margin: 0;' align='left' border='0' cellpadding='0' cellspacing='0'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<br>");
        
        htmlText.append("<td align='justify' valign='top' style='margin: 0; padding-top: 5px; font-size:14px ; font-weight: normal; color:#000000; font-family: 'Open Sans'; line-height: 180%; mso-line-height-rule: exactly;'>");
        
        htmlText.append("<p style='text-align: justify; font-size: 14px;'>");htmlText.append("<font color='#000000' face='trebuchet ms'>");
        htmlText.append("<b>");
        htmlText.append("Thanks & Regards,</b>");
        htmlText.append("<br/>");
        htmlText.append("<b>ServicesBay Team.</b>");
        htmlText.append("<br/>");
        
         
         htmlText.append("<a href='mailto:sb@miraclesoft.com'>");
         htmlText.append("Email: sb@miraclesoft.com");
         htmlText.append("</a>");
        
        htmlText.append("</p>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td align='left' style='padding: 5px 0 5px 0; font-size: 14px; line-height: 22px; font-family: Open Sans; color: #ef4048; font-style: italic;' class='padding-copy'>");
        htmlText.append(" * Note: Please do not reply to this email as this is an automated notification");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("<table width='600' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td>");
        htmlText.append("<div class='contentEditableContainer contentTextEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;'>");
        htmlText.append("<p>");
        htmlText.append("</p>");
        htmlText.append("</div>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td height='5'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</div>");
        htmlText.append("<div class='movableContent'>");
        htmlText.append("<table width='660' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td style='background:#0d416b; border-radius:0px;-moz-border-radius:0px;-webkit-border-radius:0px'>");
        htmlText.append("<table width='655' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td colspan='3' height='20'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td width='90'>");
        htmlText.append("</td>");
        htmlText.append("<td width='660' align='center' style='text-align: center;'>");
        htmlText.append("<table width='660' cellpadding='0' cellspacing='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td>");
        htmlText.append("<div class='contentEditableContainer contentTextEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;color:#AAAAAA;'>");
        htmlText.append("<p style='text-align: center; font-size: 14px;'>");
        htmlText.append("<font color='#ffffff' face='Open Sans'>");
         
        htmlText.append("</font>");
        htmlText.append("</p>");
        htmlText.append("<font color='#ffffff' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</div>");
        htmlText.append("<font color='#ffffff' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</div>");
        htmlText.append("<font color='#ffffff' face='Open Sans'>");
        htmlText.append("</font>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("<td width='90'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("<table width='650' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td colspan='3' height='20'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td width='195'>");
        htmlText.append("</td>");
        htmlText.append("<td width='190' align='center' style='text-align: center;'>");
        htmlText.append("<table width='190' cellpadding='0' cellspacing='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td width='40'>");
        htmlText.append("<div class='contentEditableContainer contentFacebookEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;color:#AAAAAA;'>");
        
        htmlText.append("</div>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("<td width='10'>");
        htmlText.append("</td>");
        htmlText.append("<td width='40'>");
        htmlText.append("<div class='contentEditableContainer contentTwitterEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;color:#AAAAAA;'>");
        
        htmlText.append("</div>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("<td width='10'>");
        htmlText.append("</td>");
        htmlText.append("<td width='40'>");
        htmlText.append("<div class='contentEditableContainer contentImageEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;color:#AAAAAA;'>");
        
        htmlText.append("</div>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("<td width='10'>");
        htmlText.append("</td>");
        htmlText.append("<td width='40'>");
        htmlText.append("<div class='contentEditableContainer contentImageEditable'>");
        htmlText.append("<div class='contentEditable' style='text-align: center;color:#AAAAAA;'>");
        
        htmlText.append("</div>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("<td width='195'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("<td colspan='3' height='40'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</div>");
        htmlText.append("<div class='movableContent'>");
        htmlText.append("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>");
        htmlText.append("<tbody>");
        htmlText.append("<tr>");
        htmlText.append("<td style='background:#0d416b; border-radius:0px;-moz-border-radius:0px;-webkit-border-radius:0px' height='0'>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("<tr>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</div>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        htmlText.append("</td>");
        htmlText.append("</tr>");
        htmlText.append("</tbody>");
        htmlText.append("</table>");
        
        htmlText.append("<span class='gr__tooltip'>");
        htmlText.append("<span class='gr__tooltip-content'>");
        htmlText.append("</span>");
        htmlText.append("<i class='gr__tooltip-logo'>");
        htmlText.append("</i>");
        htmlText.append("<span class='gr__triangle'>");
        htmlText.append("</span>");
        htmlText.append("</span>");
        htmlText.append("</body>");
        htmlText.append("</html>");


		bodyContent = htmlText.toString();
		System.out.println(bodyContent);
		//new com.mss.msp.util.MailManager().doaddemailLog(FromAdd, toAdd, bcc, cc, SubjectStatusActivation, bodyContent,0);
		new com.mss.msp.util.MailManager().sendRegistrationSuccessMail(FromAdd, toAdd,SubjectStatusActivation, bodyContent,password);
		System.out
				.println("********************GeneralServiceImpl :: doAddMailManager Method End*********************");
	}
	
	/**
	 * ****************************************************************
	 * 
	 *
	 * consultantRegistration() method is used to register Consultants from home page.
	 *
	 *
	 * ****************************************************************
	 */

	 public String consultantRegistration(GeneralAction generalAction) throws ServiceLocatorException {

			System.out.println(
					"********************GeneralServiceImpl :: consultantRegistration Method Start*********************");
			String result = null;
			Connection connection = null;
			CallableStatement callableStatement = null;

			boolean isExceute = false;
			int updatedRows = 0;
			try {
				String plainPassword = SecurityServiceProvider.generateRandamSecurityKey(6, 6, 1, 1, 0);
	            String pwdSalt = SecurityServiceProvider.generateRandamSecurityKey(10, 10, 2, 3, 3);
	            String encPwd = SecurityServiceProvider.getEncrypt(plainPassword, pwdSalt);
	            
	            System.out.println("plainPassword-->"+plainPassword);
	            System.out.println("pwdSalt-->"+pwdSalt);
	            System.out.println("encPwd-->"+encPwd);
				
			
					connection = ConnectionProvider.getInstance().getConnection();
					/*callableStatement = connection.prepareCall(
							"{CALL spConsultantRegistration(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
					*/
					callableStatement = connection.prepareCall(
							"{CALL spConsultantRegistration(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
					
					
					System.out.println("consultantRegistration :: procedure name : spConsultantRegistration ");
					
					callableStatement.setString(1, generalAction.getConsultantFirstName());
					callableStatement.setString(2, generalAction.getConsultantLastName());
					callableStatement.setString(3, generalAction.getConsultantEmail());
					callableStatement.setString(4, generalAction.getConsultantMobile());
					callableStatement.setString(5, generalAction.getConsultantWorkingCountry());
					callableStatement.setString(6, generalAction.getConsultantExperience());
					callableStatement.setString(7, generalAction.getConsultantEducation());
					callableStatement.setString(8, generalAction.getConsultantResumeFilePath());
					callableStatement.setString(9, generalAction.getConsultantResumeFileName());
					callableStatement.setString(10, pwdSalt);
					callableStatement.setString(11, encPwd);
					callableStatement.setString(12, generalAction.getUsersPrivateKey());
					
					callableStatement.registerOutParameter(13, Types.INTEGER);
					callableStatement.registerOutParameter(14, Types.INTEGER);

					isExceute = callableStatement.execute();
					updatedRows = callableStatement.getInt(13);
					int usrId = callableStatement.getInt(14);
					System.out.println("usrId--->"+usrId);

					
					/* callableStatement.setString(5, generalAction.getConsultantDob());
					callableStatement.setString(6, generalAction.getConsultantPerAddress1());				
					callableStatement.setString(7, generalAction.getConsultantPerAddress2());
					callableStatement.setString(8, generalAction.getConsultantPerCity());				
					callableStatement.setString(9, generalAction.getConsultantPerZip());
					callableStatement.setString(10, generalAction.getConsultantPerCountry());
					callableStatement.setString(11, generalAction.getConsultantPerState());
					
					callableStatement.setString(12, generalAction.getConsultantCurAddress1());
					callableStatement.setString(13, generalAction.getConsultantCurAddress2());
					callableStatement.setString(14, generalAction.getConsultantCurCity());
					callableStatement.setString(15, generalAction.getConsultantCurZip());
					callableStatement.setString(16, generalAction.getConsultantCurCountry());
					callableStatement.setString(17, generalAction.getConsultantCurState());
					
					
					callableStatement.setString(18, generalAction.getConsultantTitle());
					
					callableStatement.setString(19, generalAction.getConsultantExperience());
					callableStatement.setString(20, generalAction.getConsultantIndustry());
					callableStatement.setString(21, generalAction.getConsultantSsn());
					callableStatement.setString(22, generalAction.getConsultantEducation());
					callableStatement.setString(23, generalAction.getConsultantPrimarySkills());
					
					callableStatement.setString(24, generalAction.getConsultantSecondarySkills());
					callableStatement.setString(25, generalAction.getConsultantRatePerSalary());
					callableStatement.setString(26, generalAction.getConsultantResumeFilePath());
					callableStatement.setString(27, generalAction.getConsultantResumeFileName());
					
					callableStatement.setString(28, generalAction.getConsultantAddrsFlag());
					
				//	callableStatement.setString(29, plainPassword);
					callableStatement.setString(29, pwdSalt);
					callableStatement.setString(30, encPwd);
					
				
				
					
					
				//	callableStatement.setString(28, File.separator);
					
					callableStatement.registerOutParameter(31, Types.INTEGER);
					callableStatement.registerOutParameter(32, Types.INTEGER);

					isExceute = callableStatement.execute();
					updatedRows = callableStatement.getInt(31);
					int usrId = callableStatement.getInt(32);
					System.out.println("usrId--->"+usrId);
				*/	
					

					if (usrId > 0) {
						doAddMailManager(generalAction.getConsultantEmail(), generalAction.getConsultantFirstName(),
								generalAction.getConsultantLastName(), "serviceBayUserRegistration",plainPassword);
						result ="success";
					}
				

			} catch (Exception sqe) {
				sqe.printStackTrace();
			} finally {
				try {
					if (connection != null) {
						connection.close();
						connection = null;
					}
					if (callableStatement != null) {
						callableStatement.close();
						callableStatement = null;
					}
				} catch (SQLException sqle) {
					sqle.printStackTrace();
				}
			}
			System.out
					.println("********************GeneralServiceImpl :: consultantRegistration Method End*********************");
			return result;
		}
}
