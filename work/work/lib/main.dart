import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';
//import 'page_four.dart';
import 'flutter_tts.dart';
var color=[Colors.blue,Colors.green,Colors.amber,Colors.purple];
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown]);
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   body: SingleChildScrollView(
      //     child: ListView.builder(
      //       scrollDirection: Axis.vertical,
      //     ),
      //   )
      // ),
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/', //加route
      routes: {
        '/': (context) => MyHomePage(),
        '/setting': (context) => SettingPage(),
        '/product': (context) => ProductPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.insert_emoticon),
      title: Text("心情"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.emoji_food_beverage),
      title: Text("飲食"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.location_on),
      title: Text("地點"),
    ),
    // BottomNavigationBarItem(
    //   backgroundColor: Colors.purple,
    //   icon: Icon(Icons.person),
    //   title: Text("自行輸入"),
    // ),
  ];

  int currentIndex = 0;

  //final pages = [PageOne(), PageTwo(), PageThree(), PageFour()];
  final pages = [PageOne(), PageTwo(), PageThree()];
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("協助發聲器"),
        backgroundColor: color[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        selectedFontSize: 30,
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
      drawer: MyDrawer(),
      floatingActionButton: Warning(),
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingIndexState();
  }
}

class _SettingIndexState extends State<SettingPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.insert_emoticon),
      title: Text("心情"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.emoji_food_beverage),
      title: Text("飲食"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.location_on),
      title: Text("地點"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.purple,
      icon: Icon(Icons.person),
      title: Text("自行輸入"),
    ),
  ];

  int currentIndex = 0;

  //final pages = [PageOne_Setting(), PageTwo_Setting(), PageThree_Setting(), PageFour_Setting()];
  final pages = [PageOne_Setting(), PageTwo_Setting(), PageThree_Setting()];
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("設定"),
        backgroundColor: color[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        selectedFontSize: 30,
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
      drawer: MyDrawer(),
      floatingActionButton: Warning(),
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('軟體介紹'),
        backgroundColor: Color(0xFF18b6b2),
      ),
      drawer: MyDrawer(),
      body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "軟體介紹",
                maxLines: 20,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "\r\n開發宗旨 : \r\n    協助無喉患者或發聲困難的使用者可以依照自己喜歡的聲音透過手機進行發聲。\r\n    利用快捷鍵可以迅速做出日常的回覆。\r\n    利用手動可以迅速做出即時性的回覆。\r\n    利用浮動按鈕可以迅速做出警示的訊號以利照護",
                maxLines: 20,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Text(
              //   "\r\n\r\n開發者 : 梁華軒 、 周延",
              //   maxLines: 20,
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          )),
    );
  }
}

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.warning),
          onPressed: () {
            print("warning");
            Text2SpeechFlutter().speak("警告 警告 警告 警告 警告 警告 警告 警告 警告");
          },
        ),
      ),
    );
  }
}

//Drawer
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFF18b6b2),
            ),
          ),
          ListTile(
            title: Text('使用頁面'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('設定'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/setting');
            },
          ),
          ListTile(
            title: Text('軟體介紹'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/product');
            },
          )
        ],
      ),
    );
  }
}

//product grid
Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(30));

List<Container> _buildGridTileList(int count) => List.generate(
    count, (i) => Container(child: Image.network('https://picsum.photos/200')));

//Homepage List
class Friends extends StatelessWidget {
  final String name;

  const Friends(this.name);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFFF355d5c),
        border:
            Border(bottom: BorderSide(width: 1.0, color: Color(0xFFFFe5fbef))),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 414,
        height: 100,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
