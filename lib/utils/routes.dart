import 'package:rental_motor/design/Interest/interest_view.dart';
import 'package:rental_motor/design/address/address_view.dart';
import 'package:rental_motor/design/auth/login_view.dart';
import 'package:rental_motor/design/auth/register_view.dart';
import 'package:rental_motor/design/details/details_view.dart';
import 'package:rental_motor/design/home/home_view.dart';
import 'package:rental_motor/design/onboarding/onboarding_view.dart';
import 'package:rental_motor/design/splash/splash_view.dart';

final listRoutes = {
  '/': (context) => const SplashView(),
  '/detail': (context) => DetailView(),
  '/address': (context) => AddressView(),
  '/home': (context) => const HomeView(),
  '/login': (context) => const LoginView(),
  '/register': (context) => const RegisterView(),
  '/interest': (context) => const InterestView(),
  '/onboarding': (context) => const OnboardingView(),
};
