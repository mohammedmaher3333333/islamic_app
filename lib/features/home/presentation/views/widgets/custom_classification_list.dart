import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../manger/classification_list_cubit/classification_list_cubit.dart';

class CustomClassificationList extends StatelessWidget {
  const CustomClassificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p24,
        horizontal: AppPadding.p12,
      ),
      child: SizedBox(
        height: AppSize.s40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context
                      .read<ClassificationListCubit>()
                      .selectItem(AppStrings.surah);
                },
                child: const CustomContainer(text: AppStrings.surah),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => context
                    .read<ClassificationListCubit>()
                    .selectItem(AppStrings.sajda),
                child: const CustomContainer(text: AppStrings.sajda),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context
                      .read<ClassificationListCubit>()
                      .selectItem(AppStrings.juz);
                },
                child: const CustomContainer(text: AppStrings.juz),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.text,
    this.onTap,
  });

  final void Function()? onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassificationListCubit, String>(
      builder: (context, selectedText) {
        final isSelected = selectedText == text;
        return GestureDetector(
          onTap: () {
            context.read<ClassificationListCubit>().selectItem(text);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Text(
                  text,
                  style: getSemiBoldStyle(
                    fontSize: FontSize.s16,
                  ).copyWith(
                    color: isSelected
                        ? ColorManager.lightBlueGreen
                        : ColorManager.grey,
                  ),
                ),
              ),
              Container(
                height: AppSize.s3,
                width: double.infinity,
                color: isSelected
                    ? ColorManager.lightBlueGreen
                    : ColorManager.extraLightGrey,
              ),
            ],
          ),
        );
      },
    );
  }
}
