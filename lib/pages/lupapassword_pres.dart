import 'package:flutter/material.dart';
import 'package:himaskom_undip/widgets/custom_button.dart';
import 'package:himaskom_undip/widgets/custom_text_form_field.dart';

class LupaPasswordPagePresentational extends StatelessWidget {
  final bool isLoading;
  final TextEditingController emailController;
  final String? Function(String) emailValidator;
  final Function() onTapKirim;
  final Function() onTapKembali;

  const LupaPasswordPagePresentational({
    Key? key,
    required this.isLoading,
    required this.emailController,
    required this.emailValidator,
    required this.onTapKirim,
    required this.onTapKembali,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          padding: const EdgeInsets.all(24),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lupa Password?',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Icon(Icons.person_outline, size: 24)
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Jangan khawatir, masukkan alamat email yang anda gunakan.\nAnda akan mendapatkan link untuk membuat password baru',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 48),
                CustomTextFormField(
                  filled: false,
                  labelText: 'Alamat Email',
                  hintText: "Masukkan email anda",
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: emailValidator,
                  disabled: isLoading,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onTap: onTapKirim,
                  text: "Kirim",
                  loading: isLoading,
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: isLoading ? null : onTapKembali,
                  child: Text(
                    'Kembali',
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
