import 'package:final_projem/view/fruits_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Final Ödevim Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home:const FruitsInfo() ,
    );
  }
}

//Hocam çok kez uğraştım ama api sitesinden kaynaklı 500 sunucu kaynaklı hata aldım o yüzden ben de başka şekilde veri çekmeye çalıştım.
/*import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Manav> futureManav;

  @override
  void initState() {
    super.initState();
    futureManav = fetchManav();
  }

  Future<Manav> fetchManav() async {
    final response = await http.get(
      Uri.parse("https://api.collectapi.com/food/calories?query=elma"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "apikey 1R3a7EdtroNxc9amKDw9YG:1wAtB2TdmVqTuA77rZUZJ1",
      },
    );

    if (response.statusCode == 200) {
      return Manav.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Manav>(
            future: futureManav,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.result?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber,
                      child: Center(child: Text('Entry ${snapshot.data!.result![index].name}')),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Exception: ${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Manav {
  bool? success;
  List<Result>? result;

  Manav({this.success, this.result});

  Manav.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      for (var item in json['result']) {
        result!.add(Result.fromJson(item));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? img;
  String? des;
  String? kalori;
  String? name;

  Result({this.img, this.des, this.kalori, this.name});

  Result.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    des = json['des'];
    kalori = json['kalori'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['des'] = des;
    data['kalori'] = kalori;
    data['name'] = name;
    return data;
  }
}*/
