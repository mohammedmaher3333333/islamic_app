import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          fixedColor: Color(0xFFA1CED6),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
              label: 'Audio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
