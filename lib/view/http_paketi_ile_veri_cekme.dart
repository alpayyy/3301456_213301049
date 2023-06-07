// ignore_for_file: library_private_types_in_public_api, file_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../core/const/fruits_const.dart';
import '../core/models/model_post.dart';

class HttpPaketData extends StatefulWidget {
  const HttpPaketData({
    Key? key,
  }) : super(key: key);

  @override
  _HttpPaketDataState createState() => _HttpPaketDataState();
}

class _HttpPaketDataState extends State<HttpPaketData> {
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _fetchPosts();
  }

// http paketinin kullanıldığı kısım
  Future<List<Post>> _fetchPosts() async {
    var url = Uri.https('jsonplaceholder.typicode.com', "/posts");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Post> posts = data.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: FruitConst.colorgreen,
        title: const Text("http paketinin örneği"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red,
                  child: ListTile(
                    title: Text("Title : ${snapshot.data![index].title}"),
                    subtitle: Text("Body : ${snapshot.data![index].body}"),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load posts'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
