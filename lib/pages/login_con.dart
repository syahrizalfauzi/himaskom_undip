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
    final email = useState("");
    final password = useState("");

    handleEmailChange(String newEmail) => email.value = newEmail;
    handlePasswordChange(String newPassword) => password.value = newPassword;
    validateNotEmpty(String? text) => (text == null)
        ? "Tidak boleh kosong"
        : text.isEmpty
            ? "Tidak boleh kosong"
            : null;
    handleTapMasuk() {
      _formKey.currentState!.validate();
    }

    return Form(
      key: _formKey,
      child: LoginPagePresentational(
        onEmailChange: handleEmailChange,
        onPasswordChange: handlePasswordChange,
        emailValidator: validateNotEmpty,
        passwordValidator: validateNotEmpty,
        onTapMasuk: handleTapMasuk,
        onTapForgot: () => debugPrint('Tap forgot'),
        onTapGoogle: () => debugPrint('Tap google'),
        onTapDaftar: () => debugPrint('Tap daftar'),
      ),
    );
  }
}
