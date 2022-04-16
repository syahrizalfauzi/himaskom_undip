import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:himaskom_undip/pages/daftar_con.dart';
import 'package:himaskom_undip/pages/login_pres.dart';
import 'package:himaskom_undip/pages/lupapassword_con.dart';
import 'package:himaskom_undip/utils/set_notification_preferences.dart';
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
    final _isLoading = useState(false);
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

    _validator(String email) => email.isEmpty ? "Harus diisi" : null;
    _handleTapMasuk() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _isLoading.value = true;

      try {
        // if (_emailController.text != "admin@himaskomapp.com") {
        await setNotificationPreferences(true);
        // }
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
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

    _handleTapDaftar() => Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const DaftarPageContainer()));

    _handleTapForgot() => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const LupaPasswordPageContainer()));

    _handleTapGoogle() async {
      _isLoading.value = true;

      try {
        final googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          _isLoading.value = false;
          return;
        }

        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // if (user.user!.uid != "bBWpeRswZyPn5j0SKEiQ28Pz84W2") {
        await setNotificationPreferences(true);
        // }
        // final user =
        await FirebaseAuth.instance.signInWithCredential(credential);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(CustomSnackbar("Gagal masuk, silahkan coba lagi"));
      }
      _isLoading.value = false;
    }

    return Form(
      key: _formKey,
      child: LoginPagePresentational(
        isLoading: _isLoading.value,
        emailController: _emailController,
        passwordController: _passwordController,
        validator: _validator,
        onTapMasuk: _handleTapMasuk,
        onTapDaftar: _handleTapDaftar,
        onTapForgot: _handleTapForgot,
        onTapGoogle: _handleTapGoogle,
      ),
    );
  }
}
