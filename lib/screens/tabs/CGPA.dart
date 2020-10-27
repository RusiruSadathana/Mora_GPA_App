import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mora_gpa/classes/ScreenSize.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/widgets/circularCard.dart';

class CGPA extends StatefulWidget {
  final dynamic data;

  CGPA({Key key, @required this.data}) : super(key: key);
  @override
  _CGPAState createState() => _CGPAState();
}

class _CGPAState extends State<CGPA> with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation animation;
  double cgpa;
  double totalCredits;

  _setupData() {
    cgpa = widget.data['CGPA'].toDouble();
    totalCredits = widget.data['totalCredits'].toDouble();
  }

  @override
  void initState() {
    super.initState();
    _setupData();
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    animation = Tween(begin: 0.0, end: (cgpa / 4.2).toDouble()).animate(
      CurvedAnimation(
        parent: animController,
        curve: Curves.easeOut,
      ),
    );
    animController.forward();
    animController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: kbackgroundColor,
              child: AnimationLimiter(
                child: SingleChildScrollView(
                  child: Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: <Widget>[
                        SizedBox(
                          height: ScreenSize.getHeight(context) * .024,
                        ),
                        Text(
                          'Current Grade Point Average',
                          style: TextStyle(
                              fontSize:
                                  ScreenSize.getMinimumSize(context) * .057,
                              letterSpacing: 1.25),
                        ),
                        SizedBox(
                          height: ScreenSize.getHeight(context) * 0.049,
                        ),
                        Center(
                          child: CircularCard(
                            currentValue: animation.value * 4.2,
                            maxValue: 4.2,
                            title: 'out of 4.20',
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.getHeight(context) * 0.049,
                        ),
                        Text(
                          'Total GPA Credits',
                          style: TextStyle(
                              fontSize:
                                  ScreenSize.getMinimumSize(context) * .066,
                              letterSpacing: 1.25),
                        ),
                        SizedBox(
                          height: ScreenSize.getHeight(context) * .010,
                        ),
                        Text(
                          totalCredits.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: ScreenSize.getMinimumSize(context) * .105,
                            letterSpacing: 1.25,
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.getHeight(context) * 0.061,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
