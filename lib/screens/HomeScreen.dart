import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mora_gpa/Routing/destination.dart';
import 'package:mora_gpa/Routing/destinations.dart';
import 'package:mora_gpa/Routing/tabProvider.dart';
import 'package:mora_gpa/constants/colors.dart';

import 'addSubjectScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  List<String> tabs = ['CGPA', 'Semesters'];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        title: Text(
          'Mora GPA',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: TabNavigator.provideTab(tabs[_currentIndex]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 30,
          color: kbackgroundColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSubjectScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            backgroundColor: klightBackgroundColor,
            currentIndex: _currentIndex,
            selectedItemColor: kPrimaryColor,
            showUnselectedLabels: false,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                  icon: FaIcon(
                    destination.icon,
                  ),
                  title: Text(
                    destination.title,
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
