import 'package:flutter/material.dart';
import 'flutter_tts.dart';
import 'dart:io';
import 'sound_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'socket_tts.dart';

String Language = '中文';
String sex = 'female';

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  State<PageFour> createState() => _PageFour();
}

class _PageFour extends State<PageFour> {
  double padValue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(50.0),
        child: ListBody(
        children: [
          Center(
            child: Container(
              //margin: EdgeInsets.all(50.0),
              width: 240.0,
              height: 240.0,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "個人頭像",
                  style: new TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "個人資料",
            style: new TextStyle(
              fontSize: 30.0,
            ),
          ),
          Container(
            //alignment: Alignment.centerLeft,
            //margin: const EdgeInsets.all(10.0),
            //color: Colors.amber[600],
            width: 500,
            height: 200.0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      "姓名 : 使用者",
                      style: new TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "性別 : 生理男",
                      style: new TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "年齡 : 50",
                      style: new TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "登出",
                  style: new TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageFour_Setting extends StatefulWidget {
  const PageFour_Setting({Key? key}) : super(key: key);

  @override
  State<PageFour_Setting> createState() => _PageFour_Setting();
}

class _PageFour_Setting extends State<PageFour_Setting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '語言選擇    ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                DropdownButton(
                  style: TextStyle(
                      //te
                      color: Colors.black, //Font color
                      fontSize: 20 //font size on dropdown button
                      ),
                  //dropdown background color
                  //underline: Container(),
                  //remove underline
                  //isExpanded: true,
                  value: Language,
                  onChanged: (String? newCatagory) {
                    setState(() {
                      Language = newCatagory!;
                      print(Language);
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: '中文',
                      child: Text('中文'),
                    ),
                    DropdownMenuItem(
                      value: '台語',
                      child: Text('台語'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '性別選擇    ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                DropdownButton(
                  style: TextStyle(
                      //te
                      color: Colors.black, //Font color
                      fontSize: 20 //font size on dropdown button
                      ),
                  //dropdown background color
                  //underline: Container(),
                  //remove underline
                  //isExpanded: true,
                  value: sex,
                  onChanged: (String? newCatagory) {
                    setState(() {
                      sex = newCatagory!;
                      print(sex);
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'man',
                      child: Text('男生'),
                    ),
                    DropdownMenuItem(
                      value: 'female',
                      child: Text('女生'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
