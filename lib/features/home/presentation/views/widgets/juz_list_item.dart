import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';
import 'package:islamic_app/core/utils/values_manager.dart';

import '../../../../../core/utils/font_manager.dart';

class JuzListItem extends StatelessWidget {
  const JuzListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      margin: const EdgeInsets.only(bottom: AppMargin.m8),
      child: ListTile(
        leading: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: ColorManager.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              '1',
              style: getRegularStyle(
                  color: ColorManager.white, fontSize: FontSize.s20),
            ),
          ),
        ),
        title: Text(
          'surah.englishName',
          style: getBoldStyle(
            color: ColorManager.black,
            fontSize: FontSize.s14,
          ),
        ),
        subtitle: Text(
          'Meccan',
          style: getMediumStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s14,
          ),
        ),
        trailing: Text(
          'surah.name',
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSize.s18,
          ),
        ),
      ),
    );
  }
}
