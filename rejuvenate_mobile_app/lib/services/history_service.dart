import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryService {
  static Future<Map<String, dynamic>?> gethistory(String id) {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final doctorRef = db.collection("doctors").doc(id);
    final result = doctorRef.get();
    // return result.then();
    return result.then((value) {
      print(value);
      return value.data();
    });
  }

  static Future<Map<String, dynamic>?> getpatient(String id) {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final patientsRef = db.collection("users").doc(id);
    final result = patientsRef.get();
    // return result.then();
    return result.then((value) {
      print(value);
      return value.data();
    });
  }
}
