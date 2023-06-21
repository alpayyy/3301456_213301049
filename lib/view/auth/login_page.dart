// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:final_projem/view/bottombar_animated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  bool obsourceTextChecked = true;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
              _emailTextfield(),
              const SizedBox(
                height: 10,
              ),

              
              _passwordTextfield(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                      child: const Text(
                        "ŞİFRE SIFIRLA",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {}),
                  MaterialButton(child: const Text("ÜYE OL"), onPressed: () {})
                ],
              ),
              _loginbutton()
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _passwordTextfield() {
    return TextFormField(
      obscureText: obsourceTextChecked,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obsourceTextChecked = !obsourceTextChecked;
                });
              },
              child: Icon(obsourceTextChecked
                  ? Icons.visibility
                  : Icons.visibility_off,)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          labelText: "Şifre",
          labelStyle: const TextStyle(color: Colors.amber),
          border: const OutlineInputBorder()),
      validator: (value) {
        if (value == null) {
          return "şifre giriniz";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
    );
  }

  TextFormField _emailTextfield() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          labelText: "Kullanıcı adı",
          labelStyle: TextStyle(color: Colors.amber),
          border: OutlineInputBorder()),
      validator: (value) {
        if (value == null) {
          return "kullanıcı adını giriniz";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        setState(() {
          username = value;
        });
      },
    );
  }

  Widget _loginbutton() => ElevatedButton(
      child: const Text("GİRİŞ YAP"),
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          _formkey.currentState?.save();

          loginFirebase(username, password);
        }
      });

  void loginFirebase(String email, String password) async {
    var auth = FirebaseAuth.instance;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        value == null
            ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ))
            : Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const BottomBarAnimatedPage(),
              ));
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
