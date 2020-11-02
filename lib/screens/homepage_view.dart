import 'package:brailleME/morseapi/methods.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textToTranslate = new TextEditingController();
  String inputText = ResponseTranslator().inputText;
  String morseText = ResponseTranslator().tranlatedText;

  bool go = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.02),
          child: Center(
            child: Text(
              'WELCOME to the Text Translator',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    controller: textToTranslate,
                    decoration: const InputDecoration(
                      hintText: 'Enter text to translate',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: OutlineButton(
                    color: Colors.indigoAccent,
                    onPressed: () {
                      setState(() {
                        go = true;
                        inputText = textToTranslate.text;
                        translate(inputText).then((val) => setState(() {
                              morseText = val.tranlatedText;
                              print(morseText);
                            }));
                      });
                      if (_formKey.currentState.validate()) {}
                    },
                    child: Text('Translate'),
                  ),
                ),
                Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: inputText != null
                            ? Text(
                                'Word: $inputText',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                'Word: -',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                        subtitle: Text(
                          'Transalted to Morse is...',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () => {
                            showToast('Morse Copied to Clipboard', '$morseText')
                          },
                          child: inputText != null
                              ? Text(
                                  '$morseText',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontFamily: 'Montserrat',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
                              : ListTile(
                                  leading: Icon(
                                    Icons.info_outline,
                                    color: Colors.red,
                                    size: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  title: Text(
                                    'Please, enter a text to translate, at the top',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('DID YOU KNOW?', style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.01),
                    child: Text(
                            'Descripcion'),
                  )
                ],
              ),
              Column(
                children: [
                  Image.network(
                    'http://enciclopedia.us.es/images/e/ef/Samuel_Morse.jpg',
                    height: MediaQuery.of(context).size.height * 0.15,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }

  void showToast(String msg, String clipboard, {int duration}) {
    Toast.show(msg, context, duration: duration, gravity: Toast.CENTER);
    FlutterClipboard.copy(clipboard).then((value) => print('copied'));
  }
}
