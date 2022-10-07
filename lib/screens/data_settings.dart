import 'package:flutter/material.dart';
import '../constants_and_components.dart';

class DataSettings extends StatefulWidget {
  @override
  State<DataSettings> createState() => _DataSettingsState();
}

class _DataSettingsState extends State<DataSettings> {
  @override
  Widget build(BuildContext context) {
    List body = <Padding>[BackUp(context), Restore(context)];
    int selectedIndex = 0;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: appBar(
              true,
              context,
              'Data Settings',
              TabBar(
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                tabs: [
                  Tab(
                    child: Text(
                      'BackUp',
                      style: tabText,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Restore',
                      style: tabText,
                    ),
                  ),
                ],
              )),
          body: TabBarView(children: [BackUp(context), Restore(context)])),
    );
  }
}

Padding Restore(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(
          vertical: size(context).height * 0.02,
          horizontal: size(context).width * 0.0005),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Align(
          alignment: Alignment.center,
          child:Text('Restore your one card data to your phone internal storage', softWrap: true),),
        SizedBox(
          height: size(context).height * 0.45,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.note_sharp,
                  color: color_grey,
                ),
                Text('AliceBrownCards.csv')
              ],
            ),
          ),
        ),
        Spacer(),
        button(context, 'Restore Data')
      ]),
    );

Padding BackUp(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(
          vertical: size(context).height * 0.02,
          horizontal: size(context).width * 0.0005),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        backupTile('Automatic Restore'),
        backupTile('Export data', 'Data may include your card details', [
          ListTile(
            leading: Icon(Icons.note_sharp),
            title: Text('CSV'),
            trailing: Toggle(),
          ),
          ListTile(
            leading: Icon(Icons.note_sharp),
            title: Text('PDF'),
          )
        ]),
        Spacer(),
        button(context, 'Export Data')
      ]),
    );

TextStyle tabText = const TextStyle(color: Colors.black, fontSize: 24);

ExpansionTile backupTile(String tileName,
        [String? subname, List<Widget>? options]) =>
    ExpansionTile(
      textColor: color_grey,
      iconColor: color_grey,
      children: options ?? [],
      subtitle: Text(subname ?? ''),
      title: Text(tileName,
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold)),
    );
