import 'package:flutter/material.dart';
import 'get_lunch_information.dart';

class LunchList extends StatefulWidget {
  const LunchList({Key? key}) : super(key: key);

  @override
  State<LunchList> createState() => LunchListState();
}

class LunchListState extends State<LunchList> {
  //급식 리스트 위젯
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSchoolMeal(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == true) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(snapshot.data[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w300));
              });
        } else if (snapshot.hasError) {
          return Text('Error found: ${snapshot.error}'); //에러 발생 시 출력
        } else {
          return const Text('Now loading...'); //로딩중 출력
        }
      },
    );
  }
}

class KcalInformation extends StatefulWidget {
  const KcalInformation({Key? key}) : super(key: key);

  @override
  State<KcalInformation> createState() => KcalInformationState();
}

class KcalInformationState extends State<KcalInformation> {
  //칼로리 위젯
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getKcalInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == true) {
            return Text(snapshot.data,
                style: const TextStyle(
                    color: Color.fromARGB(255, 105, 105, 105),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w100));
          } else if (snapshot.hasError) {
            return Text('Error found: ${snapshot.error}'); //에러 발생 시 출력
          } else {
            return const Text('Now loading...'); //로딩중 출력
          }
        });
  }
}
