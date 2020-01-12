import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection("userDetails");
      

  Future updateData({String passyear, String studentno, String name}) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'studentNumber': studentno,
      'passYear': passyear,
    });
  }
}
