/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.msp.reccruitmentAjax;

import com.mss.msp.util.ServiceLocatorException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author NagireddySeerapu
 */
public interface RecruitmentAjaxHandlerService {
    //for add consultant created by Aklakh

    public int getAddedConsultantDetails(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction, int OId) throws ServiceLocatorException;

    public String getAttachmentDetails( RecruitmentAjaxHandlerAction aThis) throws ServiceLocatorException;
    // add by Aklakh

    public String getConsultantTechReviews(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction) throws ServiceLocatorException;

    public String techReviewCommentsOverlay(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction) throws ServiceLocatorException;

    public String getTechReviewResultOnOverlay(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction) throws ServiceLocatorException;
   
    public String questionsCount(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction,int orgId) throws ServiceLocatorException;
   
    public String questionsCountCheck(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction,int orgId) throws ServiceLocatorException;
    
    public String skillsQuestions(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction,int orgId) throws ServiceLocatorException;
    
    public String saveOnlineExamStatus(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction) throws ServiceLocatorException;
    
    public int doWithdrawConsultant(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction) throws ServiceLocatorException;
    
    public int doDeclineConsultant(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction) throws ServiceLocatorException;
    
    public int doConsultantVendorAssociation(int consultantId, int vendorId) throws ServiceLocatorException;
    
    public String getUserEmailForRequirement(String empName, int vendorId,String resouceType) throws ServiceLocatorException;
    public String doGetAvailableConsultantList(String empName, int vendorId,String resouceType,String skillSet,String requirementId,String availableFrom,String rateFrom,String rateTo) throws ServiceLocatorException;
    public String storeProofData(HttpServletRequest httpServletRequest, RecruitmentAjaxHandlerAction requirementAction) throws ServiceLocatorException ;
    public String doUpdateCSRStatusforConsultant(RecruitmentAjaxHandlerAction recruitmentAjaxHandlerAction) throws ServiceLocatorException;

    public String getBackgroundAttachmentDetails(RecruitmentAjaxHandlerAction recruitmentajaxhandleraction) throws ServiceLocatorException ;
 
    public String insertOrUpdateRatecard(RecruitmentAjaxHandlerAction recruitmentajaxhandleraction) throws ServiceLocatorException ;
    
    public String getJobTitleSuggestions(String jobTitle,int sessionOrgId) throws ServiceLocatorException;

}
