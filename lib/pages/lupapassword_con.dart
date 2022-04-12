import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/lupapassword_pres.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';

class LupaPasswordPageContainer extends StatefulHookWidget {
  const LupaPasswordPageContainer({Key? key}) : super(key: key);

  @override
  State<LupaPasswordPageContainer> createState() =>
      _LupaPasswordPageContainerState();
}

class _LupaPasswordPageContainerState extends State<LupaPasswordPageContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(false);
    final _emailController = useTextEditingController();

    _emailValidator(String email) => email.isEmpty ? "Harus diisi" : null;
    _handleTapKirim() async {
      if (!_formKey.currentState!.validate()) return;

      _isLoading.value = true;
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text);
        ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackbar('Email terkirim, silahkan cek inbox email anda'));
      } on FirebaseAuthException catch (e) {
        String message;
        switch (e.code) {
          case 'auth/invalid-email':
            message = 'Bentuk email tidak benar';
            break;
          case 'auth/user-not-found':
            message = 'Akun tidak ditemukan';
            break;
          default:
            message = 'Gagal mengirim email, silahkan coba lagi';
            break;
        }
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(message));
      }
      _isLoading.value = false;
    }

    _handleTapKembali() => Navigator.of(context).pop();

    return Form(
      key: _formKey,
      child: LupaPasswordPagePresentational(
        isLoading: _isLoading.value,
        emailController: _emailController,
        emailValidator: _emailValidator,
        onTapKirim: _handleTapKirim,
        onTapKembali: _handleTapKembali,
      ),
    );
  }
}
