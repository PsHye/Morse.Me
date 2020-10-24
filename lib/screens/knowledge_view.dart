import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KnowledgePage extends StatelessWidget {
  var letras = ['A','B','C','D','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: letras.map((letra) {
          return Column(children: [
            Divider(color: Colors.black,),
            Text('$letra', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 20),),
            Container(height: MediaQuery.of(context).size.height*0.10,
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 0.3),),
            child: Image.asset('lib/assets/img/Morse/$letra.png'),
          )
          ],);
        }).toList(),
      )
    );
  }
  AssetImage printLetters(){
    letras.forEach((letra) {
      print('$letra');
      return AssetImage('lib/assets/img/Morse/$letra.png');
    });
  }
}