/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.msp.reccruitmentAjax;

import com.mss.msp.recruitment.ConsultantVTO;
import com.mss.msp.recruitment.RecruitmentAction;
import com.mss.msp.security.SecurityServiceProvider;
import com.mss.msp.util.ApplicationConstants;
import com.mss.msp.util.ConnectionProvider;
import com.mss.msp.util.DataSourceDataProvider;
import com.mss.msp.util.ServiceLocatorException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import com.mss.msp.util.DateUtility;
import com.mss.msp.util.Properties;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.json.JSONException;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author NagireddySeerapu
 */
public class RecruitmentAjaxHandlerServiceImpl implements RecruitmentAjaxHandlerService {

	Connection connection;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	String queryString = "";
	CallableStatement callableStatement = null;

	/**
	 * *****************************************************************************
	 * Date : May 5 2015
	 *
	 * Author : Aklakh Ahmad<mahmad@miraclesoft.com>
	 *
	 * getAddedConsultantDetails() method is used to enter the consultant record
	 * into database using stored procedure
	 *
	 * *****************************************************************************
	 */
	public int getAddedConsultantDetails(RecruitmentAjaxHandlerAction raha, int orgId) throws ServiceLocatorException {

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: getAddedConsultantDetails Method Start*********************");
		int addResult = 0;
		boolean isExceute = false;
		DateUtility dateUtility = new DateUtility();
		String availableDate, dobDate;
		Connection connection = null;
		CallableStatement callableStatement = null;
		try {
			availableDate = dateUtility.getInstance().convertStringToMySQLDate(raha.getCnslt_add_date());
			dobDate = dateUtility.getInstance().convertStringToMySQLDate(raha.getCnslt_dob());

			connection = ConnectionProvider.getInstance().getConnection();

			callableStatement = connection.prepareCall(
					"{CALL addConsultant(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			System.out.println("getAddedConsultantDetails :: procedure name : addConsultant ");
			callableStatement.setInt(1, orgId);
			callableStatement.setString(2, raha.getCnslt_email());
			callableStatement.setString(3, availableDate);
			callableStatement.setString(4, raha.getCnslt_available());
			callableStatement.setString(5, raha.getCnslt_fstname());
			callableStatement.setString(6, raha.getCnslt_lstname());
			callableStatement.setString(7, raha.getCnslt_midname());
			callableStatement.setString(8, raha.getCnslt_gender());
			callableStatement.setString(9, dobDate);
			callableStatement.setString(10, raha.getCnslt_mStatus());
			callableStatement.setString(11, raha.getCnslt_homePhone());
			callableStatement.setString(12, raha.getCnslt_mobileNo());
			callableStatement.setInt(13, raha.getCnslt_lcountry());
			callableStatement.setString(14, raha.getAddAddressFlag());
			callableStatement.setString(15, raha.getAddConsult_Address());
			callableStatement.setString(16, raha.getAddConsult_Address2());
			callableStatement.setString(17, raha.getAddConsult_City());
			callableStatement.setString(18, raha.getAddConsult_Country());
			callableStatement.setInt(19, raha.getAddConsult_State());
			callableStatement.setString(20, raha.getAddConsult_Zip());
			callableStatement.setString(21, raha.getAddConsult_Phone());
			callableStatement.setString(22, raha.getAddAddressFlag());
			callableStatement.setString(23, raha.getAddConsult_CAddress());
			callableStatement.setString(24, raha.getAddConsult_CAddress2());
			callableStatement.setString(25, raha.getAddConsult_CCity());
			callableStatement.setString(26, raha.getAddConsult_CCountry());
			callableStatement.setInt(27, raha.getAddConsult_CState());
			callableStatement.setString(28, raha.getAddConsult_CZip());
			callableStatement.setString(29, raha.getAddConsult_CPhone());

			callableStatement.setInt(30, raha.getCnslt_industry());
			callableStatement.setInt(31, raha.getCnslt_organization());
			callableStatement.setString(32, raha.getCnslt_jobTitle());

			callableStatement.setString(33, raha.getCnslt_salary());
			callableStatement.setString(34, raha.getCnslt_experience());
			callableStatement.setString(35, raha.getCnslt_workPhone());

			callableStatement.setInt(36, raha.getCnslt_pcountry());
			callableStatement.setInt(37, raha.getCnslt_preferredState());
			callableStatement.setInt(38, raha.getCnslt_wcountry());

			callableStatement.setString(39, raha.getCnslt_description());
			callableStatement.setString(40, raha.getCnslt_comments());
			callableStatement.setString(41, raha.getCnslt_referredBy());

			isExceute = callableStatement.execute();

			addResult = callableStatement.getInt(42);

		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {

				if (callableStatement != null) {
					callableStatement.close();
					callableStatement = null;
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
				"********************RecruitmentAjaxHandlerServiceImpl :: getAddedConsultantDetails Method End*********************");
		return addResult;
	}

	/**
	 * ****************************************************************************
	 * Date : April 20 2015
	 *
	 * Author : triveni niddara <tniddara@miraclesoft.com>
	 *
	 *
	 * *****************************************************************************
	 */
	public String getAttachmentDetails(RecruitmentAjaxHandlerAction recruitmentajaxhandleraction)
			throws ServiceLocatorException {
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: getAttachmentDetails Method Start*********************");

		String resultString = "";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";

		ConsultantVTO consult = new ConsultantVTO();

		try {
			// queryString = "SELECT * FROM acc_rec_attachment WHERE
			// (object_type='CV' OR object_type = 'CSA') AND object_id=? order
			// by status";
			queryString = "SELECT * FROM acc_rec_attachment WHERE (object_type='CV' OR object_type = 'CSA' OR object_type = 'VS' OR object_type = 'PP' OR object_type = 'DL' OR object_type = 'OT') AND object_id=? order by status, opp_created_date DESC";

			System.out.println("getAttachmentDetails() queryString-->" + queryString);
			connection = ConnectionProvider.getInstance().getConnection();

			preparedStatement = connection.prepareStatement(queryString);

			preparedStatement.setInt(1, recruitmentajaxhandleraction.getConsult_id());

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				consult.setConsult_acc_attachment_id(resultSet.getString("acc_attachment_id"));
				if ((!"".equals(resultSet.getString("attachment_title"))
						&& resultSet.getString("attachment_title") != null)) {
					consult.setAttachmentTitle(resultSet.getString("attachment_title"));
				} else {
					consult.setAttachmentTitle("--");
				}

				consult.setConsult_object_id(resultSet.getInt("object_id"));
				consult.setConsult_attachment_name(resultSet.getString("attachment_name"));
				consult.setConsult_object_type(resultSet.getString("object_type"));
				consult.setConsult_attachment_path(resultSet.getString("attachment_path"));
				consult.setConsult_attachment_created_date(com.mss.msp.util.DateUtility.getInstance()
						.convertToviewFormat(resultSet.getString("opp_created_date")));

				consult.setConsult_attachment_status(resultSet.getString("status"));

				// resultString += consult.getConsult_attachment_name() + "|" +
				// consult.getConsult_object_type() + '|' +
				// consult.getConsult_attachment_path() + "|" +
				// consult.getConsult_attachment_created_date() + "|" +
				// consult.getConsult_acc_attachment_id() + "|" +
				// consult.getConsult_attachment_status() + '^';

				resultString += consult.getConsult_attachment_name() + "|" + consult.getConsult_object_type() + '|'
						+ consult.getConsult_attachment_path() + "|" + consult.getConsult_attachment_created_date()
						+ "|" + consult.getConsult_acc_attachment_id() + "|" + consult.getConsult_attachment_status()
						+ "|" + consult.getAttachmentTitle() + '^';
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
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
				"********************RecruitmentAjaxHandlerServiceImpl :: getAttachmentDetails Method End*********************");
		return resultString;
	}

	// Add By Aklakh
	/**
	 * ****************************************************************************
	 *
	 *
	 * method : doAddMailManagerStatusActivation() to send the mail
	 *
	 *
	 * *****************************************************************************
	 */
	public void doAddMailManagerStatusActivation(String email1, String first_name, String last_name,
			String plainPassword, String subject, int createdBy) throws SQLException, ServiceLocatorException {

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: doAddMailManagerStatusActivation Method Start*********************");
		String toAdd = "", bodyContent = "", bcc = "", cc = "", SubjectStatusActivation = "";

		String FromAdd = Properties.getProperty("MSB.from");
		String Empname = first_name;
		Empname = Empname.concat("." + last_name);

		toAdd = email1;

		SubjectStatusActivation = subject;
		StringBuilder htmlText = new StringBuilder();
		htmlText.append("<html>");
		htmlText.append("<body>");
		htmlText.append("<table align='center'>");
		htmlText.append("<tr style='background:#99FF33;height:40px;width:100%;'>");
		htmlText.append("<td>");
		htmlText.append("<font color='white' size='4' face='Arial'>");
		htmlText.append("<p>MSB Login Credentials</p>");
		htmlText.append("</font>");
		htmlText.append("</td>");
		htmlText.append("</tr>");
		htmlText.append("<tr>");
		htmlText.append("<td>");
		htmlText.append("<table style='background:#FFFFCC;width:100%;'>");
		htmlText.append("<tr>");
		htmlText.append("<td>");
		htmlText.append("<font color='#3399FF' size='2' face='Arial' style='font-weight:600;'>");
		htmlText.append("<p>Hello " + Empname + ",</p><br/>");
		htmlText.append("<p>You have been recently added to Servicebay</p>");
		htmlText.append("<p>Please login with below credentials</p><br/>");
		htmlText.append("Email :  " + toAdd + "<br/>");
		htmlText.append("Password : " + plainPassword + "");
		htmlText.append("<p>If you did not have not registered, you can safely ignore this email.</p>");
		htmlText.append("</font>");
		htmlText.append("</td>");
		htmlText.append("</tr>");
		htmlText.append("</table>");
		htmlText.append("</td>");
		htmlText.append("</tr>");
		htmlText.append("<tr>");
		htmlText.append("<td>");
		htmlText.append(
				"<font color='red', size='2' face='Arial' style='font-weight:600;'>*Note:Please do not reply to this e-mail. It was generated by our System.</font>'");
		htmlText.append("</td>");
		htmlText.append("</tr>");
		htmlText.append("</table>");
		htmlText.append("</body>");
		htmlText.append("</html>");
		htmlText.append("</body>");
		htmlText.append("</html>");

		bodyContent = htmlText.toString();

		new com.mss.msp.util.MailManager().doaddemailLog(FromAdd, toAdd, bcc, cc, SubjectStatusActivation, bodyContent,
				createdBy);
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: doAddMailManagerStatusActivation Method End*********************");
	}

	/**
	 * ****************************************************************************
	 * Date : May 19 2015
	 *
	 * Author : ramakrishna<lankireddy@miraclesoft.com>
	 *
	 * getConsultantTechReviews() method can be used to save the login details
	 * of consultant
	 * *****************************************************************************
	 */
	public String getConsultantTechReviews(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction)
			throws ServiceLocatorException {

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: getConsultantTechReviews Method Start*********************");

		String resultString = "";
		String date = "";
		String rating;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";
		try {
			queryString = "SELECT forwarded_to_name1,forwarded_to1,id,review_type,forwarded_to,consultant_id,req_id,scheduled_date,forwarded_to_name,comments,techie_title,STATUS,rating,forwarded_by,forwarded_date   "
					+ "FROM con_techreview " + "WHERE consultant_id=" + recruitmentAjaxHandlerAction.getConsult_id()
					+ " " + "AND req_id=" + recruitmentAjaxHandlerAction.getRequirementId() + " ";
			if (!"".equals(recruitmentAjaxHandlerAction.getInterviewDate())) {
				queryString = queryString + " AND scheduled_date= '" + com.mss.msp.util.DateUtility.getInstance()
						.convertStringToMySQLDate1(recruitmentAjaxHandlerAction.getInterviewDate()) + "' ";
			}
			if (!"0".equals(recruitmentAjaxHandlerAction.getEmpIdTechReview())) {

				queryString = queryString + " AND forwarded_to= " + recruitmentAjaxHandlerAction.getEmpIdTechReview()
						+ " ";
			}

			System.out.println("getConsultantTechReviews()  gueryString-----> " + queryString);
			connection = ConnectionProvider.getInstance().getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);

			while (resultSet.next()) {
				if (resultSet.getDate("scheduled_date") != null) {
					date = com.mss.msp.util.DateUtility.getInstance()
							.convertDateToViewInDashformat(resultSet.getDate("scheduled_date"));
				} else {
					date = "";
				}
				if (resultSet.getString("rating") != null) {
					Double value = Double.parseDouble(resultSet.getString("rating"));

					rating = String.format("%.1f", value);
				} else {
					rating = " ";
				}
				resultString += resultSet.getString("consultant_id") + "|" + resultSet.getString("req_id") + "|" + date
						+ "|" + resultSet.getString("forwarded_to_name") + "|" + resultSet.getString("comments") + "|"
						+ resultSet.getString("techie_title") + "|" + resultSet.getString("STATUS") + "|"
						+ resultSet.getString("forwarded_to") + "|" + resultSet.getString("id") + "|"
						+ resultSet.getString("review_type") + "|" + resultSet.getString("forwarded_to1") + "|"
						+ resultSet.getString("forwarded_to_name1") + "|" + rating + "|"
						+ resultSet.getString("forwarded_by") + "|"
						+ com.mss.msp.util.DataSourceDataProvider.getInstance()
								.getFnameandLnamebyUserid(resultSet.getInt("forwarded_by"))
						+ "|"
						+ DateUtility.getInstance().convertToviewFormatInDash(resultSet.getString("forwarded_date"))
						+ "^";

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
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: getConsultantTechReviews Method End*********************");
		return resultString;
	}

	/**
	 * ****************************************************************************
	 * Date : May 19 2015
	 *
	 * Author : ramakrishna<lankireddy@miraclesoft.com>
	 *
	 * techReviewCommentsOverlay() method can be used to get the tech review
	 * comments on overlay
	 *
	 * *****************************************************************************
	 */
	public String techReviewCommentsOverlay(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction)
			throws ServiceLocatorException {

		String resultString = "";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";
		try {
			System.out.println(
					"********************RecruitmeentAjaxHandlerServiceImpl :: techReviewCommentsOverlay Method Start*********************");
			queryString = "SELECT comments FROM con_techreview WHERE id="
					+ recruitmentAjaxHandlerAction.getConTechReviewId();
			System.out.println("techReviewCommentsOverlay() gueryString----> " + queryString);
			connection = ConnectionProvider.getInstance().getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);

			while (resultSet.next()) {
				resultString = resultSet.getString("comments");
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
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		System.out.println(
				"********************RecruitmeentAjaxHandlerServiceImpl :: techReviewCommentsOverlay Method End*********************");
		return resultString;
	}

	/**
	 * *********************************************************************************************
	 * Date : May 19 2015
	 *
	 * Author : ramakrishna<lankireddy@miraclesoft.com>
	 *
	 * getTechReviewResultOnOverlay() method can be used to get the tech review
	 * details on overlay of consultant
	 * *********************************************************************************************
	 */
	public String getTechReviewResultOnOverlay(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction)
			throws ServiceLocatorException {

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: getTechReviewResultOnOverlay Method Start*********************");
		String resultString = "";
		String date = "";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";
		String option1 = null, option2 = null, option3 = null, option4 = null, option5 = null, option6 = null,
				option7 = null, option8 = null, option9 = null, option10 = null;

		String skill1Name1 = null, skill1Name2 = null, skill1Name3 = null, skill1Name4 = null, skill1Name5 = null,
				skill1Name6 = null, skill1Name7 = null, skill1Name8 = null, skill1Name9 = null, skill1Name10 = null;
		int noOfQuestion1 = 0, noOfQuestion2 = 0, noOfQuestion3 = 0, noOfQuestion4 = 0, noOfQuestion5 = 0,
				noOfQuestion6 = 0, noOfQuestion7 = 0, noOfQuestion8 = 0, noOfQuestion9 = 0, noOfQuestion10 = 0;
		int rightAns1 = 0, rightAns2 = 0, rightAns3 = 0, rightAns4 = 0, rightAns5 = 0, rightAns6 = 0, rightAns7 = 0,
				rightAns8 = 0, rightAns9 = 0, rightAns10 = 0;

		try {
			if (!"Online".equals(recruitmentAjaxHandlerAction.getReviewType())
					&& !"Psychometric".equals(recruitmentAjaxHandlerAction.getReviewType())) {
				queryString = "SELECT CONCAT(c.first_name,'.',c.last_name) AS NAME,c.email1,c.phone1,cd.job_title,"
						+ "rcr.con_skill,cr.scheduled_date,ar.acc_attachment_id,cr.tech_skills,"
						+ "cr.domain_skills,cr.commmunication_skills,cr.comments,cr.STATUS  " + "FROM users c "
						+ "LEFT OUTER JOIN con_techreview cr ON(cr.consultant_id=c.usr_id)"
						+ "LEFT OUTER JOIN acc_rec_attachment ar ON(ar.object_id=c.usr_id)"
						+ "LEFT OUTER JOIN usr_details cd ON(cd.usr_id=c.usr_id) "
						+ "LEFT OUTER JOIN req_con_rel rcr ON(rcr.consultantId=c.usr_id)" + "WHERE c.usr_id="
						+ recruitmentAjaxHandlerAction.getConsult_id() + " " + "AND ar.STATUS='active' "
						+ "AND cr.req_id=" + recruitmentAjaxHandlerAction.getRequirementId() + " " + "AND review_type='"
						+ recruitmentAjaxHandlerAction.getReviewType() + "'";
			} else {
				queryString = "SELECT CONCAT(c.first_name,'.',c.last_name) AS NAME,so.techreviewid,so.consultantid,cr.id,cr.STATUS,so.option1,so.option2,so.option3,so.option4,so.option5,so.option6,so.option7,so.option8,so.option9,so.option10,c.email1,so.createddate,c.phone1,cd.job_title,so.eid,so.examstatus,se.completed_ts,cr.comments  FROM sb_onlineexam so"
						+ " LEFT OUTER JOIN con_techreview cr ON(so.techreviewid=cr.id)"
						+ " LEFT OUTER JOIN users c ON(c.usr_id=so.consultantid)"
						+ " LEFT OUTER JOIN usr_details cd ON(cd.usr_id=so.consultantid)"
						+ " LEFT OUTER JOIN sb_onlineexamsummery se ON(so.eid=se.examid)" + " WHERE so.techreviewid="
						+ recruitmentAjaxHandlerAction.getConTechReviewId() + "";

			}
			System.out.println("getTechReviewResultOnOverlay()   gueryString-----> " + queryString);
			connection = ConnectionProvider.getInstance().getConnection();
			statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			resultSet = statement.executeQuery(queryString);

			while (resultSet.next()) {

				if (!"Online".equals(recruitmentAjaxHandlerAction.getReviewType())
						&& !"Psychometric".equals(recruitmentAjaxHandlerAction.getReviewType())) {
					if (resultSet.getDate("scheduled_date") != null) {

						date = com.mss.msp.util.DateUtility.getInstance()
								.convertDateToViewInDashformat(resultSet.getDate("scheduled_date"));
					} else {

						date = "";
					}
					resultString = resultSet.getString("NAME") + "|" + resultSet.getString("email1") + "|"
							+ resultSet.getString("phone1") + "|" + date + "|"
							+ resultSet.getString("acc_attachment_id") + "|" + resultSet.getString("job_title") + "|"
							+ resultSet.getString("con_skill") + "|" + resultSet.getString("tech_skills") + "|"
							+ resultSet.getString("domain_skills") + "|" + resultSet.getString("commmunication_skills")
							+ "|" + resultSet.getString("comments") + "|" + resultSet.getString("STATUS") + "^";
				} else {
					if (resultSet.last()) {
						int eid = resultSet.getInt("so.eid");
						option1 = resultSet.getString("option1");

						if (!"".equals(option1)) {
							String[] str1 = option1.split("-");

							skill1Name1 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str1[0]));
							rightAns1 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str1[0]), eid);
							noOfQuestion1 = Integer.parseInt(str1[1]);
						}
						option2 = resultSet.getString("option2");

						if (!"".equals(option2)) {
							String[] str2 = option2.split("-");
							skill1Name2 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str2[0]));
							rightAns2 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str2[0]), eid);
							noOfQuestion2 = Integer.parseInt(str2[1]);
						}

						option3 = resultSet.getString("option3");

						if (!"".equals(option3)) {
							String[] str3 = option3.split("-");
							skill1Name3 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str3[0]));
							rightAns3 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str3[0]), eid);
							noOfQuestion3 = Integer.parseInt(str3[1]);
						}
						option4 = resultSet.getString("option4");

						if (!"".equals(option4)) {
							String[] str4 = option4.split("-");
							skill1Name4 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str4[0]));
							rightAns4 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str4[0]), eid);
							noOfQuestion4 = Integer.parseInt(str4[1]);
						}
						option5 = resultSet.getString("option5");

						if (!"".equals(option5)) {
							String[] str5 = option5.split("-");
							skill1Name5 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str5[0]));
							rightAns5 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str5[0]), eid);
							noOfQuestion5 = Integer.parseInt(str5[1]);
						}

						option6 = resultSet.getString("option6");

						if (!"".equals(option6)) {
							String[] str6 = option6.split("-");
							skill1Name6 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str6[0]));
							rightAns6 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str6[0]), eid);
							noOfQuestion6 = Integer.parseInt(str6[1]);
						}

						option7 = resultSet.getString("option7");

						if (!"".equals(option7)) {
							String[] str7 = option7.split("-");
							skill1Name7 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str7[0]));
							rightAns7 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str7[0]), eid);
							noOfQuestion7 = Integer.parseInt(str7[1]);
						}
						option8 = resultSet.getString("option8");

						if (!"".equals(option8)) {

							String[] str8 = option8.split("-");
							skill1Name8 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str8[0]));
							rightAns8 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str8[0]), eid);
							noOfQuestion8 = Integer.parseInt(str8[1]);
						}
						option9 = resultSet.getString("option9");
						if (!"".equals(option9)) {

							String[] str9 = option9.split("-");
							skill1Name9 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str9[0]));
							rightAns9 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str9[0]), eid);
							noOfQuestion9 = Integer.parseInt(str9[1]);
						}
						option10 = resultSet.getString("option10");
						if (!"".equals(option10)) {

							String[] str10 = option10.split("-");
							skill1Name10 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getReqSkillsSet(Integer.parseInt(str10[0]));
							rightAns10 = com.mss.msp.util.DataSourceDataProvider.getInstance()
									.getNoOfRightAns(Integer.parseInt(str10[0]), eid);
							noOfQuestion10 = Integer.parseInt(str10[1]);
						}
						if (resultSet.getString("se.completed_ts") != null) {

							date = DateUtility.getInstance()
									.convertToviewFormatInDashWithTime(resultSet.getString("se.completed_ts"));
						} else {

							date = "";
						}

						resultString = resultSet.getString("NAME") + "|" + resultSet.getString("job_title") + "|"
								+ resultSet.getString("email1") + "|" + resultSet.getString("phone1") + "|"
								+ DateUtility.getInstance()
										.convertToviewFormatInDash(resultSet.getString("so.createddate"))
								+ "|" + resultSet.getString("cr.STATUS") + "|" + StringUtils.chop(skill1Name1) + "|"
								+ noOfQuestion1 + "|" + StringUtils.chop(skill1Name2) + "|" + noOfQuestion2 + "|"
								+ StringUtils.chop(skill1Name3) + "|" + noOfQuestion3 + "|"
								+ StringUtils.chop(skill1Name4) + "|" + noOfQuestion4 + "|"
								+ StringUtils.chop(skill1Name5) + "|" + noOfQuestion5 + "|"
								+ StringUtils.chop(skill1Name6) + "|" + noOfQuestion6 + "|"
								+ StringUtils.chop(skill1Name7) + "|" + noOfQuestion7 + "|"
								+ StringUtils.chop(skill1Name8) + "|" + noOfQuestion8 + "|"
								+ StringUtils.chop(skill1Name9) + "|" + noOfQuestion9 + "|"
								+ StringUtils.chop(skill1Name10) + "|" + noOfQuestion10 + "|" + rightAns1 + "|"
								+ rightAns2 + "|" + rightAns3 + "|" + rightAns4 + "|" + rightAns5 + "|" + rightAns6
								+ "|" + rightAns7 + "|" + rightAns8 + "|" + rightAns9 + "|" + rightAns10 + "|"
								+ resultSet.getString("so.examstatus") + "|" + date + "|"
								+ resultSet.getString("cr.comments") + "^";
					}
				}
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
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: getTechReviewResultOnOverlay Method End*********************");
		return resultString;
	}

	/**
	 * *************************************************************************************************
	 *
	 * @Created Date:08/18/2015
	 *
	 * @Author:Jagan Chukkala<jchukkla@miraclesoft.com>
	 *
	 * @questionsCount() method is used to get the questions count of particular
	 *                   skill of organization
	 *
	 *
	 ***************************************************************************************************
	 */
	public String questionsCount(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction, int orgId)
			throws ServiceLocatorException {

		String resultString = "";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";
		try {

			System.out.println(
					"********************RecruitmentAjaxHandlerServiceImpl :: questionsCount() Method Start*********************");
			String skillData = recruitmentAjaxHandlerAction.getSkillCategoryArry();
			if (!"".equals(skillData)) {
				StringTokenizer stk = new StringTokenizer(skillData, ",");

				queryString = "SELECT skillid ,COUNT(IF(LEVEL='M',1, NULL)) as medium,COUNT(IF(LEVEL='L',1, NULL) ) as low,COUNT(IF(LEVEL='H',1, NULL) ) as high FROM sb_onlineexamQuestion  WHERE skillid=? AND orgid="
						+ orgId + " AND exam_type='T'";
				System.out.println("questionsCount() query string ------>" + queryString);
				connection = ConnectionProvider.getInstance().getConnection();
				preparedStatement = connection.prepareStatement(queryString);
				while (stk.hasMoreTokens()) {
					int skillId = Integer.parseInt(stk.nextToken());

					preparedStatement.setInt(1, skillId);

					resultSet = preparedStatement.executeQuery();

					while (resultSet.next()) {
						resultString += resultSet.getInt("low") + "|" + resultSet.getInt("medium") + "|"
								+ resultSet.getInt("high") + "|"
								+ StringUtils.chop(
										com.mss.msp.util.DataSourceDataProvider.getInstance().getReqSkillsSet(skillId))
								+ "^";
					}
				}
			}

		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
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
				"********************RecruitmentAjaxHandlerServiceImpl :: questionsCount() Method End*********************");
		return resultString;
	}

	/**
	 * *************************************************************************************************
	 *
	 * @Created Date:08/18/2015
	 *
	 * @Author:Jagan Chukkala<jchukkla@miraclesoft.com>
	 *
	 * @questionsCountCheck() method is used to get the check no of questions of
	 *                        skill of organization based on severity
	 *
	 ***************************************************************************************************
	 */
	public String questionsCountCheck(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction, int orgId)
			throws ServiceLocatorException {

		String resultString = "";
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: questionsCountCheck() Method Start*********************");
		try {

			String skillData = recruitmentAjaxHandlerAction.getSkillCategoryArry();
			if (!"".equals(skillData)) {
				StringTokenizer stk = new StringTokenizer(skillData, ",");
				int skillCount = stk.countTokens();

				int total = recruitmentAjaxHandlerAction.getTechReviewQuestions() / skillCount;
				int extraQuestions = recruitmentAjaxHandlerAction.getTechReviewQuestions() - (total * skillCount);
				while (stk.hasMoreTokens()) {
					int skillId = Integer.parseInt(stk.nextToken());

					int skillQues = com.mss.msp.util.DataSourceDataProvider.getInstance().noOfQuestionsReturns(skillId,
							recruitmentAjaxHandlerAction.getTechReviewSeverity(), "T", orgId);// ---------------->have
																								// to
																								// change
																								// to
																								// orgId
																								// variable
					if ((total + extraQuestions) < skillQues) {
						resultString = "allowed";
					} else {
						resultString = "notallowed";
						break;
					}

				}
			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
		}

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: questionsCountCheck() Method End*********************");
		return resultString;
	}

	/**
	 * *************************************************************************************************
	 *
	 * @Created Date:08/19/2015
	 *
	 * @Author:Jagan Chukkala<jchukkla@miraclesoft.com>
	 *
	 * @skillsQuestions() method is used to get the questions per skill of
	 *                    organization based on severity
	 *
	 ***************************************************************************************************
	 */
	public String skillsQuestions(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction, int orgId)
			throws ServiceLocatorException {

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: skillsQuestions Method Start*********************");
		String resultString = "";

		try {

			String skillData = recruitmentAjaxHandlerAction.getSkillCategoryArry();
			int count = 0;
			if (!"".equals(skillData)) {
				StringTokenizer stk = new StringTokenizer(skillData, ",");

				while (stk.hasMoreTokens()) {
					count++;
					int skillId = Integer.parseInt(stk.nextToken());

					int skillQues = com.mss.msp.util.DataSourceDataProvider.getInstance().noOfQuestionsReturns(skillId,
							recruitmentAjaxHandlerAction.getTechReviewSeverity(),
							recruitmentAjaxHandlerAction.getTechExamType(), orgId);// ---------------->have
																					// to
																					// change
																					// to
																					// orgId
																					// variable

					resultString += skillQues + "|" + skillId + "|"
							+ StringUtils.chop(
									com.mss.msp.util.DataSourceDataProvider.getInstance().getReqSkillsSet(skillId))
							+ "|" + count + "^";
				}

			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
		}

		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: skillsQuestions Method End*********************");
		return resultString;
	}

	/**
	 * *************************************
	 *
	 * @onlineExamStatusSave() method is used to set examStatus details of
	 *                         consultant
	 *
	 *
	 * @Author:jagan<jchukkala@miraclesoft.com>
	 *
	 * @Created Date:10/23/2015
	 *
	 **************************************
	 */
	public String saveOnlineExamStatus(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction)
			throws ServiceLocatorException {

		String resultString = "";
		Connection connection = null;
		Statement statement = null;
		String queryString = "";
		int result = 0;
		try {
			System.out.println(
					"********************RecruitmentAjaxHandlerServiceImpl :: saveOnlineExamStatus Method Start*********************");

			queryString = "UPDATE con_techreview ct left outer join req_con_rel rc on(rc.consultantId=ct.consultant_id) "
					+ "SET " + "ct.comments='" + recruitmentAjaxHandlerAction.getCnslt_comments() + "' ,"
					+ "rc.modified_By='" + recruitmentAjaxHandlerAction.getUserSessionId() + "'," + "rc.modified_date='"
					+ com.mss.msp.util.DateUtility.getInstance().getCurrentMySqlDate() + "'," + "ct.STATUS='"
					+ recruitmentAjaxHandlerAction.getExamStatus() + "' ," + "rc.STATUS='"
					+ recruitmentAjaxHandlerAction.getExamStatus() + "' ," + "rc.customercomments='"
					+ recruitmentAjaxHandlerAction.getCnslt_comments() + "' " + " WHERE ct.consultant_id="
					+ recruitmentAjaxHandlerAction.getConsult_id() + " AND ct.req_id="
					+ recruitmentAjaxHandlerAction.getRequirementId() + " " + " AND rc.consultantId="
					+ recruitmentAjaxHandlerAction.getConsult_id() + " AND rc.reqId="
					+ recruitmentAjaxHandlerAction.getRequirementId() + " " + " AND ct.id="
					+ recruitmentAjaxHandlerAction.getConTechReviewId();
			System.out.println("saveOnlineExamStatus()  gueryString------->" + queryString);
			connection = ConnectionProvider.getInstance().getConnection();
			statement = connection.createStatement();
			result = statement.executeUpdate(queryString);

			if (result > 0) {
				resultString = "Updated Successfully";
			} else {
				resultString = "Not Updated";
			}

		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (statement != null) {
					statement.close();
					statement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: saveOnlineExamStatus Method End*********************");
		return resultString;
	}

	/**
	 * *****************************************************************************
	 *
	 * @doWithdrawConsultant() method is used to withdraw the cosultant by
	 *                         vendor
	 *
	 *
	 *
	 * @Author:manikanta eeralla<meeralla@miraclesoft.com>
	 *
	 * @Created Date:10/01/2016
	 *
	 *******************************************************************************
	 */
	public int doWithdrawConsultant(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction)
			throws ServiceLocatorException {
		int updatedRows = 0;
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: doWithdrawConsultant Method Start*********************");
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String queryString = "";
		queryString = "update req_con_rel set status=?,comments=? WHERE reqId="
				+ recruitmentAjaxHandlerAction.getRequirementId() + " and consultantId='"
				+ recruitmentAjaxHandlerAction.getConsultantId() + "'" + " and createdbyOrgId="
				+ recruitmentAjaxHandlerAction.getSessionOrgId() + "";

		System.out.println("doWithdrawConsultant() queryString------>" + queryString);
		try {
			connection = ConnectionProvider.getInstance().getConnection();

			preparedStatement = connection.prepareStatement(queryString);

			preparedStatement.setString(1, "Withdraw");
			preparedStatement.setString(2, recruitmentAjaxHandlerAction.getWithdrawComments());

			updatedRows = preparedStatement.executeUpdate();

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
				"********************RecruitmentAjaxHandlerServiceImpl :: doWithdrawConsultant Method End*********************");
		return updatedRows;
	}

	/**
	 * ****************************************************************************
	 *
	 * @doDeclineConsultant() method is used to reject the cosultant by customer
	 *
	 *
	 *
	 * @Author:manikanta eeralla<meeralla@miraclesoft.com>
	 *
	 * @Created Date:10/01/2016
	 *
	 *****************************************************************************
	 */
	public int doDeclineConsultant(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction)
			throws ServiceLocatorException {
		int updatedRows = 0;
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: doDeclineConsultant() Method Start*********************");
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String queryString = "";
		queryString = "update req_con_rel set status=?,customercomments=? WHERE reqId="
				+ recruitmentAjaxHandlerAction.getRequirementId() + " and consultantId='"
				+ recruitmentAjaxHandlerAction.getConsultantId() + "'" + " and createdbyOrgId="
				+ recruitmentAjaxHandlerAction.getCreatedByOrgId() + "";

		System.out.println("doDeclineConsultant() queryString------>" + queryString);
		try {
			connection = ConnectionProvider.getInstance().getConnection();

			preparedStatement = connection.prepareStatement(queryString);

			preparedStatement.setString(1, "Rejected");
			preparedStatement.setString(2, recruitmentAjaxHandlerAction.getRejectionComments());

			updatedRows = preparedStatement.executeUpdate();

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
				"********************RecruitmentAjaxHandlerServiceImpl :: doDeclineConsultant() Method End*********************");
		return updatedRows;
	}

	public int doConsultantVendorAssociation(int consultantId, int vendorId) throws ServiceLocatorException {

		int updatedRows = 0;
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: doConsultantVendorAssociation() Method Start*********************");
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String queryString = "";
		try {
			connection = ConnectionProvider.getInstance().getConnection();
			queryString = "insert into consultant_ven_rel (consultantid,vendorid,status,createdby) values(?,?,?,?)";

			System.out.println("doConsultantVendorAssociation :: query string ------>" + queryString);
			System.out.println("doConsultantVendorAssociation :: consultantId ------>" + consultantId);
			System.out.println("doConsultantVendorAssociation :: vendorId ------>" + vendorId);

			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, consultantId);
			preparedStatement.setInt(2, vendorId);
			preparedStatement.setString(3, "Submitted");
			preparedStatement.setInt(4, consultantId);

			updatedRows = preparedStatement.executeUpdate();

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
				"********************RecruitmentAjaxHandlerServiceImpl :: doConsultantVendorAssociation() Method End*********************");
		return updatedRows;

	}

	public String getUserEmailForRequirement(String empName, int vendorId, String resouceType)
			throws ServiceLocatorException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String queryString = "";
		JSONObject mainJson = null;
		System.out.println(
				"********************UserAjaxHandlerServiceImpl :: getExternalEmployeeDetails Method Start*********************");
		boolean isGetting = false;
		String exist = "";
		StringBuffer sb = new StringBuffer();
		if ("IC".equalsIgnoreCase(resouceType)) {
			queryString = "SELECT concat(trim(first_name),'.',trim(last_name)) AS FullName,usr_id,Email1  FROM users WHERE (Email1 LIKE '"
					+ empName + "%') and cur_status='Active' AND created_by_org_id=" + vendorId
					+ " ORDER BY FullName LIMIT 30";
			// queryString = "SELECT
			// concat(trim(first_name),'.',trim(last_name),'(',email1,')') AS
			// FullName,usr_id FROM users WHERE (last_name LIKE '" + empName +
			// "%' OR first_name LIKE '" + empName + "%') and
			// cur_status='Active' AND created_by_org_id=" + vendorId + " ORDER
			// BY FullName LIMIT 30";
			// queryString = "SELECT
			// CONCAT(TRIM(first_name),'.',TRIM(last_name),'(',email1,')') AS
			// FullName FROM usr_details ud LEFT OUTER JOIN users u
			// ON(ud.usr_id=u.usr_id) WHERE cur_status='Active' AND
			// created_by_org_id=" + userAjaxHandlerAction.getSessionOrgId() + "
			// AND email1= ";
		} else {
			// queryString = "SELECT
			// concat(trim(first_name),'.',trim(last_name),'(',email1,')') AS
			// FullName,usr_id FROM users WHERE (last_name LIKE '" + empName +
			// "%' OR first_name LIKE '" + empName + "%') and
			// cur_status='Active' AND org_id=" + vendorId + " ORDER BY FullName
			// LIMIT 30";
			queryString = "SELECT concat(trim(first_name),'.',trim(last_name)) AS FullName,usr_id,Email1  FROM users WHERE (Email1 LIKE '"
					+ empName + "%') and cur_status='Active' AND org_id=" + vendorId + " ORDER BY FullName LIMIT 30";
		}
		try {
			connection = ConnectionProvider.getInstance().getConnection();
			System.out.println("getExternalEmployeeDetails :: query string ------>" + queryString);
			preparedStatement = connection.prepareStatement(queryString);
			resultSet = preparedStatement.executeQuery();
			int count = 0;
			sb.append("<xml version=\"1.0\">");
			sb.append("<EMPLOYEES>");
			mainJson = new JSONObject();
			JSONArray ja = new JSONArray();
			JSONObject subJson = null;
			System.out.println("before loop");
			while (resultSet.next()) {
				subJson = new JSONObject();
				subJson.put("NAME", resultSet.getString(1));
				subJson.put("EMPID", resultSet.getInt(2));
				subJson.put("Email", resultSet.getString(3));
				System.out.println("subJson===" + subJson.toString());
				ja.put(subJson);
				System.out.println("ja" + ja);
				sb.append("<EMPLOYEE><VALID>true</VALID>");

				sb.append("<NAME>" + resultSet.getString(1) + "</NAME>");

				sb.append("<EMPID>" + resultSet.getInt(2) + "</EMPID>");
				sb.append("</EMPLOYEE>");
				isGetting = true;
				// count++;
			}
			System.out.println("loop end");
			mainJson.put("consultant", ja);
			mainJson.put("isGetting", isGetting);
			System.out.println("mainJson" + mainJson);
			if (!isGetting) {
				isGetting = false;
				// nothing to show
				sb.append("<EMPLOYEE><VALID>false</VALID></EMPLOYEE>");
			}
			sb.append("</EMPLOYEES>");
			sb.append("</xml>");
		} catch (SQLException sqle) {

			throw new ServiceLocatorException(sqle);
		} catch (org.json.JSONException e) {
			throw new ServiceLocatorException(e);
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException sql) {
				sql.printStackTrace();
			}
		}
		System.out.println("mainJson==" + mainJson.toString());
		System.out.println(
				"********************UserAjaxHandlerServiceImpl :: getExternalEmployeeDetails Method End*********************");
		// return sb.toString();

		return mainJson.toString();
	}

	public String doGetAvailableConsultantList(String email, int vendorId, String resouceType, String skillSet,
			String requirementId, String availableFrom, String rateFrom, String rateTo) throws ServiceLocatorException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String queryString = "";
		JSONObject mainJson = null;
		System.out.println(
				"********************UserAjaxHandlerServiceImpl :: getExternalEmployeeDetails Method Start*********************");
		boolean isGetting = false;
		String exist = "";
		JSONObject finalJson = null;

		queryString = "SELECT CONCAT(TRIM(first_name),'.',TRIM(last_name)) AS FullName,users.usr_id,Email1,phone1,consultant_skills,experience,rate_salary,available_from FROM  users LEFT JOIN usr_details ON(users.usr_id=usr_details.usr_id) WHERE cur_status='Active' ";

		// queryString = queryString+" AND users.usr_id NOT IN (SELECT
		// consultantId FROM req_con_rel WHERE reqId="+requirementId+") ";

		if ("IC".equalsIgnoreCase(resouceType)) {
			queryString = queryString + " AND users.usr_id NOT IN (SELECT consultantId FROM req_con_rel WHERE reqId="
					+ requirementId + " AND flag ='C') ";
			queryString += "AND created_by_org_id=" + vendorId;
			// queryString = "SELECT
			// concat(trim(first_name),'.',trim(last_name),'(',email1,')') AS
			// FullName,usr_id FROM users WHERE (last_name LIKE '" + empName +
			// "%' OR first_name LIKE '" + empName + "%') and
			// cur_status='Active' AND created_by_org_id=" + vendorId + " ORDER
			// BY FullName LIMIT 30";
			// queryString = "SELECT
			// CONCAT(TRIM(first_name),'.',TRIM(last_name),'(',email1,')') AS
			// FullName FROM usr_details ud LEFT OUTER JOIN users u
			// ON(ud.usr_id=u.usr_id) WHERE cur_status='Active' AND
			// created_by_org_id=" + userAjaxHandlerAction.getSessionOrgId() + "
			// AND email1= ";
		} else {
			queryString = queryString + " AND users.usr_id NOT IN (SELECT consultantId FROM req_con_rel WHERE reqId="
					+ requirementId + " AND  flag ='E') ";
			// queryString = "SELECT
			// concat(trim(first_name),'.',trim(last_name),'(',email1,')') AS
			// FullName,usr_id FROM users WHERE (last_name LIKE '" + empName +
			// "%' OR first_name LIKE '" + empName + "%') and
			// cur_status='Active' AND org_id=" + vendorId + " ORDER BY FullName
			// LIMIT 30";
			queryString = " AND org_id=" + vendorId;
		}

		if (email != null && !"".equals(email)) {
			queryString += " AND Email1='" + email + "' ";
		}
		if (skillSet != null && !"".equals(skillSet)) {
			skillSet = "+" + skillSet.replaceAll(",", " +");
			queryString += " AND MATCH (consultant_skills) AGAINST ('" + skillSet + "' IN BOOLEAN MODE) ";
		}

		if (availableFrom != null && !"".equals(availableFrom)) {
			queryString += " AND available_from>='" + DateUtility.getInstance().convertStringToMySQLDate1(availableFrom)
					+ "' ";
		}

		if (rateFrom != null && !"".equals(rateFrom)) {
			queryString += " AND rate_salary>=" + rateFrom + " ";
		}

		if (rateTo != null && !"".equals(rateTo)) {
			queryString += " AND rate_salary<=" + rateTo + " ";
		}
		queryString += " ORDER BY FullName";
		try {
			connection = ConnectionProvider.getInstance().getConnection();
			System.out.println("getExternalEmployeeDetails :: query string ------>" + queryString);
			preparedStatement = connection.prepareStatement(queryString);
			resultSet = preparedStatement.executeQuery();
			int count = 0;

			mainJson = new JSONObject();
			// JSONArray ja = new JSONArray();
			JSONObject subJson = null;
			System.out.println("before loop");
			int i = 0;
			while (resultSet.next()) {
				subJson = new JSONObject();
				subJson.put("NAME", resultSet.getString(1));
				subJson.put("EMPID", resultSet.getInt(2));
				subJson.put("Email", resultSet.getString(3));
				if (resultSet.getString("consultant_skills") != null
						&& !"".equals(resultSet.getString("consultant_skills")))
					subJson.put("SkillSet", resultSet.getString("consultant_skills"));
				else
					subJson.put("SkillSet", "");
				if (resultSet.getString("experience") != null && !"".equals(resultSet.getString("experience")))
					subJson.put("Experience", resultSet.getString("experience"));
				else
					subJson.put("Experience", "");

				if (resultSet.getString("rate_salary") != null && !"".equals(resultSet.getString("rate_salary")))
					subJson.put("Rate", resultSet.getString("rate_salary"));
				else
					subJson.put("Rate", "");

				if (resultSet.getString("available_from") != null && !"".equals(resultSet.getString("available_from")))
					subJson.put("AvailableFrom", com.mss.msp.util.DateUtility.getInstance()
							.convertDateToViewInDashFormat(resultSet.getDate("available_from")));
				else
					subJson.put("AvailableFrom", "");

				System.out.println("subJson===" + subJson.toString());
				mainJson.put(String.valueOf(i), subJson);
				// ja.put(subJson);
				// System.out.println("ja"+ja);
				i++;
				isGetting = true;
				// count++;
			}
			System.out.println("loop end");
			finalJson = new JSONObject();
			finalJson.put("consultant", mainJson);
			finalJson.put("isGetting", isGetting);
			System.out.println("finalJson--" + finalJson);

		} catch (SQLException sqle) {

			throw new ServiceLocatorException(sqle);
		} catch (org.json.JSONException e) {
			throw new ServiceLocatorException(e);
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException sql) {
				sql.printStackTrace();
			}
		}
		System.out.println("mainJson==" + finalJson.toString());
		System.out.println(
				"********************UserAjaxHandlerServiceImpl :: getExternalEmployeeDetails Method End*********************");
		// return sb.toString();

		return finalJson.toString();
	}

	/*
	 * Author : Triveni Nidra Date : 06/16/2017 Description : Profile submitting
	 * against to Requirement
	 */

	public String storeProofData(HttpServletRequest httpServletRequest, RecruitmentAjaxHandlerAction requirementAction)
			throws ServiceLocatorException {

		Connection connection = null;
		CallableStatement callableStatement = null;
		ResultSet resultSet = null;
		String queryString = "";

		StringBuffer stringBuffer = new StringBuffer();

		String Result = "";
		boolean isExceute = false;

		// String str = requirementAction.getPropsedSkills();
		// StringTokenizer stk = new StringTokenizer(str, ",");
		// String skillsResultString = "";
		// log.info("********************RequirementServiceImpl ::
		// storeProofData Method Start*********************");
		// while (stk.hasMoreTokens()) {
		// skillsResultString +=
		// com.mss.msp.util.DataSourceDataProvider.getInstance().getReqSkillsSet(Integer.parseInt(stk.nextToken()));

		// }

		// requirementAction.setSkillList(StringUtils.chop(skillsResultString));
		try {
			connection = ConnectionProvider.getInstance().getConnection();

			callableStatement = connection.prepareCall("{CALL addConsultantToReq(?,?,?,?,?)}");
			// log.info("storeProofData :: procedure name : addConsultantToReq
			// ");
			callableStatement.setInt(1, Integer.parseInt(
					httpServletRequest.getSession(false).getAttribute(ApplicationConstants.USER_ID).toString()));
			callableStatement.setInt(2, Integer.parseInt(requirementAction.getConsultantId()));
			callableStatement.setInt(3, Integer.parseInt(requirementAction.getRequirementId()));
			// callableStatement.setString(4, requirementAction.getSkillList());
			callableStatement.setInt(4, Integer.parseInt(
					httpServletRequest.getSession(false).getAttribute(ApplicationConstants.ORG_ID).toString()));

			callableStatement.registerOutParameter(5, Types.VARCHAR);
			isExceute = callableStatement.execute();
			Result = callableStatement.getString(5);

			System.out.println("Result-->" + Result);
			if (Result.equalsIgnoreCase("AddSuccess")) {
				// log.info("****************** in impl result after
				// NotExist:::::::::" + Result);
			} else {
				// log.info("****************** in impl result after :::::::::"
				// + Result);
			}

		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {

				if (callableStatement != null) {
					callableStatement.close();
					callableStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		// log.info("********************RequirementServiceImpl ::
		// storeProofData Method End*********************");
		return Result;
	}

	/**
	 * ****************************************************************************
	 *
	 * @doUpdateCSRStatusforConsultant() method is used to Approve or Reject the
	 *                                   consultant by the CSR
	 *
	 *
	 *
	 * @Author:phanindra kanuri<pkanuri@miraclesoft.com>
	 *
	 * @Created Date:16/06/2017
	 *
	 *****************************************************************************
	 */
	public String doUpdateCSRStatusforConsultant(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction)
			throws ServiceLocatorException {

		String resultString = "";
		Connection connection = null;
		Statement statement = null;
		String queryString = "";
		int result = 0;
		try {
			System.out.println(
					"********************RecruitmentAjaxHandlerServiceImpl :: saveOnlineExamStatus Method Start*********************");

			queryString = "UPDATE req_con_rel SET csr_status='" + recruitmentAjaxHandlerAction.getStatus()
					+ "', csr_comments='" + recruitmentAjaxHandlerAction.getComments() + "' WHERE reqId="
					+ recruitmentAjaxHandlerAction.getRequirementId() + " AND consultantId="
					+ recruitmentAjaxHandlerAction.getConsult_id();
			System.out.println("doUpdateCSRStatusforConsultant  gueryString------->" + queryString);
			connection = ConnectionProvider.getInstance().getConnection();
			statement = connection.createStatement();
			result = statement.executeUpdate(queryString);

			if (result > 0) {
				resultString = "Updated Successfully";
			} else {
				resultString = "Not Updated";
			}

		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (statement != null) {
					statement.close();
					statement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: saveOnlineExamStatus Method End*********************");
		return resultString;
	}

	/**
	 * ****************************************************************************
	 * Date : June 19 2017
	 *
	 * Author : triveni niddara <tniddara@miraclesoft.com>
	 *
	 *
	 * *****************************************************************************
	 */
	public String getBackgroundAttachmentDetails(RecruitmentAjaxHandlerAction recruitmentajaxhandleraction)
			throws ServiceLocatorException {
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: getAttachmentDetails Method Start*********************");

		String resultString = "";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String queryString = "";

		ConsultantVTO consult = new ConsultantVTO();
		JSONObject mainJson = new JSONObject();

		try {
			// queryString = "SELECT * FROM acc_rec_attachment WHERE
			// (object_type='CV' OR object_type = 'CSA') AND object_id=? order
			// by status";
			queryString = "SELECT * FROM acc_rec_attachment WHERE (object_type='EV' OR object_type = 'CD') AND object_id=? order by status, opp_created_date DESC";

			System.out.println("getAttachmentDetails() queryString-->" + queryString);
			connection = ConnectionProvider.getInstance().getConnection();

			preparedStatement = connection.prepareStatement(queryString);

			preparedStatement.setInt(1, recruitmentajaxhandleraction.getConsult_id());

			resultSet = preparedStatement.executeQuery();
			JSONObject subJson = null;
			int i = 0;
			while (resultSet.next()) {
				subJson = new JSONObject();
				subJson.put("acc_attachment_id", resultSet.getString("acc_attachment_id"));
				if ((!"".equals(resultSet.getString("attachment_title"))
						&& resultSet.getString("attachment_title") != null)) {

					subJson.put("attachment_title", resultSet.getString("attachment_title"));
				} else {
					subJson.put("attachment_title", "--");

				}
				subJson.put("object_id", resultSet.getString("object_id"));
				subJson.put("attachment_name", resultSet.getString("attachment_name"));
				subJson.put("object_type", resultSet.getString("object_type"));
				subJson.put("attachment_path", resultSet.getString("attachment_path"));
				subJson.put("opp_created_date", resultSet.getString("opp_created_date"));
				subJson.put("object_id", resultSet.getString("object_id"));
				subJson.put("req_id", resultSet.getString("req_id"));
				subJson.put("status", resultSet.getString("status"));

				mainJson.put(String.valueOf(i), subJson);
				i++;
				/*
				 * consult.setConsult_acc_attachment_id(resultSet.getString(
				 * "acc_attachment_id"));
				 * 
				 * 
				 * consult.setConsult_object_id(resultSet.getInt("object_id"));
				 * consult.setConsult_attachment_name(resultSet.getString(
				 * "attachment_name"));
				 * consult.setConsult_object_type(resultSet.getString(
				 * "object_type"));
				 * consult.setConsult_attachment_path(resultSet.getString(
				 * "attachment_path"));
				 * consult.setConsult_attachment_created_date(com.mss.msp.util.
				 * DateUtility.getInstance()
				 * .convertToviewFormat(resultSet.getString("opp_created_date"))
				 * );
				 * 
				 * consult.setConsult_attachment_status(resultSet.getString(
				 * "status"));
				 * 
				 * 
				 * resultString += consult.getConsult_attachment_name() + "|" +
				 * consult.getConsult_object_type() + '|' +
				 * consult.getConsult_attachment_path() + "|" +
				 * consult.getConsult_attachment_created_date() + "|" +
				 * consult.getConsult_acc_attachment_id() + "|" +
				 * consult.getConsult_attachment_status() + "|" +
				 * consult.getAttachmentTitle() + '^';
				 */

			}
		} catch (Exception sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
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
				"********************RecruitmentAjaxHandlerServiceImpl :: getAttachmentDetails Method End*********************");
		return mainJson.toString();
	}

	public String insertOrUpdateRatecard(RecruitmentAjaxHandlerAction recruitmentajaxhandleraction)
			throws ServiceLocatorException {
		String resultMessage = "";
		Connection connection = null;

		PreparedStatement preparedStatement = null;
		String queryString = "";
		int result = 0;
		try {
			System.out.println(
					"********************RecruitmentAjaxHandlerServiceImpl :: insertOrUpdateRatecard Method Start*********************");
			connection = ConnectionProvider.getInstance().getConnection();
			if (recruitmentajaxhandleraction.getRatecardId() != null
					&& !"".equals(recruitmentajaxhandleraction.getRatecardId())) {
				queryString = " update orgratecards  SET jobtitle=?,minrate=?,maxrate=?,comments=? WHERE id ="
						+ recruitmentajaxhandleraction.getRatecardId();
				System.out.println("update in insertOrUpdateRatecard ------->" + queryString);
				preparedStatement = connection.prepareStatement(queryString);
				preparedStatement.setString(1, recruitmentajaxhandleraction.getJobTitle());
				preparedStatement.setString(2, recruitmentajaxhandleraction.getMinRate());
				preparedStatement.setString(3, recruitmentajaxhandleraction.getMaxRate());
				preparedStatement.setString(4, recruitmentajaxhandleraction.getComments());
				result = preparedStatement.executeUpdate();
				resultMessage = "Updated Successfully";
			} else {
				queryString = "insert into orgratecards (jobtitle,minrate,maxrate,comments,orgid) values(?,?,?,?,?)";
				System.out.println("insert in  insertOrUpdateRatecard:: query string ------>" + queryString);
				preparedStatement = connection.prepareStatement(queryString);
				preparedStatement.setString(1, recruitmentajaxhandleraction.getJobTitle());
				preparedStatement.setString(2, recruitmentajaxhandleraction.getMinRate());
				preparedStatement.setString(3, recruitmentajaxhandleraction.getMaxRate());
				preparedStatement.setString(4, recruitmentajaxhandleraction.getComments());
				preparedStatement.setInt(5, recruitmentajaxhandleraction.getSessionOrgId());
				result = preparedStatement.executeUpdate();
				resultMessage = "Inserted Successfully";
			}

			/*
			 * if (result > 0) { resultString = "Updated Successfully"; } else {
			 * resultString = "Not Updated"; }
			 */

		} catch (Exception sqe) {
			sqe.printStackTrace();
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

			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		System.out.println(
				"********************RecruitmentAjaxHandlerServiceImpl :: insertOrUpdateRatecard Method End*********************");
		return resultMessage;
	}

	
	public String getJobTitleSuggestions(String jobTitle,int sessionOrgId) throws ServiceLocatorException{

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String queryString = "";
		JSONObject mainJson = null;
		System.out.println(
				"********************UserAjaxHandlerServiceImpl :: getJobTitleSuggestions Method Start*********************");
		boolean isGetting = false;
		String exist = "";
		
		
			queryString = "SELECT jobtitle,minrate,maxrate FROM orgratecards WHERE jobtitle LIKE '"+jobTitle+"%' AND orgid="+ sessionOrgId +" ORDER BY jobtitle LIMIT 30";
		
			
		try {
			connection = ConnectionProvider.getInstance().getConnection();
			System.out.println("getJobTitleSuggestions :: query string ------>" + queryString);
			preparedStatement = connection.prepareStatement(queryString);
			resultSet = preparedStatement.executeQuery();
			int count = 0;
			
			mainJson = new JSONObject();
			JSONArray ja = new JSONArray();
			JSONObject subJson = null;
			System.out.println("before loop");
			while (resultSet.next()) {
				subJson = new JSONObject();
				subJson.put("jobTitle", resultSet.getString(1));
				subJson.put("minRate", resultSet.getInt(2));
				subJson.put("maxRate", resultSet.getString(3));
				System.out.println("subJson===" + subJson.toString());
				ja.put(subJson);
				System.out.println("ja" + ja);
				
				isGetting = true;
				// count++;
			}
			System.out.println("loop end");
			mainJson.put("rateCard", ja);
			mainJson.put("isGetting", isGetting);
			System.out.println("mainJson" + mainJson);
		
		} catch (SQLException sqle) {

			throw new ServiceLocatorException(sqle);
		} catch (org.json.JSONException e) {
			throw new ServiceLocatorException(e);
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (preparedStatement != null) {
					preparedStatement.close();
					preparedStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException sql) {
				sql.printStackTrace();
			}
		}
		System.out.println("mainJson==" + mainJson.toString());
		System.out.println(
				"********************UserAjaxHandlerServiceImpl :: getJobTitleSuggestions Method End*********************");
		// return sb.toString();

		return mainJson.toString();
	}
}
