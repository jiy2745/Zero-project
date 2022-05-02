Zero project
=============
제로 플러터 프로젝트에 오신 것을 환영합니다!!

앞으로의 프로젝트 코드들은 각자의 팀 폴더에 저장해주시면 됩니다!!

아래는 복사, 붙여넣기해서 사용할 기본 코드들입니다!

#Basic Code
```dart
import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testapp',
      home: MainPage(),
    );
  }
}
```
#Stateless Widget
```dart
class Example extends StatelessWidget {
  const Example({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
```
#Stateful Widget
```dart
class Example extends StatefulWidget {
  const Example({ Key? key }) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
```


