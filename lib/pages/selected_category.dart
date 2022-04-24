import 'package:doman_flash_cards/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:doman_flash_cards/const.dart';

class SelectedCategory extends StatelessWidget {
  final int indexCategory;

  const SelectedCategory({required this.indexCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryName = CategoryList.items[indexCategory].name;
    final categoryItems = CategoryList.items[indexCategory].imgList;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: Container(
        decoration: kGradientBoxDecoration,
        child: SafeArea(
          child: GridView.builder(
            key: PageStorageKey<String>('gridPage'),
            itemCount: CategoryList.items[indexCategory].imgList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 4,
              childAspectRatio: 6 / 9,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/$categoryName/${categoryItems[index]}.jpg', // TODO
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(tTextPlay),
        icon: const Icon(Icons.play_arrow),
        // backgroundColor: Colors.pink,
      ),
    );
  }
}
