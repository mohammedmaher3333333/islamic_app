import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/font_manager.dart';
import 'package:islamic_app/core/utils/strings_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/custom_classification_list.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_view.dart';

import '../../../../core/utils/values_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.menu),
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.alQuran,
            style:
                getBoldStyle(fontSize: FontSize.s28, color: ColorManager.grey),
          ),
        ),
        const CustomClassificationList(),
        const SurahListView(),
      ],
    );
  }
}
