import 'package:flutter/material.dart';
import '../utils/constants.dart' as val;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

void error(String t, String m) {
  val.snackBar = SnackBar(
    // need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: t,
      message: m,
      color: Colors.cyan,
      // change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );
}