import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './customButton.dart';
import './chat.dart';

class Registration extends StatefulWidget {

  static const String id = "REGISTRATION";

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    // FirebaseUser user = await _auth.createUserWithEmailAndPassword(

    AuthResult user = await _auth.createUserWithEmailAndPassword(
      email: email, 
      password: password,
    );

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => Chat(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tensor Chat"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo', 
              child: Container(
                child: Image.asset("assets/image/logo.png", color: Colors.white,),
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,

            decoration: InputDecoration(
              hintText: "Enter Your Email...",
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),

          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            
            decoration: InputDecoration(
              hintText: "Enter Your Password...",
              border: OutlineInputBorder(),
            ),
          ),

          CustomButton(
            text: "Register",
            callback: () async {
              await registerUser();
            },
          ),

        ],
      ),
      
    );
  }
}