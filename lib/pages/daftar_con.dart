import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/daftar_pres.dart';

class DaftarPageContainer extends StatefulHookWidget {
  const DaftarPageContainer({Key? key}) : super(key: key);

  @override
  State<DaftarPageContainer> createState() => _DaftarPageContainerState();
}

class _DaftarPageContainerState extends State<DaftarPageContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _nama = useState("");
    final _email = useState("");
    final _password = useState("");

    _handleNamaChange(String newNama) => _nama.value = newNama;
    _handleEmailChange(String newEmail) => _email.value = newEmail;
    _handlePasswordChange(String newPassword) => _password.value = newPassword;
    _validateNotEmpty(String? text) => (text == null)
        ? "Tidak boleh kosong"
        : text.isEmpty
            ? "Tidak boleh kosong"
            : null;
    _handleTapDaftar() {
      _formKey.currentState!.validate();
    }

    return Form(
      key: _formKey,
      child: DaftarPagePresentational(
        onNamaChange: _handleNamaChange,
        onEmailChange: _handleEmailChange,
        onPasswordChange: _handlePasswordChange,
        onTapDaftar: _handleTapDaftar,
        namaValidator: _validateNotEmpty,
        emailValidator: _validateNotEmpty,
        passwordValidator: _validateNotEmpty,
        onTapGoogle: () => debugPrint('Tap google'),
        onTapMasuk: () => debugPrint('Tap masuk'),
      ),
    );
  }
}
