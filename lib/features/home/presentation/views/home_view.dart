import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/font_manager.dart';
import 'package:islamic_app/core/utils/strings_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/custom_classification_list.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/juz_list_view.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/sajda_list_view.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_view.dart';

import '../../../../core/utils/values_manager.dart';
import '../manger/classification_list_cubit/classification_list_cubit.dart';

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
            style: getBoldStyle(
              fontSize: FontSize.s28,
              color: ColorManager.grey,
            ),
          ),
        ),
        const CustomClassificationList(),
        BlocBuilder<ClassificationListCubit, String>(
          builder: (context, selectedItem) {
            if (selectedItem == AppStrings.surah) {
              return const SurahListView();
            } else if (selectedItem == AppStrings.sajda) {
              return const SajdaListView();
            } else if (selectedItem == AppStrings.juz) {
              return const JuzListView();
            } else {
              return const Center(
                child: Text('Please select an option'),
              );
            }
          },
        ),
      ],
    );
  }
}
