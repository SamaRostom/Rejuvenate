import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String ID;
  String email;
  String fname;
  String lname;
  String gender;
  String phone;
  DateTime birth;
  String role;
  UserModel(
    this.ID,
    this.email,
    this.fname,
    this.lname,
    this.gender,
    this.phone,
    this.birth,
    this.role,
  );
  int compareTo(UserModel other) => email.compareTo(other.email);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot, String ID) {
    return UserModel(
        ID,
        snapshot.get('email'),
        snapshot.get('fname'),
        snapshot.get('lname'),
        snapshot.get('gender'),
        snapshot.get('phone'),
        (snapshot.get('birth') as Timestamp).toDate(),
        snapshot.get('role'));
  }
}
