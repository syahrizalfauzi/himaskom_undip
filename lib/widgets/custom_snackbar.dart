import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Snackbar kustom untuk menampilkan pesan jika gagal log in atau lainnya
// ignore: non_constant_identifier_names
SnackBar CustomSnackbar(String message) {
  return SnackBar(content: Text(message, style: GoogleFonts.inter()));
}
