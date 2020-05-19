import 'package:flutter/material.dart';
import './customButton.dart';
import './registration.dart';
import './login.dart';
import './chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {

  static const String id = "HOMESCREEN";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat1'),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo', 
                child: Container(
                  width: 100.0,
                  child: Image.asset("assets/image/logo.png", color: Colors.white,),
                ),
              ),

              Text(
                'Tensor Chat',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),

            ],
          ),

          SizedBox(
            height: 50.0,
          ),

          CustomButton(
            text: "Login",
            callback: () {
              Navigator.of(context).pushNamed(Login.id);
            },
          ),

          
          CustomButton(
            text: "Register",
            callback: () {
              Navigator.of(context).pushNamed(Registration.id);
            },
          ),

        ],
      ),
    );
  }
}

