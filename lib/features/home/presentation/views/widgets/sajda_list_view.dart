import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/sajda_list_item.dart';

import '../../../../../core/utils/app_router.dart';
import '../../manger/quran_cubit/quran_cubit.dart';
import '../../manger/quran_cubit/quran_state.dart';

class SajdaListView extends StatelessWidget {
  const SajdaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuranLoaded) {
          return ListView.builder(
            itemCount: state.glyphs.length,
            itemBuilder: (context, index) {
              // final glyph = state.glyphs[index];
              final sura = state.suras[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kSurahImage,
                    extra: {
                      'sura': sura,
                      'allSurahs': state.suras,
                    },
                  );
                },
                child: SajdaListItem(sura: sura),
              );
            },
          );
        } else if (state is QuranError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No Data.'));
        }
      },
    );
  }
}
