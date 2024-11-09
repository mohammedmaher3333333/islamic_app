import 'package:flutter/material.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        const SizedBox(
          width: AppSize.s24,
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: getBoldStyle(
            color: ColorManager.black,
            fontSize: FontSize.s28,
          ),
        ),
      ],
    );
  }
}
