import 'package:flutter/material.dart';

const Color color = Color.fromARGB(255, 158, 25, 202);

const Color color_grey = Color.fromARGB(255, 58, 58, 58);

Size size(BuildContext context) => MediaQuery.of(context).size;

PreferredSize appBar(bool extendedBar, BuildContext context, String pageName,
    [Widget? bottomWidget]) {
  //extendedBar : Should the appBar be extended
  //
  Size appBarSize = Size.fromHeight(size(context).height * 0.15);
  if (extendedBar) {
    return PreferredSize(
      preferredSize: appBarSize,
      child: AppBar(
        title: Text(pageName,
            style: TextStyle(
                fontSize: 28,
                color: color_grey,
                fontWeight: FontWeight.normal)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: color_grey,
          iconSize: 24,
        ),
        bottom: extendedBar
            ? PreferredSize(child: bottomWidget!, preferredSize: appBarSize / 2)
            : null,
      ),
    );
  } else {
    return PreferredSize(
      preferredSize: appBarSize / 2,
      child: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.white,
          leadingWidth: size(context).width / 1.5,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(pageName,
                softWrap: false,
                style: TextStyle(color: Colors.black, fontSize: 24)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.document_scanner_outlined,
                  color: Colors.black, size: 30),
            )
          ]),
    );
  }
}

class Toggle extends StatefulWidget {
  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool _saveCard = false;
  Widget build(BuildContext context) => Switch(
        value: _saveCard,
        onChanged: (value) {
          setState(() {
            _saveCard = value;
          });
        },
        activeColor: Colors.green,
        inactiveThumbColor: Colors.grey.shade200,
      );
}

MaterialButton button(BuildContext context, String buttonName) {
  return MaterialButton(
    height: size(context).height * 0.1,
    onPressed: () {},
    color: Color.fromARGB(
      255,
      108,
      56,
      125,
    ),
    child: Text(
      buttonName,
      style: TextStyle(color: Colors.white),
    ),
  );
}
