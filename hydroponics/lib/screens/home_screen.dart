import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hydroponics/screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'control_Screen.dart';
import 'login_Screen.dart';

class Home_Screen extends StatefulWidget {
  static const String id = "home_screen";
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final _auth = FirebaseAuth.instance;

  late var temperature;
  late var humidity;
  late var light_intensity;


  @override
  void initState() {
    temperature = 0;
    humidity = 0;
    light_intensity =0;

    readData();
    super.initState();
  }


  readData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? emailValue = prefs.getString('email');

    DatabaseReference starCountRef =
    FirebaseDatabase.instance.ref('sensor_values_esp_1/Farmer_1');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      // print(data);

      if(emailValue != "advanessa141@gmail.com"){
        updateData(data);
      }

    });

  }


  updateData(data){

    var formattedData  = data.toString().split(';');

    setState(() {
      temperature = formattedData[0].split(':')[1];
      humidity = formattedData[1].split(':')[1];
      light_intensity = formattedData[2].split(':')[1];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Farm'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () async {
              await _auth.signOut();

              Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginScreen.id, (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: Container(
        height: 5000,
        child: ListView(padding: const EdgeInsets.all(8), children: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                ' Monitoring Page',
                style: TextStyle(fontSize: 25, color: Colors.lightBlue),
              )),
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            color: Colors.lightBlue,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometer),
                  title: Text("Temperature"),
                  trailing: Text("${temperature}°F"),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Color.fromARGB(255, 252, 251, 250),
          ),
          Container(
            height: 50,
            color: Colors.lightBlue,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text("Humidity"),
                  trailing: Text("${humidity}%"),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Color.fromARGB(255, 252, 251, 250),
          ),
          Container(
            height: 50,
            color: Colors.lightBlue,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.highlighter),
                  title: Text("Light Intensity"),
                  trailing: Text("${light_intensity}%"),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Color.fromARGB(255, 252, 251, 250),
          ),
          Container(
            height: 50,
            color: Colors.lightBlue,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloudscale),
                  title: Text("pH"),
                  trailing: Text("5.8"),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Color.fromARGB(255, 252, 251, 250),
          ),
          Container(
            height: 50,
            color: Colors.lightBlue,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.water),
                  title: Text("water level"),
                  trailing: Text("4.5 inches"),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Color.fromARGB(255, 252, 251, 250),
          ),
          Container(
            height: 50,
            color: Colors.lightBlue,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.water),
                  title: Text("water resevoir height"),
                  trailing: Text("9.0 inches"),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              const Text('Want to go to controlling page'),
              TextButton(
                child: const Text(
                  'Control Page',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Control()),
                  );
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ]),
      ),
    );
  }
}
