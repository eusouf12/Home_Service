import 'package:get/get.dart';

class AppRoutes {
  ///===========================Authentication==========================
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/OnboardingScreen";
  static const String loginOnlyScreen = "/LoginOnlyScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String subscribeScreen = "/SubscribeScreen";
  static const String accountReadyScreen = "/AccountReadyScreen";
  static const String otpScreen = "/otpScreen";
  static const String forgotScreen = "/ForgotScreen";
  static const String setNewPassword = "/SetNewPassword";
  static const String chooseRole = "/ChooseRole";

  ///===========================other part Part==========================
  static const String singleView = "/SingleView";

  ///===========================Immigration Seeker==========================
  static const String setUpProfileScreen1 = "/SetUpProfileScreen1";
  static const String recommendedCountriesScreen = "/RecommendedCountriesScreen";
  static const String countryDetailsScreen = "/CountryDetailsScreen";
  static const String userDashboard = "/UserDashboard";
  static const String userProfileScreen ="/UserProfileScreen";
  static const String userEditScreen = "/UserEditScreen";
  static const String userSecurityScreen = "/UserSecurityScreen";
  static const String userAccountSettingsScreen = "/UserAccountSettingsScreen";
  static const String userChangePassScreen = "/UserChangePassScreen";
  static const String userTermsServicesScreen = "/UserTermsServicesScreen";
  static const String userPrivacyScreen = "/UserPrivacyScreen";
  static const String userAboutScreen = "/UserAboutScreen";
  static const String userHelpSupport = "/UserHelpSupport";
  static const String chatListScreen = "/ChatListScreen";
  static const String consultProfileViewDetails = "/ConsultProfileViewDetails";
  static const String legalAdviceScreen = "/LegalAdviceScreen";
  static const String visaTypeRequirement = "/VisaTypeRequirement";

  ///=============================== Consultant ======================================
  static const String consultantDashboard = "/ConsultantDashboard";
  static const String setUpProfileScreenConsultant1 = "/SetUpProfileScreenConsultant1";
  static const String bookingDetailsScreen = "/BookingDetailsScreen";
  static const String consultBookScreen = "/ConsultBookScreen";
  static const String bookingConfirmedScreen = "/BookingConfirmedScreen";


  static List<GetPage> routes = [

    ///===========================Authentication==========================
    // GetPage(name: splashScreen, page: () => Splashscreen()),
    // GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    // GetPage(name: chooseRole, page: () => ChooseRole()),
    // GetPage(name: loginOnlyScreen, page: () => LoginOnlyScreen()),
    // GetPage(name: signUpScreen, page: () => SignUpScreen()),
    // GetPage(name: accountReadyScreen, page: () => AccountReadyScreen()),
    // GetPage(name: subscribeScreen, page: () => SubscribeScreen()),
    // GetPage(name: otpScreen, page: () => OtpScreen()),
    // GetPage(name: forgotScreen, page: () => ForgotScreen()),
    // GetPage(name: setNewPassword, page: () => SetNewPassword()),

    ///============== Immigration Seeker ==================



  ];
}
