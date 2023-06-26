import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'next_page.dart';

void main() {
  runApp(const MyApp());
}

List<String> radiobutton = ['男', '女', 'その他'];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final TextEditingController _controller = TextEditingController();

// class NextPage extends StatelessElement {
//   NextPage(super.widget);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Next Page'),
//       ),
//       body: Center(
//         child: OutlinedButton(
//           onPressed: () {  },
//           child: ,
//         ),
//       ),
//     );
//   }
// }
class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  String _type = ''; //ラジオボタンで使ってる
  String name = '';
  String gender = '';
  String space = '';

  // void _incrementCounter() { //数を増やす関数
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again∫, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  void showPicker() {
    final list = [
      '鹿児島',
      '大阪',
      '東京',
      '北海道',
    ];
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 0;

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 126,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 36,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    ).then((_) {
      _controller.value = TextEditingValue(text: list[selectedIndex]);
      space = list[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            //   style: TextStyle(fontSize: 30), //自分で追加　文字サイズの変更
            //   textAlign: TextAlign.center, //テキストを中央揃え
            // ),
            // Text( //ボタン押したら数が増えるやつ
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '氏名',
                style: TextStyle(
                  fontSize: 18,
                  height: 3.0,
                ),
              ),
            ),

            TextField(
              //入力フォーム
              enabled: true,
              maxLength: 10,
              textAlign: TextAlign.center,
              obscureText: false,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: '入力してください',
                // labelText: '氏名',
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '性別',
                style: TextStyle(
                  fontSize: 18,
                  height: 3.0,
                ),
                // textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: '男',
                    groupValue: _type,
                    onChanged: (value) {
                      setState(() {
                        _type = value!;
                      });
                      gender = _type;
                    }),
                const Text('男'),
                Radio(
                  value: '女',
                  groupValue: _type,
                  onChanged: (value) {
                    setState(() {
                      _type = value!;
                    });
                    gender = _type;
                  },
                ),
                const Text('女'),
                Radio(
                  value: 'その他',
                  groupValue: _type,
                  onChanged: (value) {
                    setState(() {
                      _type = value!;
                    });
                    gender = _type;
                  },
                ),
                const Text('その他'),
              ],
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '出身地',
                style: TextStyle(
                  fontSize: 18,
                  height: 3.0,
                ),
              ),
            ),

            TextFormField(
              onTap: () {
                //キーボードが出ないようにする
                FocusScope.of(context).requestFocus(new FocusNode());
                showPicker();
              },
              controller: _controller,
              textAlign: TextAlign.center,
              enabled: true,
              decoration: const InputDecoration(
                hintText: '選択',
                // labelText: '出身地',
              ),
              onChanged: (value) {
                space = value;
              },
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: OutlinedButton(
                child: const Text('次へ'),
                onPressed: () {
                  //指定した画面に遷移する
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NextPage(
                                nextPageName: name,
                                nextPageSpace: space,
                                nextPageGender: gender,
                              ))); //Navigator
                }, //onPressed
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton( //右下にある数を増やすためのボタン
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
