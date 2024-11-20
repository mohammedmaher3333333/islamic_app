import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/sajda_list_item.dart';

import '../../../../../core/utils/app_router.dart';

class SajdaListView extends StatelessWidget {
  const SajdaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kSurahDetailsView,
            );
          },
          child: const SajdaListItem(),
        );
      },
    );
  }
}
