import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himaskom_undip/widgets/auth_switcher.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'lainnya',
      channelName: 'Notifikasi',
      channelDescription: 'Notifikasi saat ada article / item terbaru',
      ledColor: Colors.white,
      playSound: true,
    ),
    NotificationChannel(
      channelKey: 'reminder',
      channelName: 'Pengingat',
      channelDescription: 'Notifikasi pengingat untuk event',
      ledColor: Colors.white,
      playSound: true,
    ),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'HIMASKOM UNDIP',
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('id', "ID")],
        home: const AuthSwitcher(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF171936),
            primary: const Color(0xFF171936),
          ),
          primaryColor: const Color(0xFF171936),
          disabledColor: const Color(0xFFB4B3BA),
          textTheme: GoogleFonts.interTextTheme(
            const TextTheme(
              headlineLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
              headlineMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
              headlineSmall: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
              labelMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 1.4,
              ),
              labelSmall: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0,
              ),
              bodyLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              bodyMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
