import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/main/presentation/views/main_view.dart';
import 'package:islamic_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  // static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kMainView,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}
