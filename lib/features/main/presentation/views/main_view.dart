import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/audio/presentation/views/audio_view.dart';
import 'package:islamic_app/features/main/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:islamic_app/features/settings/presentation/views/settings_view.dart';

import '../../../home/presentation/views/home_view.dart';
import '../manger/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: BlocBuilder<BottomNavigationBarCubit, int>(
            builder: (context, currentIndex) {
              return IndexedStack(
                index: currentIndex,
                children: const [
                  HomeView(),
                  AudioView(),
                  SettingsView(),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
