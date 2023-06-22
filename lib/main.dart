import 'package:final_projem/view/fruits_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase yapılandırma seçeneklerini oluştur
  FirebaseOptions firebaseOptions = const FirebaseOptions(
    appId: '1:976042965451:android:ff78338002e8f7c2095e4e',
    apiKey: 'AIzaSyChTj8oGRWO27uDe1fhxz_wXviGiXxVXHo',
    projectId: 'final-projem-7641d',
    messagingSenderId: 'project-976042965451',
  );

  // Firebase başlatma işlemini gerçekleştir
  await Firebase.initializeApp(options: firebaseOptions);

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Final Ödevim Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const FruitsInfo(),
    );
  }
}
