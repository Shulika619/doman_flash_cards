import 'package:doman_flash_cards/models/category_model.dart';
import 'package:doman_flash_cards/pages/play_page.dart';
import 'package:flutter/material.dart';
import 'package:doman_flash_cards/const.dart';

final bucketGlobal = PageStorageBucket();
class SelectedCategory extends StatelessWidget {
  final int indexCategory;

  const SelectedCategory({required this.indexCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation;
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
          child: PageStorage(
            bucket: bucketGlobal,
            child: GridView.builder(
              key: const PageStorageKey<String>('gridPage'),
              itemCount: CategoryList.items[indexCategory].imgList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  isPortrait == Orientation.portrait ? 2 : 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
                childAspectRatio: 6 / 9,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset('assets/$categoryName/${categoryItems[index]}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => PlayPage(indexCategory: indexCategory));
            Navigator.push(context, route);
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        label: kTextPlay,
        icon: const Icon(Icons.play_arrow),
        // backgroundColor: Colors.pink,
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
