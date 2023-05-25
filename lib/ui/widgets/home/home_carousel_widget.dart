
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data/models/home_slider_model.dart';
import '../../utils/app_colors.dart';

class HomeCarouselWidget extends StatelessWidget {
  HomeCarouselWidget({super.key, required this.homeSliderModel});
  final HomeSliderModel homeSliderModel;
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, _) {
              _currentCarouselIndex.value = index;
            }),
          items: homeSliderModel.sliders!.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                          slider.image ?? ''
                      )
                    )
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _currentCarouselIndex,
          builder: (context, currentValue, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < (homeSliderModel.sliders?.length ?? 0); i++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: currentValue == i ? primaryColor : null,
                        border: Border.all(
                          color: greyColor.withOpacity(0.5),),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}