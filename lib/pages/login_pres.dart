import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:himaskom_undip/widgets/custom_button.dart';
import 'package:himaskom_undip/widgets/custom_text_form_field.dart';

class LoginPagePresentational extends StatelessWidget {
  final bool isLoading;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function(String) validator;
  final Function() onTapMasuk;
  final Function() onTapForgot;
  final Function() onTapGoogle;
  final Function() onTapDaftar;

  const LoginPagePresentational({
    Key? key,
    required this.isLoading,
    required this.emailController,
    required this.passwordController,
    required this.onTapDaftar,
    required this.onTapGoogle,
    required this.onTapMasuk,
    required this.validator,
    required this.onTapForgot,
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
                      'Selamat Datang!',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Icon(Icons.person_outline, size: 24)
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Masukkan akun anda untuk melanjutkan',
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
                  validator: validator,
                  disabled: isLoading,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  filled: false,
                  labelText: 'Password',
                  hintText: "Masukkan password anda",
                  textInputType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: validator,
                  disabled: isLoading,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onTap: onTapMasuk,
                  text: "Masuk",
                  loading: isLoading,
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: isLoading ? null : onTapForgot,
                  child: Text(
                    'Lupa password?',
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 16,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: const Color(0xFFB4C9E9),
                          height: 1,
                          constraints: const BoxConstraints.expand(height: 1),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          Text(
                            'Atau masuk dengan',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          color: const Color(0xFFB4C9E9),
                          height: 1,
                          constraints: const BoxConstraints.expand(height: 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: isLoading ? null : onTapGoogle,
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFDFE8F6)),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/google.svg'),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: isLoading ? null : onTapDaftar,
                  child: Text(
                    'Anda belum punya akun? Daftar',
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
