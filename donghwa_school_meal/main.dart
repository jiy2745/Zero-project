import 'package:flutter/material.dart';
import 'custom_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'donghwa_lunch',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xff2a2d3e),
      child: Center(
        child: Column(children: [
          Container(
            height: 40,
          ),
          const Text(
            'School meal',
            style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500),
          ),
          const KcalInformation(),
          Container(
            //분홍색 컨테이너
            margin: const EdgeInsets.only(top: 50),
            width: 300,
            height: 600,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 252, 197, 185),
                Color(0xffF19E8E)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF19E8E),
            ),
            child: const LunchList(),
          )
        ]),
      ),
    ));
  }
