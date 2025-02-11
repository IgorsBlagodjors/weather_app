import 'package:flutter/material.dart';
import 'package:weather_app/design_system/app_colors.dart';
import 'package:weather_app/design_system/app_styles.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/custom_indicator.dart';
import 'package:weather_app/presentation/widgets/forecast_details_page_widgets/forecast_details_container.dart';

class AirQuality extends StatelessWidget {
  const AirQuality({super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherDetailsContainer(
      width: 348,
      height: 168,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.fitbit_outlined,
                  color: AppColors.weatherDetailsSubheadline,
                  size: 15,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'AIR QUALITY',
                  style: AppStyles.boldFootnote.copyWith(
                    color: AppColors.weatherDetailsSubheadline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '3-Low Health Risk',
              style: AppStyles.boldTitle3,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomIndicator(
              width: 301,
              indicatorPosition: 0.2,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Color(0xFF323044),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        //TODO": made AirQuality activity
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Under Construction'),
                          ),
                        );
                      },
                      child:
                          const Text('See more', style: AppStyles.regularBody)),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO": made AppBarHouseIcon activity
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Under Construction'),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    // Container(
    //   height: 168,
    //   width: 348,
    //   decoration: AppDecorations.weatherDetailsDecoration,
    //   child: Padding(
    //     padding: const EdgeInsets.all(22.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             const Icon(
    //               Icons.fitbit_outlined,
    //               color: AppColors.weatherDetailsSubheadline,
    //               size: 15,
    //             ),
    //             const SizedBox(
    //               width: 2,
    //             ),
    //             Text(
    //               'AIR QUALITY',
    //               style: AppStyles.boldFootnote.copyWith(
    //                 color: AppColors.weatherDetailsSubheadline,
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         const Text(
    //           '3-Low Health Risk',
    //           style: AppStyles.boldTitle3,
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         const CustomIndicator(
    //           width: 301,
    //           indicatorPosition: 0.2,
    //         ),
    //         const SizedBox(
    //           height: 8,
    //         ),
    //         const Divider(
    //           color: Color(0xFF323044),
    //         ),
    //         const SizedBox(
    //           height: 7,
    //         ),
    //         const Row(
    //           children: [
    //             Expanded(
    //               child: Text('See more', style: AppStyles.regularBody),
    //             ),
    //             Icon(
    //               Icons.arrow_forward_ios,
    //               size: 15,
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
