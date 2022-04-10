import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/daftar_con.dart';
import 'package:himaskom_undip/pages/login_pres.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';

class LoginPageContainer extends StatefulHookWidget {
  const LoginPageContainer({Key? key}) : super(key: key);

  @override
  State<LoginPageContainer> createState() => _DaftarPageContainerState();
}

class _DaftarPageContainerState extends State<LoginPageContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _email = useState("");
    final _password = useState("");
    final _isLoading = useState(false);

    _handleEmailChange(String newEmail) => _email.value = newEmail;
    _handlePasswordChange(String newPassword) => _password.value = newPassword;
    _validateNotEmpty(String? text) => (text == null)
        ? "Tidak boleh kosong"
        : text.isEmpty
            ? "Tidak boleh kosong"
            : null;
    _handleTapMasuk() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _isLoading.value = true;
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.value,
          password: _password.value,
        );
      } on FirebaseAuthException catch (e) {
        String message = '';
        switch (e.code) {
          case 'user-disabled':
            message = 'Akun telah dimatikan';
            break;
          case 'invalid-email':
            message = 'Bentuk email tidak benar';
            break;
          case 'user-not-found':
            message = 'Akun tidak ditemukan';
            break;
          case 'wrong-password':
            message = 'Password salah';
            break;
          default:
            message = 'Gagal masuk, silahkan coba lagi';
            break;
        }
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(message));
      }
      _isLoading.value = false;
    }

    _handleTapDaftar() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const DaftarPageContainer()));
    }

    return Form(
      key: _formKey,
      child: LoginPagePresentational(
        isLoading: _isLoading.value,
        onEmailChange: _handleEmailChange,
        onPasswordChange: _handlePasswordChange,
        emailValidator: _validateNotEmpty,
        passwordValidator: _validateNotEmpty,
        onTapMasuk: _handleTapMasuk,
        onTapDaftar: _handleTapDaftar,
        onTapForgot: () => debugPrint('Tap forgot'),
        onTapGoogle: () => debugPrint('Tap google'),
      ),
    );
  }
}
