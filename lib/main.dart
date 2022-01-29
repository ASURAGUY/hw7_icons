import 'dart:math';

import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _controller = TextEditingController();
  late Game _game;

  HomePage({Key? key}) : super(key: key) {
    _game = Game(maxRandom: 100);
  }

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'NEXT',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var showSeven = true;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ////Image.asset('assets/images/guess_logo.png', width: 90.0),
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Icon(
                            Icons.https,
                            size: 80.0,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('กรุณาใส่รหัสผ่าน',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                    ),
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: buildButton(num: 0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child:
                        Icon(Icons.backspace, size: 30.0, color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextButton(
                  child: Text(
                    'ลืมรหัสผ่าน',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                  ),
                  onPressed: () {
                    _showOkDialog(context, 'ลืมรหัสผ่าน',
                        'โปรดยืนยันตัวตน เพื่อตั้งค่ารหัสผ่านใหม่');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        child: TextButton(
          onPressed: () {
            print('You pressed $num');
          },
          child: Text(
            '$num',
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          ),
        ),
        width: 50.0,
        height: 50.0,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.black38,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white70, width: 4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
      ),
    );
  }
}
