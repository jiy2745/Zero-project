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
      theme: ThemeData(accentColor: const Color(0xffe1b6ff)),
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
  int selectedIndex = 0;
  PageController pageController = PageController();

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: pageController,
            onPageChanged: pageChanged,
            children: [
              Container(
                color: const Color(0xff2a2d3e),
                child: Center(
                  child: Column(children: [
                    Container(
                      height: 10,
                    ),
                    const KcalInformation(),
                    Container(
                      //분홍색 컨테이너
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      width: 300,
                      height: 550,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xffe1b6ff), Color(0xffc0e6f6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF19E8E),
                      ),
                      child: const LunchList(),
                    )
                  ]),
                ),
              ),
              Container(
                color: const Color(0xff2a2d3e),
                child: Center(
                  child: Column(children: [
                    Container(
                      height: 10,
                    ),
                    const DinnerKcalInformation(),
                    Container(
                      //분홍색 컨테이너
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      width: 300,
                      height: 550,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xffe1b6ff), Color(0xffc0e6f6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF19E8E),
                      ),
                      child: const DinnerList(),
                    )
                  ]),
                ),
              ),
              Container(
                  color: const Color(0xff2a2d3e),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      children: [const GoogleDriveInfo(), const GithubInfo()]))
            ]),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.lunch_dining),
              label: 'Lunch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Dinner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Infomation',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xffe1b6ff),
          backgroundColor: const Color(0xff35384e),
          unselectedItemColor: const Color(0xffc0e6f6),
          unselectedFontSize: 12,
          selectedFontSize: 12.5,
          elevation: 0.0,
          onTap: onItemTapped,
        ),
        appBar: AppBar(
          title: const Text(
            "School Meal",
            style: TextStyle(
                fontFamily: 'NotoSansKR', fontWeight: FontWeight.w500),
          ),
          backgroundColor: const Color(0xff35384e),
          centerTitle: true,
        ));
  }
}
//0xffe1b6ff 분홍
//0xffc0e6f6 파랑
