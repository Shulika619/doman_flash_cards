import 'package:doman_flash_cards/const.dart';
import 'package:doman_flash_cards/models/category_model.dart';
import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({required this.indexCategory, Key? key}) : super(key: key);

  final int indexCategory;

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  late final List<String> imgList;
  late List<String> randomList;

  @override
  void initState() {
    imgList = CategoryList.items[widget.indexCategory].imgList;
    randomCards();
    super.initState();
  }

  void randomCards() {
    imgList.shuffle();
    // randomList = imgList.; // TODO
    print(imgList); //TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(kPlayAppBarTxt),
        centerTitle: true,
      ),
      body: Container(
        decoration: kGradientBoxDecoration,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              kQuestionTxt,
              Text('${widget.indexCategory}'),
            ],
          ),
        ),
      ),
    );
  }
}
