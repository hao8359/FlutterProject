import 'package:flutter/material.dart';
import 'dart:math';
import 'page_three_third/page_3-1.dart';
import 'page_three_third/page_3-2.dart';
import 'page_three_third/page_3-3.dart';
import 'page_three_third/page_3-4.dart';
import 'page_three_third/page_3-5.dart';
import 'page_three_third/page_3-6.dart';
import 'page_three_third/page_3-7.dart';
import 'page_three_third/page_3-8.dart';

var list = ['\r\n醫院', '\r\n海邊', '\r\n山上', '\r\n便利商店', '\r\n超市', '\r\n菜市場','\r\n交通','\r\n百貨公司'];
var setting = [
  Page_3_1_Setting(),
  Page_3_2_Setting(),
  Page_3_3_Setting(),
  Page_3_4_Setting(),
  Page_3_5_Setting(),
  Page_3_6_Setting(),
  Page_3_7_Setting(),
  Page_3_8_Setting()
];
var box_color=Colors.orange;
class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThree();
}

class _PageThree extends State<PageThree> {
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
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor:box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/hostpital.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_1()));
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
                      backgroundColor: box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/summer-holidays.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_2()));
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
                      backgroundColor: box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/mountains.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_3()));
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
                      backgroundColor: box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/shop.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_4()));
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
                      backgroundColor: box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/cart.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_5()));
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
                      backgroundColor: box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/market.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_6()));
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
                      backgroundColor: box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/traffic.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_7()));
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
                      backgroundColor: box_color,
                      minimumSize: Size(125, 125),
                    ),
                    // icon: Icon(
                    //   Icons.insert_emoticon,
                    //   size: 50.0,
                    // ),
                    icon: Image.asset('assets/sogo.png', height: 50,width: 50,),
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
                          MaterialPageRoute(builder: (context) => Page_3_8()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        // Expanded(
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: Padding(
        //           padding: const EdgeInsets.all(15),
        //           child: TextButton.icon(
        //             style: TextButton.styleFrom(
        //               primary: Colors.black,
        //               backgroundColor: box_color,
        //               minimumSize: Size(125, 125),
        //             ),
        //             // icon: Icon(
        //             //   Icons.insert_emoticon,
        //             //   size: 50.0,
        //             // ),
        //             icon: Image.asset('assets/airplane.png', height: 80,width: 80,),
        //             label: Text(
        //               list[8],
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: 24.0,
        //                 fontWeight: FontWeight.w700,
        //               ),
        //             ),
        //             onPressed: () {
        //               Navigator.of(context).push(
        //                   MaterialPageRoute(builder: (context) => Page_3_5()));
        //             },
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         child: Padding(
        //           padding: const EdgeInsets.all(15),
        //           child: TextButton.icon(
        //             style: TextButton.styleFrom(
        //               primary: Colors.black,
        //               backgroundColor: box_color,
        //               minimumSize: Size(125, 125),
        //             ),
        //             // icon: Icon(
        //             //   Icons.insert_emoticon,
        //             //   size: 50.0,
        //             // ),
        //             icon: Image.asset('assets/home.png', height: 80,width: 80,),
        //             label: Text(
        //               list[9],
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontSize: 24.0,
        //                 fontWeight: FontWeight.w700,
        //               ),
        //             ),
        //             onPressed: () {
        //               Navigator.of(context).push(
        //                   MaterialPageRoute(builder: (context) => Page_3_6()));
        //             },
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
        ),
    );
  }
}

class PageThree_Setting extends StatefulWidget {
  const PageThree_Setting({Key? key}) : super(key: key);

  @override
  State<PageThree_Setting> createState() => _PageThree_Setting();
}

class _PageThree_Setting extends State<PageThree_Setting> {
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
              color: Colors.orange,
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
