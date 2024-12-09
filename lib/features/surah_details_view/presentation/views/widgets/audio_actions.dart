import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/utils/color_manager.dart';

import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../audio/presentation/manger/audio_cubit/audio_cubit.dart';
import '../../../../audio/presentation/manger/audio_cubit/audio_state.dart';

class AudioActions extends StatelessWidget {
  const AudioActions({super.key});

  @override
  Widget build(BuildContext context) {
    // double currentValue = 0;
    // double maxValue = 1.0;
    // String formattedCurrentTime = "00:00";
    // String formattedTotalTime = "03:00";

    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }

        return Column(
          children: [
            // silder audio
            Slider(
              activeColor: ColorManager.grey,
              inactiveColor: ColorManager.grey,
              thumbColor: ColorManager.lightBlueGreen,
              // value: currentValue,
              min: 0.0,
              // max: maxValue,
              // onChanged: (value) {},

              value: state.position.inSeconds.toDouble(),
              max: state.duration.inSeconds.toDouble(),
              onChanged: (value) {
                final newPosition = Duration(seconds: value.toInt());
                context.read<AudioCubit>().seek(newPosition);
              },

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${state.position.inSeconds}',
                    style: getSemiBoldStyle(color: ColorManager.grey),
                  ),
                  Text(
                    '${state.duration.inSeconds}',
                    style: getSemiBoldStyle(color: ColorManager.grey),
                  ),
                ],
              ),
            ),
            // actions audio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () {},
                ),
                GestureDetector(
                  onTap: (){
                    // if (state.isPlaying) {
                    //   // context.read<AudioCubit>().pauseAudio();
                    // } else {
                    //   // context.read<AudioCubit>().playAudio('fileName');
                    // }

                    if (state.audioFiles.isNotEmpty) {
                      // تشغيل السورة كاملة
                      context.read<AudioCubit>().playSurah(state.audioFiles);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No audio files for')),
                      );
                    }

                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circle 1 - Outermost
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.lightBlueGreen.withOpacity(0.2),
                        ),
                      ),
                      // Circle 2
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.lightBlueGreen.withOpacity(0.7),
                        ),
                      ),
                      // Circle 3
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.lightBlueGreen.withOpacity(0.5),
                        ),
                      ),
                      // Circle 4
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.grey.withOpacity(0.3),
                        ),
                      ),
                      // Circle 5 - Innermost
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.lightBlueGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () {},
                ),
                const Icon(Icons.volume_up),
                DropdownButton<double>(
                  value: state.playbackSpeed,
                  items: [0.5, 1.0, 1.5, 2.0]
                      .map((speed) => DropdownMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<AudioCubit>().changeSpeed(value);
                    }
                  },
                ),
              ],
            ),
            // volume audio
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: state.volume,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      context.read<AudioCubit>().changeVolume(value);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
