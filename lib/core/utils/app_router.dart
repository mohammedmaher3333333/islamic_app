import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/home/data/models/surah_model/surah_model.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/juz_list_view.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_image.dart';
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
  static const kSurahImage = '/surahImage';
  static const kJuzListView = '/juzListView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kMainView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => BottomNavigationBarCubit(),
              child: const MainView(),
            ),
      ),
      GoRoute(
        path: AppRouter.kSurahImage,
        builder: (context, state) {
          final data = state.extra! as Map<String, dynamic>;
          final sura = data['sura'] as SuraModel;
          final allSurahs = data['allSurahs'] as List<SuraModel>;

          return SurahImage(
            surah: sura,
            allSurahs: allSurahs,
          );
        },
      ),
      GoRoute(
        path: AppRouter.kJuzListView,
        builder: (context, state) {
          // الوصول إلى البيانات الممررة عبر extra
          final data = state.extra as Map<String, dynamic>;
          final index = data['index'] as int; // احصل على الـ index

          return JuzListView(index: index); // مرر الـ index إلى JuzListView
        },
      ),

      GoRoute(
        path: kSurahDetailsView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SurahDetailsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
                CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              );

              var scaleAnimation =
              Tween(begin: 0.9, end: 1.0).animate(animation);

              return FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: child,
                ),
              );
            },
          );
        },
      ),
    ],
  );
}
