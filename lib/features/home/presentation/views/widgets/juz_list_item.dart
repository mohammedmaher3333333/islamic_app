import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';
import 'package:islamic_app/core/utils/values_manager.dart';

import '../../../../../core/utils/font_manager.dart';
import '../../../data/models/surah_model/surah_model.dart';

class JuzListItem extends StatelessWidget {
  const JuzListItem({super.key, required this.sura});
  final SuraModel sura;
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
              '${sura.index}',
              style: getRegularStyle(
                  color: ColorManager.white, fontSize: FontSize.s14),
            ),
          ),
        ),
        title: Text(
          sura.title,
          style: getBoldStyle(
            color: ColorManager.black,
            fontSize: FontSize.s14,
          ),
        ),
        subtitle: Text(
          sura.type,
          style: getMediumStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s14,
          ),
        ),
        trailing: Text(
          sura.titleAr,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSize.s18,
          ),
        ),
      ),
    );
  }
}
