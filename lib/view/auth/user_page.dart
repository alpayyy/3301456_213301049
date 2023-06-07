// ignore_for_file: prefer_is_empty

import 'package:final_projem/core/models/model_firebase.dart';
import 'package:final_projem/view/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

List<ModelFirebase>? gelenUserDetail;

List<DocumentSnapshot>? listOfDocumentSnap;

final Stream<QuerySnapshot> _stream =
    FirebaseFirestore.instance.collection('userDetail').snapshots();

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Kullanıcı Sayfası'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
              log(snapshot.connectionState.toString());

              if (snapshot.hasData) {
                try {
                  listOfDocumentSnap = snapshot.data.docs;
                  //gelen query snapshot verilerini document snopshot a çevirdik
                  // gelen dosyayı kendi modeline me göre çevirip listeliyorum
                  gelenUserDetail = listOfDocumentSnap!
                      .map((e) => ModelFirebase.fromJson(
                          e.data() as Map<String, dynamic>))
                      .toList();

                  log("gelen Task  length : ${gelenUserDetail?.length}");

                  log("gelen Task   : $gelenUserDetail");
                } catch (e) {
                  log("error :  $e");
                }

                return _designHomeListView();
              }

              return Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).size.width / 4),
                child: const Center(child: CircularProgressIndicator()),
              );
            }));
  }

  _designHomeListView() {
    return gelenUserDetail?.length == 0 || gelenUserDetail?.length == null
        ? _hasntData()
        : ListView.builder(
            itemCount: gelenUserDetail?.length,
            itemBuilder: (context, index) {
              var userDetail = gelenUserDetail?[index];

              log("Task email : ${userDetail?.email}  "); // teyit amaçlı verinin gelip gelmediğini kontrol etmek için kullanıyoruz

              return Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          // Buraya kullanıcının resmini yükleyebilirsiniz.
                          backgroundImage:
                              AssetImage('assets/images/user_image.png'),
                        ),
                        const SizedBox(width: 45.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ad: ${userDetail?.name}',
                              style: const TextStyle(fontSize: 27),
                            ),
                            Text('Soyad: ${userDetail?.surname}',
                                style: const TextStyle(fontSize: 27)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    Text(
                      'E-posta: ${userDetail?.email} ',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 10.0),
                    Text('Telefon Numarası: ${userDetail?.telefon} ',
                        style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 50.0),
                    ElevatedButton(
                      onPressed: () {
                        firebaseOut(context);
                      },
                      child: const Text('Çıkış Yap'),
                    ),
                  ],
                ),
              );
            });
  }

// data olmadığı zaman çalışacak kısım
  Padding _hasntData() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 3),
      child: const Column(
        children: [
          Icon(
            Icons.drafts_sharp,
            color: Colors.blue,
            size: 50,
          ),
          SizedBox(height: 20),
          Text(
            "Kayıtlı bir Veri yok ",
          ),
        ],
      ),
    );
  }

// Firebase çıkış işlemi için fonksiyonu
  Future firebaseOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then(
          (value) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SplashPage(),
            ),
          ),
        );
  }
}
