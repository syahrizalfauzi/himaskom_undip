import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/login_pres.dart';

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

    _handleEmailChange(String newEmail) => _email.value = newEmail;
    _handlePasswordChange(String newPassword) => _password.value = newPassword;
    _validateNotEmpty(String? text) => (text == null)
        ? "Tidak boleh kosong"
        : text.isEmpty
            ? "Tidak boleh kosong"
            : null;
    _handleTapMasuk() {
      _formKey.currentState!.validate();
    }

    return Form(
      key: _formKey,
      child: LoginPagePresentational(
        onEmailChange: _handleEmailChange,
        onPasswordChange: _handlePasswordChange,
        emailValidator: _validateNotEmpty,
        passwordValidator: _validateNotEmpty,
        onTapMasuk: _handleTapMasuk,
        onTapForgot: () => debugPrint('Tap forgot'),
        onTapGoogle: () => debugPrint('Tap google'),
        onTapDaftar: () => debugPrint('Tap daftar'),
      ),
    );
  }
}
