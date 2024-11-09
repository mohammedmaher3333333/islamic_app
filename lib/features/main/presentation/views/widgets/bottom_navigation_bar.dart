import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../manger/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, int>(
      builder: (context, currentIndex) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            context.read<BottomNavigationBarCubit>().changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: ColorManager.lightBlueGreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
              label: AppStrings.audio,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppStrings.settings,
            ),
          ],
        );
      },
    );
  }
}
