import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/audio_actions.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_top_container.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/upcoming_surah.dart';

import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../audio/presentation/manger/audio_cubit/audio_cubit.dart';
import '../../../../audio/presentation/manger/audio_cubit/audio_state.dart';
import '../../../../home/data/models/surah_model/surah_model.dart';

class SurahAudioDetailsViewBody extends StatelessWidget {
  const SurahAudioDetailsViewBody(
      {super.key, required this.surah, required this.allSurahs});

  final SuraModel surah;
  final List<SuraModel> allSurahs;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit()..fetchAndAssignAudioFiles(allSurahs),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s24,
        ),
        child: Column(
          children: [
            const CustomAppBar(
              title: AppStrings.nowPlaying,
            ),
            const SizedBox(height: AppSize.s40),
            CustomTopContainer(
              surah: surah,
            ),
            const SizedBox(height: AppSize.s40),
            // const AudioLine(),
            BlocBuilder<AudioCubit, AudioState>(
              builder: (context, state) {
                return const AudioActions();
              },
            ),
            UpcomingSurah(
              allSurahs: allSurahs,
              currentSurah: surah,
            ),
          ],
        ),
      ),
    );
  }
}
/*
class SurahAudioDetailsView extends StatelessWidget {
  final List<SuraModel> allSurahs;
  final SuraModel surah;

  const SurahAudioDetailsView({super.key, required this.allSurahs, required this.surah});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit()..fetchAndAssignAudioFiles(allSurahs),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Surahs and Audio'),
        ),
        body: BlocBuilder<AudioCubit, AudioState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.errorMessage != null) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }

            return ListView.builder(
              itemCount: allSurahs.length,
              itemBuilder: (context, index) {
                final surah = allSurahs[index];
                return ListTile(
                  title: Text(surah.titleAr),
                  subtitle: Text('Index: ${surah.index}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {
                      if (surah.audioFiles.isNotEmpty) {
                        // تشغيل السورة كاملة
                        context.read<AudioCubit>().playSurah(surah.audioFiles);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No audio files for ${surah.titleAr}')),
                        );
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
 */