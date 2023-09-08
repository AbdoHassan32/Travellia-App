import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travellia/constants.dart';
import 'package:travellia/core/utils/assets.dart';
import 'package:travellia/core/utils/styles.dart';

class ItemCategoryListView extends StatelessWidget {
  const ItemCategoryListView({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: Container(
        width: 103,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kItemBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(index == 0?AssetsData.frame1:index ==1 ? AssetsData.frame2 :index == 2 ? AssetsData.frame3:index==3?AssetsData.frame4:AssetsData.frame1),
            const SizedBox(
              width: 5.85,
            ),
            Text(
              index == 0? 'Mountain' : index == 1 ? 'Sea':index==2?'Desert':index ==3?'Forest':'Mountain',
              style: Styles.textStyle14.copyWith(
                color: kGreyTextsColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
