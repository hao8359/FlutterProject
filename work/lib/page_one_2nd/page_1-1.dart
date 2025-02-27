import 'package:final_try/page_one_2nd/page_1-1_3rd/page1-1-2.dart';
import 'package:final_try/page_one_2nd/page_1-1_3rd/page1-1-3.dart';
import 'package:final_try/page_one_2nd/page_1-1_3rd/page1-1-4.dart';
import 'package:final_try/page_one_2nd/page_1-1_3rd/page1-1-5.dart';
import 'package:final_try/page_one_2nd/page_1-1_3rd/page1-1-6.dart';
import 'package:final_try/page_one_2nd/page_1-1_3rd/page1-1-7.dart';
import 'package:final_try/page_one_2nd/page_1-1_3rd/page1-1-8.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'page_1-1_3rd/page1-1-1.dart';
import '../page_four.dart';
import 'dart:io';
import '../sound_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../socket_tts.dart';
import '../flutter_tts.dart';
import 'package:flutter/material.dart';
String Language = '中文';
String sex = 'female';


var list = ['\r\n台式', '\r\n日式', '\r\n歐式', '\r\n甜的', '\r\n手搖飲', '\r\n不餓','\r\n印度式','\r\n英式'];
var sentence = ['', '', '', '', '', '','', ''];


var setting = [
  Page_1_1_1_Setting(),
  Page_1_1_2_Setting(),
  Page_1_1_3_Setting(),
  Page_1_1_4_Setting(),
  Page_1_1_5_Setting(),
  Page_1_1_6_Setting(),
  Page_1_1_7_Setting(),
  Page_1_1_8_Setting()
];

class Page_1_1 extends StatefulWidget {
  const Page_1_1({Key? key}) : super(key: key);

  @override
  State<Page_1_1> createState() => _Page_1_1();
}

class _Page_1_1 extends State<Page_1_1> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("飲食"),
      ),
      body: SingleChildScrollView(
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
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(125, 125),
                      ),
                      // icon: Icon(
                      //   Icons.insert_emoticon,
                      //   size: 50.0,
                      // ),
                      icon: Image.asset('assets/chinese.png', height: 70,width: 70,),
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
                        MaterialPageRoute(builder: (context) => Page_1_1_1()));
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
                      icon: Image.asset('assets/japanese.png', height: 70,width: 70,),
                      label: Text(
                        list[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1_2()));
                        // 得到 TextField 中輸入的 value
                        String strings = sentence[1];
                        // 如果為空則 return
                        if (strings.isEmpty) return;
                        // connect to text2speech socket
                        // The default is man voice.
                        // If you want a female's voice, put "female" into the parameter.
                        // parameter: call back function, speech synthesized text, (female)
                        print(sentence[1]);
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
                      icon: Image.asset('assets/europe.png', height: 70,width: 70,),
                      label: Text(
                        list[2],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1_3()));
                        // 得到 TextField 中輸入的 value
                        String strings = sentence[2];
                        // 如果為空則 return
                        if (strings.isEmpty) return;
                        // connect to text2speech socket
                        // The default is man voice.
                        // If you want a female's voice, put "female" into the parameter.
                        // parameter: call back function, speech synthesized text, (female)
                        print(sentence[2]);
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
                      icon: Image.asset('assets/sweets.png', height: 70,width: 70,),
                      label: Text(
                        list[3],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1_4()));
                        // 得到 TextField 中輸入的 value
                        String strings = sentence[3];
                        // 如果為空則 return
                        if (strings.isEmpty) return;
                        // connect to text2speech socket
                        // The default is man voice.
                        // If you want a female's voice, put "female" into the parameter.
                        // parameter: call back function, speech synthesized text, (female)
                        print(sentence[3]);
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
                      icon: Image.asset('assets/drink.png', height: 70,width: 70,),
                      label: Text(
                        list[4],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1_5()));
                        // 得到 TextField 中輸入的 value
                        String strings = sentence[4];
                        // 如果為空則 return
                        if (strings.isEmpty) return;
                        // connect to text2speech socket
                        // The default is man voice.
                        // If you want a female's voice, put "female" into the parameter.
                        // parameter: call back function, speech synthesized text, (female)
                        print(sentence[4]);
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
                      icon: Image.asset('assets/full.png', height: 70,width: 70,),
                      label: Text(
                        list[5],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1_6()));
                        // 得到 TextField 中輸入的 value
                        String strings = sentence[5];
                        // 如果為空則 return
                        if (strings.isEmpty) return;
                        // connect to text2speech socket
                        // The default is man voice.
                        // If you want a female's voice, put "female" into the parameter.
                        // parameter: call back function, speech synthesized text, (female)
                        print(sentence[5]);
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
                      icon: Image.asset('assets/india.png', height: 70,width: 70,),
                      label: Text(
                        list[6],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1_7()));
                        // 得到 TextField 中輸入的 value
                        String strings = sentence[6];
                        // 如果為空則 return
                        if (strings.isEmpty) return;
                        // connect to text2speech socket
                        // The default is man voice.
                        // If you want a female's voice, put "female" into the parameter.
                        // parameter: call back function, speech synthesized text, (female)
                        print(sentence[6]);
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
                      icon: Image.asset('assets/england.png', height: 70,width: 70,),
                      label: Text(
                        list[7],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Page_1_1_8()));
                        // 得到 TextField 中輸入的 value
                        String strings = sentence[7];
                        // 如果為空則 return
                        if (strings.isEmpty) return;
                        // connect to text2speech socket
                        // The default is man voice.
                        // If you want a female's voice, put "female" into the parameter.
                        // parameter: call back function, speech synthesized text, (female)
                        print(sentence[7]);
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
            ),
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

class Page_1_1_Setting extends StatelessWidget {
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
