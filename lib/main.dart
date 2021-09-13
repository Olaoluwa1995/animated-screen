import 'package:animated_screen/constants/widgets/bottom-nav.dart';
import 'package:animated_screen/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
   
  @override
  Widget build(BuildContext context) {

     void onTabTapped (int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    final List<Widget> _children = [
      Home(),
      Container(),
      Container()
    ];
    return Scaffold(
        bottomNavigationBar: BottomNav(_currentIndex, onTabTapped,),
        body: _children[_currentIndex],
    );
  }
}