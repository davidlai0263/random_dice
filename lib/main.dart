import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Dice',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const RandomDice(),
    );
  }
}

class RandomDice extends StatefulWidget {
  const RandomDice({Key? key}) : super(key: key);

  @override
  State<RandomDice> createState() => _RandomDiceState();
}

class _RandomDiceState extends State<RandomDice> {
  int random = 1;
  List explain = ['青麥香', '頭城麻醬麵', 'Rainbow', '彩虹糖', '梁社漢', '麥當勞'];

  void randomDice() {
    setState(() {
      random = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Random Dice',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        'https://scontent.ftpe7-4.fna.fbcdn.net/v/t1.6435-9/188999367_2973070556351129_3868563858240764562_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=N2OrsJ5TIb8AX8ao0BN&_nc_ht=scontent.ftpe7-4.fna&oh=00_AT_NE_4zzEp9aF6c-hGX6u3lEOnZoqQPsvqrSqKswYfGZQ&oe=62635FFB'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          '我的幸運數字: $random',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Container(
                          height: 100,
                          width: 200,
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              color: Colors.orange,
                              child: Center(
                                  child: Text(
                                explain[random],
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Image.asset(
                  'images/dice$random.png',
                  color: Colors.blueAccent,
                  height: 125,
                  width: 125,
                ),
              ),
              ElevatedButton(
                onPressed: randomDice,
                child: const Text('開始擲骰子'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
