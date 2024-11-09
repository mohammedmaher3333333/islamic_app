import 'package:flutter/material.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_ayah_list_view.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_top_container.dart';

import '../../../../../core/utils/values_manager.dart';
class SurahDetailsViewBody extends StatelessWidget {
  const SurahDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final Surah surah = GoRouterState.of(context).extra as Surah;

    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.s24,
      ),
      child: Column(
        children: [
          CustomAppBar(
            title: 'surah.name',
          ),
          SizedBox(height: AppSize.s24),
          CustomTopContainer(),
           SizedBox(height: AppSize.s40),
          CustomAyahListView(),
        ],
      ),
    );
  }
}
