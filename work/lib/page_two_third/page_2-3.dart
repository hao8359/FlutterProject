import 'package:flutter/material.dart';
import '../page_four.dart';
import 'dart:io';
import '../sound_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../socket_tts.dart';
import '../flutter_tts.dart';

var list = ['\r\n吃啥', '\r\n吃飽沒', '\r\n餓嗎', '\r\n渴嗎', '\r\n喝茶', '\r\n飲料','\r\n要不要','\r\n燙口','\r\n好吃','\r\n不好吃'];
var sentence = ['要吃什麼', '吃飽了嗎', '會不會肚子餓', '要不要喝水', '要喝茶嗎', '要喝飲料嗎', '要不要吃', '小心燙喔', '這好吃', '這不好吃'];
var picture = ['assets/askeat-transformed.png','assets/full-transformed.png','assets/hungry-transformed.png','assets/water-transformed.png','assets/tea-transformed.png',
  'assets/drink-transformed.png','assets/question-transformed.png','assets/hot-transformed.png','assets/tasty-transformed.png','assets/badfood-transformed.png','assets/education.png','assets/education.png'];
var box_color=Colors.lightGreen;
class Page_2_3 extends StatefulWidget {
  const Page_2_3({Key? key}) : super(key: key);

  @override
  State<Page_2_3> createState() => _Page_2_3();
}

class _Page_2_3 extends State<Page_2_3> {
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

  Widget function(picture1,list1,sentence1,picture2,list2,sentence2){
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.lightGreen,
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
                backgroundColor: Colors.lightGreen,
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
        title: Text("食"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: [
            Expanded(
              child: function(picture[0], list[0], sentence[0],picture[1], list[1], sentence[1]),
            ),
            Expanded(
              child: function(picture[2], list[2], sentence[2],picture[3], list[3], sentence[3]),
            ),
            Expanded(
              child: function(picture[4], list[4], sentence[4],picture[5], list[5], sentence[5]),
            ),
            Expanded(
              child: function(picture[6], list[6], sentence[6],picture[7], list[7], sentence[7]),
            ),
            Expanded(
              child: function(picture[8], list[8], sentence[8],picture[9], list[9], sentence[9]),
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

class Page_2_3_Setting extends StatelessWidget {
  final myController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

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
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: myController[0],
                          decoration: InputDecoration(hintText: '吃啥 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '吃飽沒 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '餓嗎 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '渴嗎 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '喝茶 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '飲料 欄位請輸入...'),
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: myController[6],
                          decoration: InputDecoration(hintText: '要不要 欄位請輸入...'),
                        ),
                        RaisedButton(
                          child: Text('儲存內容'),
                          onPressed: () {
                            sentence[6] = myController[6].text;
                            print(sentence[6]);
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
                          controller: myController[7],
                          decoration: InputDecoration(hintText: '燙口 欄位請輸入...'),
                        ),
                        RaisedButton(
                          child: Text('儲存內容'),
                          onPressed: () {
                            sentence[7] = myController[7].text;
                            print(sentence[7]);
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
                          controller: myController[8],
                          decoration: InputDecoration(hintText: '好吃 欄位請輸入...'),
                        ),
                        RaisedButton(
                          child: Text('儲存內容'),
                          onPressed: () {
                            sentence[8] = myController[8].text;
                            print(sentence[8]);
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
                          controller: myController[9],
                          decoration: InputDecoration(hintText: '不好吃 欄位請輸入...'),
                        ),
                        RaisedButton(
                          child: Text('儲存內容'),
                          onPressed: () {
                            sentence[9] = myController[9].text;
                            print(sentence[9]);
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
      ),
    );
  }
}