import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:himaskom_undip/pages/daftar_pres.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';

class DaftarPageContainer extends StatefulHookWidget {
  const DaftarPageContainer({Key? key}) : super(key: key);

  @override
  State<DaftarPageContainer> createState() => _DaftarPageContainerState();
}

class _DaftarPageContainerState extends State<DaftarPageContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(false);
    final _namaController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

    _validator(String email) => email.isEmpty ? "Harus diisi" : null;
    _handleTapDaftar() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _isLoading.value = true;
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        credential.user!.updateDisplayName(_namaController.text);
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        String message = '';
        switch (e.code) {
          case 'email-already-in-use':
            message = 'Email sudah digunakan';
            break;
          case 'invalid-email':
            message = 'Bentuk email tidak benar';
            break;
          case 'weak-password':
            message = 'Password terlalu lemah';
            break;
          default:
            message = 'Gagal mendaftarkan user, silahkan coba lagi';
            debugPrint(e.toString());
            break;
        }
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(message));
      }
      _isLoading.value = false;
    }

    _handleTapGoogle() async {
      _isLoading.value = true;

      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        _isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      _isLoading.value = false;

      Navigator.of(context).pop();
    }

    _handleTapMasuk() {
      Navigator.of(context).pop();
    }

    return Form(
      key: _formKey,
      child: DaftarPagePresentational(
        isLoading: _isLoading.value,
        emailController: _emailController,
        namaController: _namaController,
        passwordController: _passwordController,
        validator: _validator,
        onTapDaftar: _handleTapDaftar,
        onTapGoogle: _handleTapGoogle,
        onTapMasuk: _handleTapMasuk,
      ),
    );
  }
}
