import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/main/presentation/views/main_view.dart';
import 'package:islamic_app/features/splash/presentation/views/splash_view.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/surah_details_view.dart';

import '../../features/main/presentation/manger/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kHomeView = '/homeView';
  static const kSettingsView = '/settingsView';
  static const kAudioView = '/audioView';
  static const kSurahDetailsView = '/surahDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kMainView,
        builder: (context, state) => BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
          child: const MainView(),
        ),
      ),
      GoRoute(
        path: kSurahDetailsView,
        builder: (context, state) => SurahDetailsView(),
      ),
    ],
  );
}
