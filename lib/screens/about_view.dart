import 'package:brailleME/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  width: 190.0,
                  height: 190.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://instagram.fcor10-3.fna.fbcdn.net/v/t51.2885-19/s150x150/118122767_586870515321754_8166494486090032793_n.jpg?_nc_ht=instagram.fcor10-3.fna.fbcdn.net&_nc_ohc=ZXYVeZN4F9MAX-_gYqE&oh=a3e69ea38e7cbd3951e0846564a968c4&oe=5FA77862")))),
            ),
            Card(
              elevation: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('Nicolás Alani'),
                    subtitle: Text('Made with ♥'),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              bottom: MediaQuery.of(context).size.width * 0.05),
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Text(
                              'Hi I\'m a multiplatform software developer, always trying my best o bring thoughts to live with passion and excelence'))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: ()=> setState((){
                            _launchURL('https://www.linkedin.com/in/nicolasalani18/');
                          }),
                          child: Row(
                            children: [
                              Icon(MdiIcons.linkedin,color: Color(0xFF0E76A8),size: MediaQuery.of(context).size.width *0.08,),
                              Text(
                                'Trayectory',
                                style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: ()=> setState((){
                            _launchURL('https://github.com/PsHye');
                          }),
                          child: Row(
                            children: [
                              Icon(MdiIcons.github, color: Color(0xFF822790),size: MediaQuery.of(context).size.width *0.08,),
                              Text(
                                'Projects',
                                style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            showDialog(
                                context: context,
                                child: AlertDialog(
                                  title: Text('Sorry!!', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Website is under development', style: TextStyle(fontFamily: 'Montserrat')),
                                        Divider(color: Colors.transparent,),
                                        Text('Keep track of my Tweet Account for more information', style: TextStyle(fontFamily: 'Montserrat')),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      color: Colors.blue,
                                      textColor: Colors.black,
                                      onPressed: () {
                                        print('Received click');
                                        Navigator.pop(context);
                                      },
                                      child: Text('Go Back', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)),
                                    )
                                  ],
                                ))
                          },
                          child: Row(
                            children: [
                              Icon(MdiIcons.web,color: Colors.indigoAccent, size: MediaQuery.of(context).size.width *0.08,),
                              Text(
                                'My Website',
                                style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
