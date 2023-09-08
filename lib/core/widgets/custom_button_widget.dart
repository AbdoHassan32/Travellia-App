import 'package:flutter/material.dart';
import 'package:travellia/core/utils/styles.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({required this.buttonColor,required this.label,Key? key, required this.onPressed}) : super(key: key);
  final String label;
  final Color buttonColor;
  final VoidCallback ? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child:  Text(
          label,
          style: Styles.textStyle17,
        ),
      ),
    );
  }
}
