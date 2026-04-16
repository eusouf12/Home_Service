import 'package:get/get.dart';
import '../../view/sereen/home_screen/screen/filtter_screen.dart';
import '../../view/sereen/home_screen/screen/home_screen.dart';
import '../../view/sereen/Booking_screen/screen/booking_screen.dart';
import '../../view/sereen/Booking_screen/screen/booking_details_screen.dart';

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
  ];
}
