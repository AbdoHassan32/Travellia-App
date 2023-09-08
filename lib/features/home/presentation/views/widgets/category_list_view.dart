import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travellia/features/home/presentation/views/widgets/item_category_list_view.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 25,
        ),
        itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>  ItemCategoryListView(index: index,)),
    );
  }
}
