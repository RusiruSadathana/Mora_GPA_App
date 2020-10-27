import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mora_gpa/Routing/destination.dart';
import 'package:mora_gpa/Routing/destinations.dart';
import 'package:mora_gpa/Routing/tabProvider.dart';
import 'package:mora_gpa/classes/ScreenSize.dart';
import 'package:mora_gpa/constants/colors.dart';

import 'addSubjectScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.initIndex});
  int initIndex;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  List<String> tabs = ['CGPA', 'Semesters'];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.initIndex != null) {
      _currentIndex = widget.initIndex;
      widget.initIndex = null;
    }
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        title: Text(
          'Mora GPA',
          style: TextStyle(
              fontSize: ScreenSize.getMinimumSize(context) * .06944,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: TabNavigator.provideTab(tabs[_currentIndex]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ));
              }
            }),
      ),
      floatingActionButton: Container(
        height: ScreenSize.getMinimumSize(context) * .12,
        width: ScreenSize.getMinimumSize(context) * .12,
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: ScreenSize.getMinimumSize(context) * .06944,
            color: kbackgroundColor,
          ),
          onPressed: () async {
            dynamic result = await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddSubjectScreen(
                  semester: null,
                  currentIndex: _currentIndex,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: ScreenSize.getMinimumSize(context) * .0231,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: ScreenSize.getMinimumSize(context) * .138,
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
                    size: ScreenSize.getMinimumSize(context) * .048,
                  ),
                  title: Text(
                    destination.title,
                    style: TextStyle(
                        fontSize: ScreenSize.getMinimumSize(context) * .032),
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
