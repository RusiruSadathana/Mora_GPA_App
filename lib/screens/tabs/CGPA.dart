import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/widgets/circularCard.dart';


class CGPA extends StatefulWidget {
  @override
  _CGPAState createState() => _CGPAState();
}

class _CGPAState extends State<CGPA> with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation animation;
  double gpa = 3.67;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    animation = Tween(begin: 0.0, end: (gpa / 4.2).toDouble()).animate(
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
                          height: 30,
                        ),
                        Text(
                          'Cumulative Grade Points Average',
                          style: TextStyle(fontSize: 20, letterSpacing: 1.25),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: CircularCard(
                            currentValue: animation.value * 4.2,
                            maxValue: 4.2,
                            title: 'out of 4.20',
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Total Credits',
                          style: TextStyle(fontSize: 20, letterSpacing: 1.25),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          150.toString(),
                          style: TextStyle(fontSize: 45, letterSpacing: 1.25),
                        ),
//                        TotalCreditsCard(
//                          totalCredits: 245,
//                        ),
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
