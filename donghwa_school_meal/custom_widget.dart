import 'package:flutter/material.dart';
import 'get_lunch_information.dart';
import 'package:url_launcher/url_launcher.dart';

void startLink(int gog) async {
  if (gog == 0) {
    await launchUrl(
        Uri.parse(
            'https://drive.google.com/file/d/18Z00bcNR25mJ9A5tJYELZ8WfDHIwwjnV/view?usp=drivesdk'),
        mode: LaunchMode.externalApplication);
  } else {
    await launchUrl(
      Uri.parse(
          'https://github.com/jiy2745/Zero-project/tree/main/donghwa_school_meal'),
      mode: LaunchMode.externalApplication,
    );
  }
}

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
      future: getSchoolMeal(0),
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
                        fontWeight: FontWeight.w500));
              });
        } else if (snapshot.hasError) {
          return Text('Error found: ${snapshot.error}'); //에러 발생 시 출력
        } else {
          return const Center(
              child: Text('Now loading...',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500))); //로딩 //로딩중 출력
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
        future: getKcalInfo(0),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == true) {
            return Text(snapshot.data,
                style: const TextStyle(
                    color: Color.fromARGB(255, 105, 105, 105),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500));
          } else if (snapshot.hasError) {
            return Text('Error found: ${snapshot.error}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 105, 105, 105),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500)); //에러 발생 시 출력
          } else {
            return const Center(
                child: Text('Now loading...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500))); //로딩중 출력
          }
        });
  }
}

class DinnerList extends StatefulWidget {
  const DinnerList({Key? key}) : super(key: key);

  @override
  State<DinnerList> createState() => DinnerListState();
}

class DinnerListState extends State<DinnerList> {
  //급식 리스트 위젯
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSchoolMeal(1),
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
                        fontWeight: FontWeight.w500));
              });
        } else if (snapshot.hasError) {
          return Text('Error found: ${snapshot.error}'); //에러 발생 시 출력
        } else {
          return const Center(
              child: Text('Now loading...',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500))); //로딩 //로딩중 출력
        }
      },
    );
  }
}

class DinnerKcalInformation extends StatefulWidget {
  const DinnerKcalInformation({Key? key}) : super(key: key);

  @override
  State<DinnerKcalInformation> createState() => DinnerKcalInformationState();
}

class DinnerKcalInformationState extends State<DinnerKcalInformation> {
  //칼로리 위젯
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getKcalInfo(1),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == true) {
            return Text(snapshot.data,
                style: const TextStyle(
                    color: Color.fromARGB(255, 105, 105, 105),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500));
          } else if (snapshot.hasError) {
            return Text('Error found: ${snapshot.error}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 105, 105, 105),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500)); //에러 발생 시 출력
          } else {
            return const Center(
                child: Text('Now loading...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500))); //로딩중 출력
          }
        });
  }
}

class GoogleDriveInfo extends StatelessWidget {
  const GoogleDriveInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("구글 드라이브 링크  ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.5,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500)),
        ElevatedButton.icon(
          onPressed: () => startLink(0),
          icon: const Icon(Icons.add_to_drive_outlined),
          label: const Text("Google Drive"),
          style: ElevatedButton.styleFrom(
              primary: const Color(0xffe1b6ff), onPrimary: Colors.white),
        )
      ],
    );
  }
}

class GithubInfo extends StatelessWidget {
  const GithubInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("깃허브 링크  ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.5,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500)),
        ElevatedButton.icon(
          onPressed: () => startLink(1),
          icon: const Icon(Icons.code),
          label: const Text("Github"),
          style: ElevatedButton.styleFrom(
              primary: const Color(0xffe1b6ff), onPrimary: Colors.white),
        )
      ],
    );
  }
}
