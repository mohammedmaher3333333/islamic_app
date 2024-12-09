import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../manger/quran_cubit/quran_cubit.dart';
import '../../manger/quran_cubit/quran_state.dart';

class JuzGridView extends StatelessWidget {
  const JuzGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..loadQuranData(),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return GestureDetector(

            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kJuzListView,
                extra: {'index': index},
              );
            },

            child: BlocBuilder<QuranCubit, QuranState>(
              builder: (context, state) {
                if (state is QuranLoaded) {
                  var juzData = state.juz[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: ColorManager.grayishBlue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Juz ${index + 1}\n${juzData.start.name}', // عرض اسم الجزء
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  );
                } else if (state is QuranLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is QuranError) {
                  return const Center(
                    child: Text('Error loading Quran data'),
                  );
                } else {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
