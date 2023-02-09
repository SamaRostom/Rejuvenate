// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String fname;
  String lname;
  String gender;
  String phone;
  String birth;
  String role;
  UserModel(
    this.email,
    this.fname,
    this.lname,
    this.gender,
    this.phone,
    this.birth,
    this.role,
  );
  int compareTo(UserModel other) => email.compareTo(other.email);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(snapshot.get('email'), snapshot.get('fname'),snapshot.get('lname'),snapshot.get('phone'),snapshot.get('gender'),snapshot.get('birth'),snapshot.get('role'));
  }
}

