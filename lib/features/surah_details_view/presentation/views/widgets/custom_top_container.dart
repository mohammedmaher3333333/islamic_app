import 'package:flutter/material.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../home/data/models/surah_model/surah_model.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({super.key, required this.surah});
  final SuraModel surah;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSize.s150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: ColorManager.lightBlueGreen,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                surah.title,
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s26),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Text(
                '${AppStrings.totalAya} ${surah.count}',
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
