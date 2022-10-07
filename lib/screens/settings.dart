import 'package:flutter/material.dart';
import '../constants_and_components.dart';
import 'data_settings.dart';

enum TileName { language, dataSetting, security }

PreferredSize settingsAppBar(BuildContext context) => appBar(
      false,
      context,
      'Settings',
    );

SizedBox settings(BuildContext context) => SizedBox(
      height: size(context).height,
      child: Column(
        children: [
          Material(
            elevation: 4,
            child: Container(
              color: Colors.white,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 18),
                // minVerticalPadding: 10,
                leading: CircleAvatar(backgroundColor: color_grey),
                title: Text(
                  'Alice Brown',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: color_grey),
                ),

                subtitle: Text(
                  'alicebrown@gmail.com',
                  style: TextStyle(color: color_grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: size(context).height,
                child: ListView(
                  children: [
                    Tile(Icons.language_outlined, 'Language',
                        // key: Key(TileName.language.toString()),
                        subtitle: 'English',
                        dropdown: true,
                        items: ['Arabic', 'English', 'Hausa', 'Igbo', 'Yoruba'],
                        tileName: TileName.language),
                    Tile(Icons.backup, 'Data settings',
                        // key: Key(TileName.language.toString()),
                        subtitle: 'Backup & restore',
                        dropdown: true,
                        items: ['Backup & restore'],
                        tileName: TileName.dataSetting),
                    Tile(
                      Icons.lock_rounded,
                      'Security',
                      //key: Key(TileName.language.toString()),
                      dropdown: true,
                      items: ['Fingerprint', 'Face ID'],
                      tileName: TileName.security,
                    ),
                    Tile(Icons.delete_outline_sharp, 'Clear Data',
                        dropdown: false),
                    Tile(Icons.logout_rounded, 'Log out', dropdown: false)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

// Wrong UI implementatio cry! cry!! but still useful
// class Tiles extends StatefulWidget {
//   Tiles(
//     this.leading,
//     this.title, {
//     required this.dropdown,
//     this.items,
//     this.initialValue,
//   });
//   IconData leading;
//   String title;
//   bool dropdown;
//   List<DropdownMenuItem>? items;
//   String? initialValue;

//   @override
//   _TilesState createState() => _TilesState();
// }

// class _TilesState extends State<Tiles> {
//   @override
//   Widget build(BuildContext context) => ListTile(
//       leading: Icon(widget.leading, color: Colors.black),
//       title: Text(
//         widget.title,
//         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//       ),
//       subtitle: Text(
//         widget.initialValue ?? '',
//         style: TextStyle(color: Color.fromARGB(255, 67, 65, 65)),
//       ),
//       trailing: widget.dropdown
//           ? DropdownButton(
//               underline: SizedBox(),
//               icon: Icon(Icons.keyboard_arrow_down_outlined),
//               // value: widget.initialValue,
//               items: widget.items,
//               onChanged: (dynamic value) {
//                 setState(() {
//                   widget.initialValue = value.toString();
//                 });
//               })
//           : null);
// }

class Tile extends StatefulWidget {
  Tile(
    this.leading,
    this.title, {
    //this.key,
    this.subtitle,
    required this.dropdown,
    this.items,
    this.tileName,
  });
  //: super(key: key);
  // Key? key;
  IconData leading;
  String title;
  bool dropdown;
  String? subtitle;
  List<String>? items;
  TileName? tileName;

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  TileName? _tileName;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      //  key: widget.key,
      initiallyExpanded: _tileName == widget.tileName,
      onExpansionChanged: (value) {
        if (value)
          setState(() {
            _tileName = widget.tileName;
          });
      },
      leading: Icon(widget.leading, color: color_grey),
      title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.bold, color: color_grey),
      ),
      subtitle:
          Text(widget.subtitle ?? '', style: TextStyle(color: color_grey)),
      //is it with expansion tile
      trailing: widget.dropdown
          ? Icon(Icons.keyboard_arrow_down_outlined)
          : SizedBox(),
      children: widget.dropdown
          ? widget.items!
              .map((i) => ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 50),
                    title: Text(i),
                    trailing: i == 'Fingerprint' ? Toggle() : null,
                    onTap: () {
                      if (i == 'Backup & restore') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return DataSettings();
                        })));
                      }
                      setState(() {
                        widget.subtitle = i;
                        _tileName = widget.tileName;
                      });
                    },
                  ))
              .toList() //list comprehension
          : [],
    );
  }
}
