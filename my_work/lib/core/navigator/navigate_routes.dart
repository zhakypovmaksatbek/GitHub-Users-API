import 'package:my_work/feature/screens/home/home_screen.dart';
import 'package:my_work/feature/screens/splash_screen.dart';

class NavigatorRoute {
  static const paraf = '/';
  final items = {
    paraf: (context) => const SplashScreen(),
    NavigateRoutes.home.withParaf: (context) => const HomeScreen(),
  };
}

enum NavigateRoutes { home,detail  }

extension NavigateExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
