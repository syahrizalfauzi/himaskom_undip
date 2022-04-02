import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/daftar.pres.dart';

class DaftarPageContainer extends StatefulHookWidget {
  const DaftarPageContainer({Key? key}) : super(key: key);

  @override
  State<DaftarPageContainer> createState() => _DaftarPageContainerState();
}

class _DaftarPageContainerState extends State<DaftarPageContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nama = useState("");
    final email = useState("");
    final password = useState("");

    handleNamaChange(String newNama) => nama.value = newNama;
    handleEmailChange(String newEmail) => email.value = newEmail;
    handlePasswordChange(String newPassword) => password.value = newPassword;
    validateNotEmpty(String? text) => (text == null)
        ? "Tidak boleh kosong"
        : text.isEmpty
            ? "Tidak boleh kosong"
            : null;
    handleTapDaftar() {
      _formKey.currentState!.validate();
    }

    return Form(
      key: _formKey,
      child: DaftarPagePresentational(
        onNamaChange: handleNamaChange,
        onEmailChange: handleEmailChange,
        onPasswordChange: handlePasswordChange,
        onTapDaftar: handleTapDaftar,
        namaValidator: validateNotEmpty,
        emailValidator: validateNotEmpty,
        passwordValidator: validateNotEmpty,
        onTapGoogle: () => debugPrint('Tap google'),
        onTapMasuk: () => debugPrint('Tap masuk'),
      ),
    );
  }
}
