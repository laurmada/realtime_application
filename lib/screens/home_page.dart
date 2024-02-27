import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realtime_application/services/firebase_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late FirebaseService firebaseService;

String databaseData = '';

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    firebaseService = Modular.get<FirebaseService>();
    loadDataBaseData();
  }

  void loadDataBaseData() async {
    try {
      DataSnapshot? snapshot = await firebaseService.getCollectionData();
      if (snapshot == null) {
        print('no data available');
      }
      setState(() {
        databaseData = snapshot!.value.toString();
      });
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          children: [
            databaseData.isNotEmpty
                ? Text(
                    databaseData,
                    style: const TextStyle(color: Colors.black),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
