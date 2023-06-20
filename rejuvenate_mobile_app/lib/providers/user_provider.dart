import '../models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newUserDataProivder = StateProvider<UserModel?>((ref) {
  return null;
});

final patientDataProivder = StateProvider<Map<String,dynamic>?>((ref) {
  return null;
});

final patientIDProivder = StateProvider<String?>((ref) {
  return "";
});

final selectedAnswersProvider = StateProvider<List?>((ref) {
  return null;
});

