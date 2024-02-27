import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  Future<DataSnapshot?> getCollectionData() async {
    DatabaseReference usersRefence = FirebaseDatabase.instance.ref().child('users');

    DataSnapshot usersData = await usersRefence.once().then((snapshot) => snapshot.snapshot);
    return usersData;
  }
}
