import 'package:doman_flash_cards/const.dart';
import 'package:doman_flash_cards/models/category_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({required this.indexCategory, Key? key}) : super(key: key);

  final int indexCategory;

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final _player = AudioPlayer();
  late String categoryName;
  late final List<String> imgList;
  late List<String> randomList;
  late String randonItem;
  Random random = Random();
  String playerChose = '';

  @override
  void initState() {
    categoryName = CategoryList.items[widget.indexCategory].name;
    imgList = CategoryList.items[widget.indexCategory].imgList;
    randomCards();
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void randomCards() {
    imgList.shuffle();
    randomList = imgList.sublist(0, kNumRandomElements);
    randonItem = randomList[random.nextInt(kNumRandomElements)];
  }

  Future<void> resultCheck() async {
    if (playerChose == randonItem) {
      await _player.setAsset('audio/true.mp3');
      _player.play();
      Fluttertoast.showToast(
          msg: '✅ Правильный ответ!',
          fontSize: 18,
          backgroundColor: Colors.green);
      Future.delayed(const Duration(milliseconds: 2500), () {
        setState(() {
          randomCards();
        });
      });
    } else {
      await _player.setAsset('audio/false.mp3');
      _player.play();
      Fluttertoast.showToast(
          msg: '⛔️ Неправильный ответ!',
          fontSize: 18,
          backgroundColor: Colors.red);
    }
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
              Text(randonItem.toUpperCase(),
                  style: kRandomItemTxt, textAlign: TextAlign.center),
              const SizedBox(height: 25),
              Expanded(
                child: GridView.builder(
                  itemCount: randomList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: kNumRandomElements,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 2,
                    childAspectRatio: 6 / 9,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          playerChose = randomList[index];
                          resultCheck();
                        },
                        child: GridTile(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/$categoryName/${randomList[index]}.jpg',
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
