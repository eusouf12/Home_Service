import 'package:get/get.dart';
import 'package:home_service/view/sereen/User%20part/message_screen/screen/message_screen.dart' show MessageScreen;
import 'package:home_service/view/sereen/User%20part/rating_screen/screen/overview_rating_screen.dart' show OverviewRatingScreen;
import 'package:home_service/view/sereen/User%20part/user_profile/screen/add_new_address_screen.dart' show AddNewAddressScreen;
import 'package:home_service/view/sereen/User%20part/user_profile/screen/logout_success_screen.dart' show LogoutSuccessScreen;
import '../../view/sereen/User part/Booking_screen/screen/booking_details_screen.dart';
import '../../view/sereen/User part/Booking_screen/screen/booking_screen.dart';
import '../../view/sereen/User part/Booking_screen/screen/create_booking_completed_screen.dart';
import '../../view/sereen/User part/Booking_screen/screen/create_request_screen.dart';
import '../../view/sereen/User part/home_screen/screen/filtter_screen.dart';
import '../../view/sereen/User part/home_screen/screen/home_screen.dart';
import '../../view/sereen/User part/message_screen/screen/inbox_screen.dart';
import '../../view/sereen/User part/notification_screen/notification_screen.dart';
import '../../view/sereen/User part/rating_screen/screen/rating_screen.dart';
import '../../view/sereen/User part/user_profile/screen/become_provider_screen.dart';
import '../../view/sereen/User part/user_profile/screen/change_password_screen.dart';
import '../../view/sereen/User part/user_profile/screen/edit_profile_screen.dart';
import '../../view/sereen/User part/user_profile/screen/help_support_screen.dart';
import '../../view/sereen/User part/user_profile/screen/legal_policies_screen.dart';
import '../../view/sereen/User part/user_profile/screen/payment_history_screen.dart';
import '../../view/sereen/User part/user_profile/screen/privacy_security_screen.dart';
import '../../view/sereen/User part/user_profile/screen/saved_provider_screen.dart' show SavedProviderScreen;
import '../../view/sereen/User part/user_profile/screen/user_profile_screen.dart' show UserProfileScreen;
import '../../view/sereen/User part/home_screen/screen/provider_profile_screen.dart';
import '../../view/sereen/User part/home_screen/screen/gallery_screen.dart';
import '../../view/sereen/User part/home_screen/screen/all_reviews_screen.dart';
import '../../view/sereen/User part/user_profile/screen/saved_address_screen.dart';
import '../../view/sereen/Provider Part/onboarding_screen/screen/provider_onboarding_screen.dart';
import '../../view/sereen/Provider Part/Splash Screen/splash_screen.dart';

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
  static const String providerOnboardingScreen = "/ProviderOnboardingScreen";

  ///===========================User Part==========================
  static const String singleView = "/SingleView";
  static const String homeScreen = "/HomeScreen";
  static const String filterScreen = "/FilterScreen";
  static const String bookingScreen = "/BookingScreen";
  static const String bookingDetailsScreen = "/BookingDetailsScreen";
  static const String createRequestScreen = "/CreateRequestScreen";
  static const String ratingScreen = "/RatingScreen";
  static const String createBookingCompletedScreen = "/CreateBookingCompletedScreen";
  static const String providerProfileScreen = "/ProviderProfileScreen";
  static const String galleryScreen = "/GalleryScreen";
  static const String allReviewsScreen = "/AllReviewsScreen";
  static const String overViewRatingScreen = "/OverviewRatingScreen";
  static const String messagesScreen = "/MessageScreen";
  static const String inboxScreen = "/InboxScreen";
  static const String userProfileScreen = "/UserProfileScreen";
  static const String editProfileScreen = "/EditProfileScreen";
  static const String savedProviderScreen = "/SavedProviderScreen";
  static const String paymentHistoryScreen = "/PaymentHistoryScreen";
  static const String privacySecurityScreen = "/PrivacySecurityScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String legalPoliciesScreen = "/LegalPoliciesScreen";
  static const String helpSupportScreen = "/HelpSupportScreen";
  static const String becomeProviderScreen = "/BecomeProviderScreen";
  static const String savedAddressScreen = "/SavedAddressScreen";
  static const String addNewAddressScreen = "/AddNewAddressScreen";
  static const String logoutSuccessScreen = "/LogoutSuccessScreen";
  static const String notificationScreen = "/NotificationScreen";

  static List<GetPage> routes = [

    ///===========================Authentication==========================
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    // GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    // GetPage(name: chooseRole, page: () => ChooseRole()),
    // GetPage(name: loginOnlyScreen, page: () => LoginOnlyScreen()),
    // GetPage(name: signUpScreen, page: () => SignUpScreen()),
    // GetPage(name: accountReadyScreen, page: () => AccountReadyScreen()),
    // GetPage(name: subscribeScreen, page: () => SubscribeScreen()),
    // GetPage(name: otpScreen, page: () => OtpScreen()),
    // GetPage(name: forgotScreen, page: () => ForgotScreen()),
    // GetPage(name: setNewPassword, page: () => SetNewPassword()),

    ///============== User part ==================
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: filterScreen, page: () => FilterScreen()),
    GetPage(name: bookingScreen, page: () => BookingScreen()),
    GetPage(name: bookingDetailsScreen, page: () => BookingDetailsScreen()),
    GetPage(name: createRequestScreen, page: () => const CreateRequestScreen()),
    GetPage(name: ratingScreen, page: () => RatingScreen()),
    GetPage(name: createBookingCompletedScreen, page: () => const CreateBookingCompletedScreen()),
    GetPage(name: providerProfileScreen, page: () => ProviderProfileScreen()),
    GetPage(name: galleryScreen, page: () => GalleryScreen()),
    GetPage(name: allReviewsScreen, page: () => AllReviewsScreen()),
    GetPage(name: overViewRatingScreen, page: () => const OverviewRatingScreen()),
    GetPage(name: messagesScreen, page: () => MessageScreen()),
    GetPage(name: inboxScreen, page: () => const InboxScreen()),
    GetPage(name: userProfileScreen, page: () => const UserProfileScreen()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
    GetPage(name: savedProviderScreen, page: () => const SavedProviderScreen()),
    GetPage(name: paymentHistoryScreen, page: () => const PaymentHistoryScreen()),
    GetPage(name: privacySecurityScreen, page: () => const PrivacySecurityScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: legalPoliciesScreen, page: () => const LegalPoliciesScreen()),
    GetPage(name: helpSupportScreen, page: () => const HelpSupportScreen()),
    GetPage(name: becomeProviderScreen, page: () => const BecomeProviderScreen()),
    GetPage(name: savedAddressScreen, page: () => const SavedAddressScreen()),
    GetPage(name: addNewAddressScreen, page: () => const AddNewAddressScreen()),
    GetPage(name: logoutSuccessScreen, page: () => const LogoutSuccessScreen()),
    GetPage(name: providerOnboardingScreen, page: () => const ProviderOnboardingScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationScreen()),
  ];
}
