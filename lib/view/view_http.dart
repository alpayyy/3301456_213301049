/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

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
    return Scaffold(
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
    );
  }
}

class Manav {
  bool? success;
  List<Result>? result;

  Manav({this.success, this.result});

  factory Manav.fromJson(Map<String, dynamic> json) {
    return Manav(
      success: json['success'],
      result: List<Result>.from(json['result'].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  String? img;
  String? des;
  String? kalori;
  String? name;

  Result({this.img, this.des, this.kalori, this.name});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      img: json['img'],
      des: json['des'],
      kalori: json['kalori'],
      name: json['name'],
    );
  }
}*/
