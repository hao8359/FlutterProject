import 'package:flutter/material.dart';
import 'dart:math';
import 'page_one_2nd/page_1-1.dart';
import 'page_one_2nd/page_1-2.dart';
import 'page_one_2nd/page_1-3.dart';
import 'page_one_2nd/page_1-4.dart';
import 'page_one_2nd/page_1-5.dart';
import 'page_one_2nd/page_1-6.dart';
import 'page_one_2nd/page_1-7.dart';
import 'page_one_2nd/page_1-8.dart';

var list = ['\r\n飲食', '\r\n衣', '\r\n住', '\r\n行', '\r\n醫療', '\r\n養生','\r\n工作','\r\n育樂'];
var setting = [
  Page_1_1_Setting(),
  Page_1_2_Setting(),
  Page_1_3_Setting(),
  Page_1_4_Setting(),
  Page_1_5_Setting(),
  Page_1_6_Setting(),
  Page_1_7_Setting(),
  Page_1_8_Setting()
];



class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOne();
}

class _PageOne extends State<PageOne> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: ListBody(
        children: [
          // Expanded(
          //   child: SingleChildScrollView(
          //    child: Column(
          //      children: [
          Expanded(
          //child: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/eatfood.png', height: 70,width: 70,),

                      label: Text(
                        list[0],
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1()));
                      },
                    ),
                  ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/clothe.png', height: 75,width: 75,),
                      label: Text(
                        list[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_2()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          //),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/home.png', height: 80,width: 80,),
                      label: Text(
                        list[2],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_3()));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/walk.png', height: 70,width: 70,),
                      label: Text(
                        list[3],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_4()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/hostpital.png', height: 50,width: 50,),
                      label: Text(
                        list[4],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_5()));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/care.png', height: 50,width: 50,),
                      label: Text(
                        list[5],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_6()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/work.png', height: 60,width: 60,),
                      label: Text(
                        list[6],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_7()));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/play.png', height: 50,width: 50,),
                      label: Text(
                        list[7],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_8()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
            //],
          //),
       //),
            //),
        ],
      ),
      );
  }
}

class PageOne_Setting extends StatefulWidget {
  const PageOne_Setting({Key? key}) : super(key: key);

  @override
  State<PageOne_Setting> createState() => _PageOne_Setting();
}

class _PageOne_Setting extends State<PageOne_Setting> {
  int _pageIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView.builder(
        onPageChanged: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(_pageIndex, index);
        },
        controller: _pageController,
        itemCount: 6,
      ),
      // Indicator
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: DotsIndicator(
              color: Colors.blue,
              itemCount: 6,
              controller: _pageController,
              onPageSelected: (int page) {
                _pageController.animateToPage(
                  page,
                  duration: _kDuration,
                  curve: _kCurve,
                );
              }),
        ),
      ),
      // 利用 IgnorePointer 忽略 ListView 的滑動
    ]);
  }
}

_buildItem(activeIndex, index) {
  return setting[index];
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
