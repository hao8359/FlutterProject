import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-1.dart';
import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-2.dart';
import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-3.dart';
import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-4.dart';
import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-5.dart';
import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-6.dart';
import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-7.dart';
import 'package:final_try/page_one_2nd/page_1-5_3rd/page1-5-8.dart';
import 'package:flutter/material.dart';
import '../page_four.dart';
import 'dart:io';
import '../sound_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../socket_tts.dart';
import '../flutter_tts.dart';

var list = ['\r\n眼', '\r\n鼻子', '\r\n嘴吧', '\r\n耳朵', '\r\n肚子', '\r\n腳', '\r\n手', '\r\n頭'];
var sentence = ['', '', '', '', '', '','', ''];
var picture = ['assets/EYE-transformed.png','assets/nose-transformed.png','assets/mouth-transformed.png','assets/ear-transformed.png','assets/belly-transformed.png',
  'assets/feet-transformed.png','assets/hand-transformed.png','assets/head-transformed.png'];

var setting = [
  Page_1_5_1_Setting(),
  Page_1_5_2_Setting(),
  Page_1_5_3_Setting(),
  Page_1_5_4_Setting(),
  Page_1_5_5_Setting(),
  Page_1_5_6_Setting(),
  Page_1_5_7_Setting(),
  Page_1_5_8_Setting()
];

class Page_1_5 extends StatefulWidget {
  const Page_1_5({Key? key}) : super(key: key);

  @override
  State<Page_1_5> createState() => _Page_1_5();
}

class _Page_1_5 extends State<Page_1_5> {
  final player = SoundPlayer();
  final myController = TextEditingController();

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

  Widget function(picture1,list1,sentence1,next_page1,picture2,list2,sentence2,next_page2){
    return Row(
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
              icon: Image.asset(picture1, height: 70,width: 70,),
              label: Text(
                list1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => next_page1));
                // 得到 TextField 中輸入的 value
                String strings = sentence1;
                // 如果為空則 return
                if (strings.isEmpty) return;
                // connect to text2speech socket
                // The default is man voice.
                // If you want a female's voice, put "female" into the parameter.
                // parameter: call back function, speech synthesized text, (female)
                print(sentence1);
                if (Language == "中文") {
                  if (sex == 'female') {
                    //List<Map<String, String>> g = await Text2SpeechFlutter().flutterTts.getVoices;
                    //print(g);
                    Text2SpeechFlutter()
                        .flutterTts
                        .setVoice({"ssmlGender": "cmn-TW-Standard-A"});
                    print(await Text2SpeechFlutter()
                        .flutterTts
                        .getVoices);

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
              icon: Image.asset(picture2, height: 70,width: 70,),
              label: Text(
                list2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => next_page2));
                // 得到 TextField 中輸入的 value
                String strings = sentence2;
                // 如果為空則 return
                if (strings.isEmpty) return;
                // connect to text2speech socket
                // The default is man voice.
                // If you want a female's voice, put "female" into the parameter.
                // parameter: call back function, speech synthesized text, (female)
                print(sentence2);
                if (Language == "中文") {
                  if (sex == 'female') {
                    //List<Map<String, String>> g = await Text2SpeechFlutter().flutterTts.getVoices;
                    //print(g);
                    Text2SpeechFlutter()
                        .flutterTts
                        .setVoice({"ssmlGender": "cmn-TW-Standard-A"});
                    print(await Text2SpeechFlutter()
                        .flutterTts
                        .getVoices);

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
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("醫療"),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: [
            Expanded(
              child: function(picture[0], list[0], sentence[0],Page_1_5_1(),picture[1], list[1], sentence[1],Page_1_5_2()),
            ),
            Expanded(
              child: function(picture[2], list[2], sentence[2],Page_1_5_3(),picture[3], list[3], sentence[3],Page_1_5_4()),
            ),
            Expanded(
              child: function(picture[4], list[4], sentence[4],Page_1_5_5(),picture[5], list[5], sentence[5],Page_1_5_6()),
            ),
            Expanded(
              child: function(picture[6], list[6], sentence[6],Page_1_5_7(),picture[7], list[7], sentence[7],Page_1_5_8()),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(hintText: "輸入你想說的句子"),
              ),
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
        ),
      ),
    );
  }
}

class Page_1_5_Setting extends StatelessWidget {
  final myController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: myController[0],
                        decoration: InputDecoration(hintText: '高興 欄位請輸入...'),
                      ),
                      RaisedButton(
                        child: Text('儲存內容'),
                        onPressed: () {
                          sentence[0] = myController[0].text;
                          print(sentence[0]);
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: myController[1],
                        decoration: InputDecoration(hintText: '難過 欄位請輸入...'),
                      ),
                      RaisedButton(
                        child: Text('儲存內容'),
                        onPressed: () {
                          sentence[1] = myController[1].text;
                          print(sentence[1]);
                        },
                      )
                    ],
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
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: myController[2],
                        decoration: InputDecoration(hintText: '沮喪 欄位請輸入...'),
                      ),
                      RaisedButton(
                        child: Text('儲存內容'),
                        onPressed: () {
                          sentence[2] = myController[2].text;
                          print(sentence[2]);
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: myController[3],
                        decoration: InputDecoration(hintText: '無聊 欄位請輸入...'),
                      ),
                      RaisedButton(
                        child: Text('儲存內容'),
                        onPressed: () {
                          sentence[3] = myController[3].text;
                          print(sentence[3]);
                        },
                      )
                    ],
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
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: myController[4],
                        decoration: InputDecoration(hintText: '寂寞 欄位請輸入...'),
                      ),
                      RaisedButton(
                        child: Text('儲存內容'),
                        onPressed: () {
                          sentence[4] = myController[4].text;
                          print(sentence[4]);
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: myController[5],
                        decoration: InputDecoration(hintText: '生氣 欄位請輸入...'),
                      ),
                      RaisedButton(
                        child: Text('儲存內容'),
                        onPressed: () {
                          sentence[5] = myController[5].text;
                          print(sentence[5]);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
