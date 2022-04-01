import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:himaskom_undip/widgets/custombutton.dart';
import 'package:himaskom_undip/widgets/customtextformfield.dart';

class DaftarPagePresentational extends StatelessWidget {
  const DaftarPagePresentational({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
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
                'Mulai dapatkan informasi terbaru dari\nTeknik Komputer',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 48),
              const CustomTextFormField(
                labelText: 'Nama Lengkap',
                hintText: "Masukkan nama lengkap",
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24),
              const CustomTextFormField(
                labelText: 'Alamat Email',
                hintText: "Masukkan email anda",
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24),
              const CustomTextFormField(
                labelText: 'Password',
                hintText: "Masukkan password anda",
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              CustomButton(
                onTap: () {},
                text: "Masuk",
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
                          'Atau daftar dengan',
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
                  onTap: () {},
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
              Text(
                'Sudah punya akun? Masuk',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
