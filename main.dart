import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:music/provider/audio_provider.dart';
import 'package:music/provider/playlist_provider.dart';
import 'package:music/pages/homepage.dart';
import 'package:music/themes/light_mode.dart';
import 'package:music/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
        ChangeNotifierProvider(create: (context) => AudioProvider())
      ],
      child: MaterialApp(
        home: const Homepage(),
        debugShowCheckedModeBanner: false,
        theme: lightmode,
      ),
    );
  }
}
