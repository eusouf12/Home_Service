import 'package:get/get.dart';
import '../../view/sereen/home_screen/screen/filtter_screen.dart';
import '../../view/sereen/home_screen/screen/home_screen.dart';
import '../../view/sereen/Booking_screen/screen/booking_screen.dart';
import '../../view/sereen/Booking_screen/screen/booking_details_screen.dart';
import '../../view/sereen/Booking_screen/screen/create_request_screen.dart';
import '../../view/sereen/rating_screen/screen/rating_screen.dart';
import '../../view/sereen/Booking_screen/screen/create_booking_completed_screen.dart';
import '../../view/sereen/home_screen/screen/provider_profile_screen.dart';
import '../../view/sereen/home_screen/screen/gallery_screen.dart';
import '../../view/sereen/home_screen/screen/all_reviews_screen.dart';
import '../../view/sereen/rating_screen/screen/overview_rating_screen.dart';
import '../../view/sereen/message_screen/screen/message_screen.dart';
import '../../view/sereen/message_screen/screen/inbox_screen.dart';
import '../../view/sereen/user_profile/screen/user_profile_screen.dart';
import '../../view/sereen/user_profile/screen/edit_profile_screen.dart';
import '../../view/sereen/user_profile/screen/saved_provider_screen.dart';

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
  ];
}
