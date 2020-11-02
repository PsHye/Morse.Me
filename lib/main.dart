import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:brailleME/Screens/about_view.dart';
import 'package:brailleME/Screens/knowledge_view.dart';
import 'package:brailleME/screens/game_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'Screens/homepage_view.dart';
import 'Screens/settings_view.dart';

var _primary = Colors.blue; // This will hold the value of the app main color

var themeData = ThemeData(
    fontFamily: 'Raleway',
    primaryColor:
        Colors.red, // so when the rebuilds the color changes take effect
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    accentColor: _primary);

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({
    Key key,
  }) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();

  static void setTheme(BuildContext context, Color newColor) {
    _MyAppState state = context.ancestorStateOfType(TypeMatcher<_MyAppState>());
    state.setState(() {
      print(_primary.toString());
      _primary = newColor;
    });
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(accentColor: _primary),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primary,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  MdiIcons.heart,
                  size: 26.0,
                ),
              )),
        ],
        title: Text(
          "Morse.ME",
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            KnowledgePage(),
            GamePage(),
            AboutPage(),
            SettingsPage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Theme.of(context).accentColor,
        curve: Curves.easeIn,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text(
                'TRANSLATE',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              icon: Icon(
                MdiIcons.translate,
                color: Colors.white,
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text(
                'LIBRARY',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                MdiIcons.book,
                color: Colors.white,
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text(
                'GAME',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                MdiIcons.gamepad,
                color: Colors.white,
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text(
                'ABOUT',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                MdiIcons.information,
                color: Colors.white,
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text(
                'SETTINGS',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                MdiIcons.cog,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
