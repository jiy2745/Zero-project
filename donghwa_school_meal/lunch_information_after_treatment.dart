List<String> afterTreatment(String rawLunchInformation) {
  final int lastIndex = rawLunchInformation.indexOf(']]');
  final String bracketLunchInformation = rawLunchInformation
      .substring(20, lastIndex) //앞, 뒤 필요없는 문자 제거
      .replaceAll('<br/>', ''); //<br/> 제거
  final List<String> lunchInformation = removeBracket(bracketLunchInformation);
  return lunchInformation;
}

List<String> removeBracket(String bracketLunchInformation) {
  //알레르기 정보 제거
  List<String> result = [];
  int mode = 0;

  for (int i = 0; i < bracketLunchInformation.length; i++) {
    if (mode == 0) {
      if (bracketLunchInformation[i] != '(') {
        // '('를 만날때까지 리스트에 담기
        result.add(bracketLunchInformation[i]);
      } else {
        //'('를 만나면 더 이상 리스트에 담지 않음
        mode = 1;
      }
    } else {
      if (bracketLunchInformation[i] == ')') {
        // ')'를 만날 때 다시 리스트에 담음
        mode = 0;
      }
    }
  }
  final List<String> lunchInformation = result.join('').split(' ');
  return lunchInformation;
}

String afterTreatmentKcal(String rawKcalInformation) {
  final int lastIndex = rawKcalInformation.indexOf(']]');
  final String kcalInformation =
      rawKcalInformation.substring(20, lastIndex); //앞, 뒤 필요없는 문자 제거
  return kcalInformation;
}
