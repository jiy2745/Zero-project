import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';
import 'lunch_information_after_treatment.dart';

const String myKey = ''; //openapi 개인 키 입력 (개인키 안넣으면 코드 실행 안됨!!!)
final String now = DateFormat('yyyyMMdd')
    .format(DateTime.now()); //오늘의 날짜를 yyyyMMdd형태로 저장 ex)20220502

Future<List<String>> getSchoolMeal() async {
  //급식 정보 가져오기
  final List<String> weekend = ['급식이 없습니다'];
  final Uri url = Uri.parse(
      'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=$myKey&ATPT_OFCDC_SC_CODE=J10&SD_SCHUL_CODE=7530156&MLSV_YMD=$now'); //url정보
  final http.Response response = await http.get(url); //url에 있는 정보 가져오기
  final XmlDocument document = XmlDocument.parse(response.body);
  final String rawLunchInformation = document
      .findAllElements('DDISH_NM')
      .toString(); //가져온 정보 중 급식 정보만 가져와서 스트링으로 번경
  if (rawLunchInformation.length == 2) {
    //주말, 방학 등의 이유로 급식 정보가 없을 시 '급식이 없습니다' 반환
    return weekend;
  } else {
    final List<String> lunchInformation =
        afterTreatment(rawLunchInformation); //정보 후처리
    return lunchInformation;
  }
}

Future<String> getKcalInfo() async {
  //킬로리 정보 가져오기, 위랑 똑같다
  String weekend = '0 Kcal';
  final Uri url = Uri.parse(
      'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=$myKey&ATPT_OFCDC_SC_CODE=J10&SD_SCHUL_CODE=7530156&MLSV_YMD=$now');
  final http.Response response = await http.get(url);
  final XmlDocument document = XmlDocument.parse(response.body);
  final String rawKcalInformation =
      document.findAllElements('CAL_INFO').toString();
  if (rawKcalInformation.length == 2) {
    return weekend;
  } else {
    final String kcalInformation = afterTreatmentKcal(rawKcalInformation);
    return kcalInformation;
  }
}
