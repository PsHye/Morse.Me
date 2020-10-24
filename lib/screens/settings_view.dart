import 'package:brailleME/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:brailleME/main.dart' as main;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<MaterialColor> fixedLengthList = new List(6);
  MyHomePage home = new MyHomePage();

  @override
  Widget build(BuildContext context) {

    Map<int, Color> colorred = {
      50: Color.fromRGBO(255, 92, 87, .1),
      100: Color.fromRGBO(255, 92, 87, .2),
      200: Color.fromRGBO(255, 92, 87, .3),
      300: Color.fromRGBO(255, 92, 87, .4),
      400: Color.fromRGBO(255, 92, 87, .5),
      500: Color.fromRGBO(255, 92, 87, .6),
      600: Color.fromRGBO(255, 92, 87, .7),
      700: Color.fromRGBO(255, 92, 87, .8),
      800: Color.fromRGBO(255, 92, 87, .9),
      900: Color.fromRGBO(255, 92, 87, 1),
    };

    MaterialColor red = MaterialColor(0xFFFF5C57, colorred);
    fixedLengthList[0] = Colors.red;
    fixedLengthList[1] = Colors.blue;
    fixedLengthList[2] = Colors.green;
    fixedLengthList[3] = Colors.purple;
    fixedLengthList[4] = Colors.amber;
    fixedLengthList[5] = Colors.brown;
    return Scaffold(
        body: Column(
      children: [
        Text(
          'Try another style!..',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Montserrat'),
        ),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(6, (index) {
              return Center(
                child: InkWell(
                    onTap: () {MyApp.setTheme(context, CalculateMaterial(index));},
                    child: Icon(
                      MdiIcons.circle,
                      color: fixedLengthList[index],
                      size: 75,
                    )),
              );
            }),
          ),
        )
      ],
    ));
  }
  Color CalculateMaterial(int position){
    switch(position) {
      case 0: {
        return Colors.red;
      }
      break;

      case 1: {
        return Colors.blue;
      }
      break;

      case 2: {
        return Colors.green;
      }
      break;

      case 3: {
        return Colors.purple;

      }
      break;

      case 4: {
        return Colors.amber;

      }
      break;

      case 5: {
        return Colors.brown;

      }
      break;
    }

  }
}
