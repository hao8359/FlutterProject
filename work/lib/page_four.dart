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
  final myController = TextEditingController();
  final player = SoundPlayer();

  @override
  void initState() {
    super.initState();
    player.init();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future play(String pathToReadAudio) async {
    await player.play(pathToReadAudio);
    setState(() {
      player.init();
      player.isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: myController,
          decoration: InputDecoration(hintText: "輸入你想說的句子"),
        ),
        RaisedButton(
          child: Text('送出'),
          onPressed: () async {
            String strings = myController.text;
            print(strings);
            if (Language == '中文') {
              if (sex == 'female') {
                //List<Map<String, String>> g = await Text2SpeechFlutter().flutterTts.getVoices;
                //print(g);
                Text2SpeechFlutter()
                    .flutterTts
                    .setVoice({"ssmlGender": "cmn-TW-Standard-A"});
                print(await Text2SpeechFlutter().flutterTts.getVoices);

                await Text2SpeechFlutter().speak(strings);
              } else {
                Text2SpeechFlutter()
                    .flutterTts
                    .setVoice({"name": "ta-in-x-taf-network"});
                await Text2SpeechFlutter().speak(strings);
              }
            } else {
              await Text2Speech().connect(play, strings, sex);
              // player.init();
              setState(() {
                // player.isPlaying;
              });
            }
          },
        )
      ],
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
                  '人物選擇    ',
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
                    DropdownMenuItem(
                      value: 'secondman',
                      child: Text('男生二'),
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