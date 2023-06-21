// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:final_projem/view/auth/login_page.dart';
import 'package:final_projem/view/bottombar_animated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
   Future.delayed(const Duration(seconds: 5));
    getUserController();
  }

  getUserController() async {
    try {
      final box = GetStorage();
      const key = 'user';

      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      var auth = FirebaseAuth.instance.currentUser;

      box.write(key, auth?.email);
      log("Giriş Yapan  Kullanıcının maili : ${auth?.email}");
      var boxx = box.read(key);
      setState(() {
        if (boxx == null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const BottomBarAnimatedPage(),
          ));
        }
      });
    } catch (e) {
      log("error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
