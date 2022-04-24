import 'package:flutter/material.dart';

import 'package:doman_flash_cards/models/category_model.dart';
import 'package:doman_flash_cards/pages/selected_category.dart';
import 'package:doman_flash_cards/const.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kGradientBoxDecoration,
        child: SafeArea(
            child: ListView.builder(
                itemCount: CategoryList.items.length,
                itemBuilder: (context, index) {
                  return Card(
                    // elevation: 0,
                    color: Colors.transparent,
                    child: ListTile(
                      // dense: true,
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => SelectedCategory(indexCategory: index)));
                      },
                      title: Text(CategoryList.items[index].name.toUpperCase(),
                          style: kTextBold),
                      subtitle: Text(
                          'количество карточек: ${CategoryList.items[index].imgList.length}'),
                      leading: const FlutterLogo(size: 70),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                })),
      ),
    );
  }
}
