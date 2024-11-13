import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';

import '../../../../../core/utils/values_manager.dart';

class AudioLine extends StatelessWidget {
  const AudioLine({super.key});

  @override
  Widget build(BuildContext context) {
    double currentValue = 0;
    double maxValue = 1.0;
    String formattedCurrentTime = "00:00";
    String formattedTotalTime = "03:00";

    return Column(
      children: [
        Slider(
          activeColor: ColorManager.grey,
          inactiveColor: ColorManager.grey,
          thumbColor: ColorManager.lightBlueGreen,
          value: currentValue,
          min: 0.0,
          max: maxValue,
          onChanged: (value) {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedCurrentTime,
                style: getSemiBoldStyle(color: ColorManager.grey),
              ),
              Text(
                formattedTotalTime,
                style: getSemiBoldStyle(color: ColorManager.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
