import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:slider_button/slider_button.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => FirstRoute(),
      '/second': (context) => SecondRoute(),
      '/third': (context) => ThirdRoute(),
      '/fourth':(context) => Control(),
    },
  ));
}
class FirstRoute extends StatelessWidget {
  // const FirstRoute({Key? key}) : super(key: key);

  static const String _title = 'Hydroponic App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  //const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Smart Farm',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    )
                    ;
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdRoute()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

class SecondRoute extends StatelessWidget {
  //const SecondRouteRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydroponics App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Farm'),
        ),
        body: Container(
          height: 5000,

          child: ListView(
              padding: const EdgeInsets.all(8),
              children: [

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
                        trailing: Text("66°F"),
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
                        trailing: Text("52%"),
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
                        trailing: Text("52%"),
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
      ),
    );


  }
}





class ThirdRoute extends StatefulWidget {
  @override
  SignUpState createState() {
    return SignUpState();
  }
}

class SignUpState extends State<ThirdRoute> {
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusName = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.lightBlue,
          padding: EdgeInsets.only(top: 150.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      width: 360.00,
                      height: 600.00,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusName,
                              controller: nameController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.lightBlue,
                                    size: 22.0,
                                  ),
                                  hintText: "Enter preferred username",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.lightBlue,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusEmail,
                              controller: emailController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.phone,
                                    color: Colors.lightBlue,
                                    size: 22.0,
                                  ),
                                  hintText: "Enter phone number ",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.lightBlue,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusEmail,
                              controller: emailController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.lightBlue,
                                    size: 22.0,
                                  ),
                                  hintText: "Enter farmer_id",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.lightBlue,
                          ),

                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusPassword,
                              controller: passwordController,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.lightBlue,
                                    size: 22.0,
                                  ),
                                  hintText: "Enter password",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: focusPassword,
                              controller: passwordController,
                              style: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 16.0,
                                  color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.lightBlue,
                                    size: 22.0,
                                  ),
                                  hintText: "Confirm password",
                                  hintStyle: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      fontSize: 18.0)),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.lightBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 20.0),
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 20.0),
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlue,
                                      Colors.lightBlue,
                                    ],
                                    begin: const FractionalOffset(0.2, 0.2),
                                    end: const FractionalOffset(1.0, 1.0),
                                    stops: [0.1, 1.0],
                                    tileMode: TileMode.clamp)),
                            child: MaterialButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.lightBlue,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 42.0),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontFamily: "SignikaSemiBold",
                                      color: Colors.white,
                                      fontSize: 22.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Colors.white10,
                              Colors.white,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white10,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                  ],
                ),
              ),


            ],
          ),
        ));
  }


}

class Control extends StatelessWidget {
  //const SecondRouteRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydroponics App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Farm'),
        ),
        body: Container(
          height: 5000,

          child: ListView(
              padding: const EdgeInsets.all(8),
              children: [

                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Control  Page',
                      style: TextStyle(fontSize: 25, color: Colors.lightBlue),
                    )),
                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ), Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),

                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),

                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ), Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),
                Container(
                  color: Colors.white,
                    child: SliderButton(
                      action: () {
                        ///Do something here OnSlide
                        print("working");
                      },
                      ///Put label over here
                      label: Text(
                        "Slide to put on the water pump",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      icon: Center(
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 40.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          )),

                      //Put BoxShadow here
                      boxShadow: BoxShadow(
                        color: Colors.lightBlue,
                        blurRadius: 4,
                      ),

                      //Adjust effects such as shimmer and flag vibration here


                      ///Change All the color and size from here.
                      width: 230,
                      radius: 10,
                      buttonColor: Color(0x808080),
                      backgroundColor: Color(0x808080),
                      highlightedColor: Colors.lightBlue,
                      baseColor: Colors.lightBlue,
                    )),


                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),

                Container(
                    color: Colors.white,
                    child: SliderButton(
                      action: () {
                        ///Do something here OnSlide
                        print("working");
                      },
                      ///Put label over here
                      label: Text(
                        "Slide to put on light",
                        style: TextStyle(
                            color: Color(0xff4a4a4a),
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      icon: Center(
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 40.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          )),

                      //Put BoxShadow here
                      boxShadow: BoxShadow(
                        color: Colors.lightBlue,
                        blurRadius: 4,
                      ),

                      //Adjust effects such as shimmer and flag vibration here


                      ///Change All the color and size from here.
                      width: 230,
                      radius: 10,
                      buttonColor: Color(0x808080),
                      backgroundColor: Color(0x808080),
                      highlightedColor: Colors.lightBlue,
                      baseColor: Colors.lightBlue,
                    )),

                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),


                Container(
                    color: Colors.white24,
                    child: SliderButton(
                      action: () {
                        ///Do something here OnSlide
                        print("working");
                      },
                      ///Put label over here
                      label: Text(
                        "Slide to put on the fan",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      icon: Center(
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 40.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          )),

                      //Put BoxShadow here
                      boxShadow: BoxShadow(
                        color: Colors.lightBlue,
                        blurRadius: 4,
                      ),




                      ///Change All the color and size from here.
                      width: 230,
                      radius: 10,
                      buttonColor: Color(0xffffff),
                      backgroundColor: Color(0xffffff),
                      highlightedColor: Colors.lightBlue,
                      baseColor: Colors.lightBlue,
                    )),


                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),

                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),
                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),
                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),  Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),  Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),
                Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),  Container(
                  height: 20,
                  color: Color.fromARGB(255, 252, 251, 250),
                ),
                Row(
                  children: <Widget>[
                    const Text('Want to go back to monitoring page'),
                    TextButton(
                      child: const Text(
                        'Monitoring Page',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondRoute()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )

              ]),
        ),
      ),
    );


  }
}


