import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_item.dart';

import '../../../../../core/utils/app_router.dart';
import '../../manger/quran_cubit/quran_cubit.dart';
import '../../manger/quran_cubit/quran_state.dart';

class JuzListView extends StatelessWidget {
  final int index;

  const JuzListView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    print("Selected Juz index = $index");

    return BlocProvider(
      create: (context) => QuranCubit()..loadQuranData(),
      child: Scaffold(
        appBar: AppBar(title: Text('Juz ${index + 1}')),
        body: SafeArea(
          child: BlocBuilder<QuranCubit, QuranState>(
            builder: (context, state) {
              if (state is QuranLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is QuranLoaded) {
                // الحصول على بيانات الجزء
                var juzData = state.juz[index];

                // تحديد نطاق السور بناءً على البيانات
                int startSura = juzData.start.sura;
                int endSura = juzData.end.sura;

                // استخراج السور التي تنتمي لهذا الجزء
                List<dynamic> surahsForJuz = state.suras
                    .where((sura) =>
                sura.index >= startSura && sura.index <= endSura)
                    .toList();

                return ListView.builder(
                  itemCount: surahsForJuz.length,
                  itemBuilder: (context, index) {
                    final sura = surahsForJuz[index];
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
                      child: SurahListItem(sura: sura),
                    );
                  },
                );
              } else if (state is QuranError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('No Data Found'));
              }
            },
          ),
        ),
      ),
    );
  }
}
