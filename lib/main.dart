import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_drawer/defaults/defaults.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    Center(
      child: Text('Inbox'),
    ),
    Center(
      child: Text('Starred'),
    ),
    Center(
      child: Text('Sent'),
    ),
    Center(
      child: Text('Drafts'),
    ),
    Center(
      child: Text('Trash'),
    ),
    Center(
      child: Text('Spam'),
    ),
  ];

  Function() updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Navigation Bar Drawer'),
        ),
        body: pages[indexClicked],
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/images (20).jpeg'),
                  ),
                ),
                padding: EdgeInsets.zero,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/omosh_copy.jpeg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Ruiyot Abby',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'ruiyotabby@gmail.com',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerTile(
                      index: 0,
                      onTap: updateState(0),
                    ),
                    DrawerTile(
                      index: 1,
                      onTap: updateState(1),
                    ),
                    DrawerTile(
                      index: 2,
                      onTap: updateState(2),
                    ),
                    DrawerTile(
                      index: 3,
                      onTap: updateState(3),
                    ),
                    DrawerTile(
                      index: 4,
                      onTap: updateState(4),
                    ),
                    DrawerTile(
                      index: 5,
                      onTap: updateState(5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        Defaults.drawerItemIcon[index],
        size: 35,
        color: indexClicked == index
            ? Defaults.drawerItemSelectorColor
            : Defaults.drawerItemColor,
      ),
      title: Text(
        Defaults.drawerItemText[index],
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: indexClicked == index
              ? Defaults.drawerItemSelectorColor
              : Defaults.drawerItemColor,
        ),
      ),
    );
  }
}
