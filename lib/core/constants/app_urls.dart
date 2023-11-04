import 'app_flavors.dart';

class AppUrl{
  static const stagingUrl = 'https://api-s2.musahm.com/api/';
  static const productionUrl = 'https://api-s2.musahm.com/api/';
  static String Function(String) get chatUri =>
          (id) => 'https://api-s2.musahm.com/chat?userId=$id&&chatMemberTypeId=1';
  static getServerUrl(String appFlavor) {
    switch (appFlavor) {
      case AppFlavors.production:
        return AppUrl.productionUrl;
      case AppFlavors.staging:
        return AppUrl.stagingUrl;
      default:
        return AppUrl.stagingUrl;
    }
  }

  static const String getLogin = "Auth/PartnerLogin";
  static const String postAdminLogin = "Auth/AdminLoginAsPartner";
  static const String postVerifyOtp = "Auth/VerifyOTP";
  static const String getCompaniesCount = "Partners/";
  static const String getCompanies = "Partners/";
  static const String getCompany = "Companies/";
  static const String getChangeCompany = "Auth/PartnerChangeCompany/";
  static const String getPartnersManagers = "Partners/Managers";
  static const String getCompanySharesCertificate = "Partners/ShareCertificate/";
  static const String getCompanySharesCertificatePdf = "Partners/ShareCertificate/Pdf/";
  static const String getPartnersInfo= "Partners";
  static const String updatePartnersInfo= "Partners/CustomPartner";
  static const String getCountries= "Countries";
  static const String postRefreshToken= "Auth/RefreshToken";
  static String Function(String) get getSignature =>
          (id) => 'Partners/$id/Signature';
  static String Function(String) get deleteSignature =>
          (id) => 'Partners/$id/Signature';
  static const String postSignature= "Partners/Signature";
  static const String postProposals= "HomePageSection/ContactUs";
  static const String getSellSharesRequests= "SellSharesRequests";
  static const String getSellSharesRequestsTypes= "SellSharesRequests/SellSharesRequestsTypes";
  static const String getSellSharesRequestsStatus= "SellSharesRequests/SellSharesRequestsStatuses";
  static String Function(String) get getVotes =>
          (id) => 'Partners/$id/CurrentVoting';
  static String Function(String) get getPaymentUrl =>
          (id) => 'SellSharesRequests/PaymentURL/$id';
 static String Function(String) get postReconfirmationSell =>
          (id) => 'SellSharesRequests/$id/ReConfirmationData';
 static String Function(String) get postConfirmationSell =>
          (id) => 'SellSharesRequests/$id/ConfirmationData';
  static const String postPayment= "SellSharesRequests/Payment";
  static String Function(String) get getContract =>
          (id) => 'SellSharesRequests/$id/PdfContract';
  static String Function(String) get postCancelSellRequest =>
          (id) => 'SellSharesRequests/$id/Cancellation';
  static const String getMeetings='Meetings/AllActiveMeetings';
  static const String getCommittees='Committees';
  static const String getComitteesTypes='Committees/Types';
  static String Function(String) get getCommitteesMembers=>
          (id) => 'Committees/$id/Members';
  static const String getCommitteesStatus='Committees/Statuses';
  static String Function(String) get getCommitteesMeetingsMinutes=>
          (id) => 'Committees/$id/MeetingMinutes';
  static String Function(String) get postPay =>
          (id) => 'SellSharesRequests/$id/Fees';
  static String Function(String) get postShareTransfer =>
          (id) => 'SellSharesRequests/$id/SharesTransfer';
  static String Function(String companyId,String partnerId,String excludedPartnerId) get getPartnerBuyerData =>
          (companyId,partnerId,excludedPartnerId) => 'Partners/$companyId/$partnerId/$excludedPartnerId';
  
   static String Function(String) get getApplicationDetails=>
          (id) => 'SellSharesRequests/$id';
  static String Function(String) get getTermsAndConditions=>
          (id) => 'TermsAndConditions/$id';
  static String Function(String companyId,String partnerId,) get getAllCompanyPartner=>
          (companyId,partnerId) => 'Partners/AllCompanyPartners/$companyId/$partnerId';
  static String Function(String buyerId,) get getSearchForBuyer=>
          (buyerId) => 'Partners/SellSharesBuyers/$buyerId';
  static const String postSellSharesRequest= "SellSharesRequests";
  static const String getDirectorsMeetingMinutes="Meetings/DirectorBoards/MeetingMinutes";
  static const String downloadingFilesStaging="https://api-s2.musahm.com/";
  static const String downloadingFilesProduction="https://api-s2.musahm.com/";
  static const String getAssociationsMeetings="Meetings";
  static const String getMeetingsDirectorBoard="Meetings/DirectorBoards";
  static const String getMeetingsCommittees="Meetings/Committees";
  static const String postInvitationsMessages="Invitations/Messages";
  static const String meetingsAttendanceTypes="Meetings/AttendanceTypes";
  static String Function(String meetingsId,) get getMeetingsInformation=>
          (meetingsId) => 'Meetings/$meetingsId';
  static String Function(String meetingsId,) get getBoardMeetingsInformation=>
          (meetingsId) => 'Meetings/DirectorBoards/$meetingsId';
  static String Function(String meetingsId,) get getCommitteesMeetingsInformation=>
          (meetingsId) => 'Meetings/Committees/$meetingsId';
  static String Function(String meetingsId,String partnerId,) get getMeetingPartnerVotingCard=>
          (meetingsId,partnerId) => 'VotingQuestions/MeetingPartnerVotingCard/$meetingsId/$partnerId';
  static const String getInvitationResponses="Invitations/InvitationResposes";
  static const String putInvitations="Invitations";
  static String Function(String meetingsId,String partnerId,) get getMeetingVotingCardPdf=>
          (meetingsId,partnerId) => 'VotingQuestions/MeetingPartnerVotingCard/Pdf/$meetingsId/$partnerId';
  static String Function(String meetingId,) get getMeetingsFiles=>
          (meetingId) => 'Meetings/$meetingId/MeetingFiles';
  static String Function(String meetingId,) get getSortingRecords=>
          (meetingId) => 'VotingQuestions/VotingReport/$meetingId';
  static String Function(String meetingId,) get getMeetingPrivateFiles=>
          (meetingId) => 'Meetings/$meetingId/MeetingFiles/Private';
  static const String postVotingQuestions="VotingQuestions/Questions";
  static String Function(String meetingId,) get postSubmitVotingRecords=>
          (meetingId) => 'VotingQuestions/$meetingId/VotingQuestionRecords';
  static String Function(String meetingId,) get getAttendanceReport=>
          (meetingId) => 'Meetings/AttendanceReport/$meetingId';
  static String Function(String meetingId,) get getAttendanceReportPdf=>
          (meetingId) => 'Meetings/Meeting/Attendance/Pdf/$meetingId';
  static String Function(String meetingId,) get getVotingReportPdf=>
          (meetingId) => 'VotingQuestions/VotingRecordReport/Pdf/$meetingId';
  static String Function(String) get getNotifications =>
          (id) => 'Partners/$id/Notifications';
  static String Function(String,String) get getNotificationsDetails=>
          (partnerId,notificationsId) => 'Partners/$partnerId/Notification/$notificationsId';
  static String Function(String,String) get updateNotificationsDetails=>
          (partnerId,notificationsId) => 'Partners/$partnerId/NotificationRead/$notificationsId';
  static const String sendChatMessage='Chat/SendMessage';
  static String Function(String,String,String) get getUserConversations=>
          (partnerId,chatMemberTypeId,messagesLength) => 'Chat/GetConversation/$partnerId/$chatMemberTypeId/$messagesLength';
  static getDownloadServerUrl(String appFlavor) {
    switch (appFlavor) {
      case AppFlavors.production:
        return AppUrl.downloadingFilesProduction;
      case AppFlavors.staging:
        return AppUrl.downloadingFilesStaging;
      default:
        return AppUrl.downloadingFilesStaging;
    }
  }
}
 
