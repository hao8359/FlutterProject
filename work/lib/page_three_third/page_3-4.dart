import 'package:flutter/material.dart';
import '../page_four.dart';
import 'dart:io';
import '../sound_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../socket_tts.dart';
import '../flutter_tts.dart';

var list = ['\r\n7-11', '\r\n全家', '\r\nHi-Life', '\r\nOK', '\r\n台灣煙酒', '\r\n義美'];
var sentence = ['我要去7-11', '我要去全家', '我要去Hi-Life', '我要去OK', '我要去台灣煙酒', '我要去義美'];
var picture = ['assets/market1.png','assets/market2.png','assets/market3.png','assets/market4.png','assets/market5.png',
  'assets/market6.png','assets/market7.png','assets/market8.png'];

var box_color=Colors.orange;
class Page_3_4 extends StatefulWidget {
  const Page_3_4({Key? key}) : super(key: key);

  @override
  State<Page_3_4> createState() => _Page_3_4();
}

class _Page_3_4 extends State<Page_3_4> {
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
                backgroundColor: Colors.orange,
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
                backgroundColor: Colors.orange,
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
        title: Text("便利商店"),
        backgroundColor: Colors.amber,
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

class Page_3_4_Setting extends StatelessWidget {
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
                          decoration: InputDecoration(hintText: '7-11 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '全家 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: 'Hi-Life 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: 'OK 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '台灣菸酒 欄位請輸入...'),
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
                          decoration: InputDecoration(hintText: '義美 欄位請輸入...'),
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
      ),
    );
  }
}
