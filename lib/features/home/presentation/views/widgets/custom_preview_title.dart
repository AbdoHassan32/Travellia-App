import 'package:flutter/material.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_rate_widget.dart';

import '../../../../../core/utils/styles.dart';

class CustomPreviewTitle extends StatelessWidget {
  const CustomPreviewTitle({Key? key, required this.hotel}) : super(key: key);
  final Data hotel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        children:  [
          const Text(
            'Preview',
            style: Styles.textStyle22,
          ),
          const  Spacer(
            flex: 1,
          ),
          CustomRateWidget(
            hotel: hotel ,
          ),
        ],
      ),
    );
  }
}
