import 'package:flutter/material.dart';
import 'package:new_pp/model/categorydata.dart';
import 'package:new_pp/widgets/categoryItem.dart';

class CstegoryListView extends StatelessWidget {
  const CstegoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, // Make it horizontal
      itemCount: categorydata.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/category',
                arguments: categorydata[i].name);
          },
          child: CategoryItem(
            image: categorydata[i].image,
            name: categorydata[i].name,
          ),
        );
      },
    );
  }
}
