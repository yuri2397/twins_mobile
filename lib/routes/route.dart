// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:twins/components/onboarding.screen.dart';
import 'package:twins/components/splash_screen.screen.dart';
import 'package:twins/resolvers/home.binding.dart';
import 'package:twins/resolvers/login.binding.dart';
import 'package:twins/resolvers/onboarding.binding.dart';
import 'package:twins/resolvers/otp.binding.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/views/auth/add_bio.screen.dart';
import 'package:twins/views/auth/add_birthday.screen.dart';
import 'package:twins/views/auth/add_email.screen.dart';
import 'package:twins/views/auth/add_files.screen.dart';
import 'package:twins/views/auth/add_password.screen.dart';
import 'package:twins/views/auth/add_signe.screen.dart';
import 'package:twins/views/auth/login.screen.dart';
import 'package:twins/views/auth/register.screen.dart';
import 'package:twins/views/home/home.screen.dart';
import 'package:twins/views/home/profile/details.screen.dart';
import 'package:twins/views/home/profile/update_password.screen.dart';
import 'package:twins/views/home/profile/update_profile.screen.dart';
import 'package:twins/views/home/search.screen.dart';

dynamic ROUTER_OUTLET = [
  /// SHARED ROUTES
  GetPage(name: Goo.splashScreen, page: () => const SplashScreen()),
  GetPage(
      name: Goo.onboardingScreen,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding()),

  /// AUTH ROUTES

  GetPage(
      name: Goo.loginScreen,
      binding: LoginBinding(),
      page: () => LoginScreen()),
  GetPage(
    name: Goo.registerScreen,
    binding: RegisterBinding(),
    page: () => RegisterScreen(),
  ),
  GetPage(name: Goo.addEmailScreen, page: () => AddEmailScreen()),
  GetPage(name: Goo.addPasswordScreen, page: () => AddPasswordScreen()),
  GetPage(name: Goo.addBirthDayScreen, page: () => AddBirthDayScreen()),
  GetPage(name: Goo.addFilesScreen, page: () => AddFielsScreen()),
  GetPage(name: Goo.addSigneScreen, page: () => AddSigneScreen()),
  GetPage(name: Goo.addBioScreen, page: () => AddBioScreen()),

  /// HOME MODULES
  GetPage(
      name: Goo.homeScreen, page: () => HomeScreen(), binding: HomeBinding()),

  // PROFILE PAGES
  GetPage(name: Goo.detailsProfileScreen, page: () => DetailProfileScreen()),
  GetPage(name: Goo.updateProfileScreen, page: () => UpdateProfileScreen()),
  GetPage(name: Goo.updatePasswordScreen, page: () => PasswordProfileScreen()),
];
