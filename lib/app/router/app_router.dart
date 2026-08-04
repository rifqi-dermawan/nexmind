import 'package:go_router/go_router.dart';
import '../../splash_screen.dart';
import '../../onboarding_screen.dart';
import '../../features/dashboard/admin_dashboard_screen.dart';
import '../../features/auth/admin_login_screen.dart';
import '../../features/auth/admin_register_screen.dart';
import '../../features/auth/admin_forgot_password_screen.dart';
import '../../features/auth/admin_verification_screen.dart';
import '../../features/auth/admin_reset_password_screen.dart';
import '../../features/notifications/admin_notifications_screen.dart';
import '../../features/users/admin_users_screen.dart';
import '../../features/conversions/admin_conversions_screen.dart';
import '../../features/settings/admin_settings_screen.dart';
import '../../features/profile/admin_profile_screen.dart';
import '../../features/settings/admin_appearance_screen.dart';
import '../../features/maintenance/admin_maintenance_screen.dart';
import '../../features/support/admin_support_screen.dart';
import '../../features/about/admin_about_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/admin_login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/admin_login',
      builder: (context, state) => const AdminLoginScreen(),
    ),
    GoRoute(
      path: '/admin_register',
      builder: (context, state) => const AdminRegisterScreen(),
    ),
    GoRoute(
      path: '/admin_forgot_password',
      builder: (context, state) => const AdminForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/admin_verification',
      builder: (context, state) => const AdminVerificationScreen(),
    ),
    GoRoute(
      path: '/admin_reset_password',
      builder: (context, state) => const AdminResetPasswordScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminDashboardScreen(),
    ),
    GoRoute(
      path: '/admin_notifications',
      builder: (context, state) => const AdminNotificationsScreen(),
    ),
    GoRoute(
      path: '/admin_users',
      builder: (context, state) => const AdminUsersScreen(),
    ),
    GoRoute(
      path: '/admin_conversions',
      builder: (context, state) => const AdminConversionsScreen(),
    ),
    GoRoute(
      path: '/admin_settings',
      builder: (context, state) => const AdminSettingsScreen(),
    ),
    GoRoute(
      path: '/admin_profile',
      builder: (context, state) => const AdminProfileScreen(),
    ),
    GoRoute(
      path: '/admin_appearance',
      builder: (context, state) => const AdminAppearanceScreen(),
    ),
    GoRoute(
      path: '/admin_maintenance',
      builder: (context, state) => const AdminMaintenanceScreen(),
    ),
    GoRoute(
      path: '/admin_support',
      builder: (context, state) => const AdminSupportScreen(),
    ),
    GoRoute(
      path: '/admin_about',
      builder: (context, state) => const AdminAboutScreen(),
    ),
  ],
);
