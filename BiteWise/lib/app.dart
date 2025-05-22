import 'package:bitewise/features/about/presentation/screens/about_screen.dart';
import 'package:bitewise/features/auth/presentation/screens/login.dart';
import 'package:bitewise/features/auth/presentation/screens/signup.dart';
import 'package:bitewise/features/home/presentation/screens/home_screen.dart';
import 'package:bitewise/features/profile/presentation/screens/profile.dart';
import 'package:bitewise/shared/shell/app_shell.dart'; // Assuming AppShell is in this path
import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:flutter/material.dart';

// --- AppRoutes Class (No changes needed here, it's well structured) ---
class AppRoutes {
  // Private constructor to prevent instantiation
  AppRoutes._();

  // Route names as constants
  static const String home = '/';
  static const String about = '/sobre-nos';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String contact =
      '/contato'; // Assuming you'll have a contact screen

  // Map of route keys to paths for easier use in UI elements like drawers/menus
  static const Map<String, String> routeMappings = {
    'home': home,
    'planos': home, // 'planos' key navigates to the home route
    'sobre-nos': about,
    'contato': contact,
    'login': login,
    'register': register,
    'profile': profile,
  };
}

// --- MyApp Widget ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 1. GlobalKey for NavigatorState
  // This allows navigation from anywhere without needing a specific BuildContext
  // and helps create stable callback references for navigation.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Helper method to resolve route paths from keys or direct paths
  // This can remain largely the same, but we can add a debug print for unmapped keys.
  String _resolveRoutePath(String screenKeyOrPath) {
    // Check if it's a predefined key in our mappings
    if (AppRoutes.routeMappings.containsKey(screenKeyOrPath)) {
      return AppRoutes.routeMappings[screenKeyOrPath]!;
    }

    // If it already starts with '/', treat it as a direct path
    if (screenKeyOrPath.startsWith('/')) {
      return screenKeyOrPath;
    }

    // If it's an unmapped key not starting with '/', convert to path format.
    // This might be useful for dynamic paths or if some keys are directly path segments.
    // For debugging, it's helpful to know if this fallback is hit with an unexpected key.
    if (kDebugMode) {
      print(
        "Warning: Unmapped screenKey '$screenKeyOrPath' resolved to '/$screenKeyOrPath'. Ensure this is intended.",
      );
    }
    return '/$screenKeyOrPath';
  }

  // 2. Stable Navigation Handler
  // This method uses the navigatorKey and can be passed as a stable reference.
  void _handleNavigationCommand(String screenKeyOrPath) {
    final String targetRoutePath = _resolveRoutePath(screenKeyOrPath);
    String? currentRouteName;

    // Safely get the current route name using the navigatorKey.
    // The popUntil trick inspects routes without actually popping them.
    navigatorKey.currentState?.popUntil((route) {
      currentRouteName = route.settings.name;
      return true; // Return true to stop iterating after the first (topmost) route.
    });

    // Avoid unnecessary navigation if already on the target route.
    if (currentRouteName != targetRoutePath) {
      // Using pushReplacementNamed to avoid building up a large back stack
      // for primary navigation actions. This is a design choice.
      // For drill-down navigation (e.g., list -> detail), `pushNamed` might be preferred.
      navigatorKey.currentState?.pushReplacementNamed(targetRoutePath);
    } else {
      if (kDebugMode) {
        print(
          "Navigation: Already on route '$targetRoutePath'. Navigation skipped.",
        );
      }
    }
  }

  // 3. Route Generator
  // This method now passes the stable _handleNavigationCommand.
  Route<dynamic>? _generateRoute(RouteSettings settings) {
    Widget pageContent;

    switch (settings.name) {
      case AppRoutes.home:
        pageContent = const Home();
        break;
      case AppRoutes.about:
        pageContent = const About();
        break;
      case AppRoutes.login:
        pageContent = const Login();
        break;
      case AppRoutes.profile:
        pageContent = const ProfilePage();
        break;
      case AppRoutes.register:
        pageContent = const Signup();
        break;
      case AppRoutes.contact:
        // TODO: Replace with actual ContactScreen when available
        // For now, falling back to Home for the contact route.
        if (kDebugMode) {
          print("Navigating to ContactScreen (currently fallback to Home).");
        }
        pageContent = const Home(); // Placeholder: const ContactScreen();
        break;
      default:
        // Fallback for any unknown routes
        if (kDebugMode) {
          print(
            "Warning: Unknown route '${settings.name}', falling back to Home.",
          );
        }
        pageContent = const Home();
    }

    return MaterialPageRoute(
      settings: settings,
      builder:
          (BuildContext pageContext) => RepaintBoundary(
            // The RepaintBoundary here isolates the page for repainting, which can be a performance win.
            child: AppShell(
              navigateToScreen: _handleNavigationCommand,
              child: pageContent,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteWise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
        // You might want to define page transition themes for consistency
        // pageTransitionsTheme: const PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.android: CupertinoPageTransitionsBuilder(), // Example
        //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        //   },
        // ),
      ),
      navigatorKey: navigatorKey, // Assign the global navigator key
      initialRoute: AppRoutes.home,
      onGenerateRoute: _generateRoute,
      // Consider adding a builder to wrap all routes with common providers if needed
      // builder: (context, child) {
      //   return SomeGlobalProvider(child: child ?? const SizedBox());
      // },
      // For handling truly unknown routes not caught by onGenerateRoute (less common if onGenerateRoute has a default)
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => const NotFoundScreen());
      // },
    );
  }
}
