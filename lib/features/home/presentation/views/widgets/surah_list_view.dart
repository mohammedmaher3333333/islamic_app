import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/home/presentation/manger/quran_cubit/quran_cubit.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_item.dart';

import '../../../../../core/utils/app_router.dart';
import '../../manger/quran_cubit/quran_state.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuranLoaded) {
          return ListView.builder(
            itemCount: state.suras.length,
            itemBuilder: (context, index) {
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
                  child: SurahListItem(sura: sura));
            },
          );
        } else if (state is QuranError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No Data Found'));
        }
      },
    );
  }
}
// leading: Image.asset('assets/images/surahs/${sura.index}.png'),
