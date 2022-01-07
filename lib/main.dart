import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unrelatedapp/models/quiz.dart';
import 'package:unrelatedapp/route_generator.dart';
import 'package:unrelatedapp/screens/history.dart';
import 'package:unrelatedapp/screens/home.dart';
import 'package:unrelatedapp/screens/profile.dart';
import 'package:unrelatedapp/screens/quiz_result.dart';
import 'package:unrelatedapp/screens/slidable_quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unrelated',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}
class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  List<Widget> menuRoutes = [
    const HomePage(),
    const HistoryPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menuRoutes[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap: (index) {
          if(index == _selectedIndex) return;
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.list), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user), label: "Profile")]

    )
    );
 }
}