import 'package:app/web_widgets/responsive.dart';
import 'package:flutter/material.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
      ),
      width: screenSize.width,
      child: Text(
        """Millionaries Club International 
        ABOUT US 
        “INDIA’S FIRST FAMILY ENTERTAINMENT CLUB”
Millionaries Club International started its epoch making journey in the year 1999. From our first club at the ECR Road in Chennai, we started the second club at Mount Road and the third club in Coimbatore in the same year. This was followed by the grand opening of our Erode club in 2010. In a relatively short span of time, Benze Vacations Club has redefined luxury and pampering, reaching out to families with an elegant touch of refined hospitality.""",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
