import 'package:flutter/material.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/audio_actions.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/audio_line.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_top_container.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/upcoming_surah.dart';

import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class SurahDetailsViewBody extends StatelessWidget {
  const SurahDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.s24,
      ),
      child: Column(
        children: [
          CustomAppBar(
            title: AppStrings.nowPlaying,
          ),
          SizedBox(height: AppSize.s40),
          CustomTopContainer(),
          SizedBox(height: AppSize.s40),
          AudioLine(),
          AudioActions(),
          UpcomingSurah(),
        ],
      ),
    );
  }
}
