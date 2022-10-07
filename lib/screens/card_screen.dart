import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Padding card(String imagePath) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.width * 0.05, horizontal: size.width * 0.1),
        child: Slidable(
          endActionPane:
              ActionPane(extentRatio: 0.2, motion: ScrollMotion(), children: [
            SlidableAction(
              onPressed: (context) {},
              foregroundColor: Colors.pink[300],
              icon: Icons.delete_outline,
            )
          ]),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  )),
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              height: size.height * 0.25,
              width: size.width * 0.65,
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.02),
        child: Column(
          //textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            card('assets/images/a.png'),
            card('assets/images/b.png'),
            card('assets/images/c.png')
          ],
        ),
      ),
    );
  }
}
