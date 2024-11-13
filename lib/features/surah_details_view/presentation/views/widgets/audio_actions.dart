import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/color_manager.dart';

class AudioActions extends StatelessWidget {
  const AudioActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: () {},
        ),


        Stack(
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


        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: () {},
        ),
        const Icon(Icons.volume_up),
        DropdownButton<double>(
          value: 1.0,
          items: [0.5, 1.0, 1.5, 2.0]
              .map((speed) => DropdownMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
