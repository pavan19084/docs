// import 'package:docs/home_admin.dart';
// import 'package:docs/home_user.dart';+
import 'package:docs/signin.dart';
import 'package:docs/signup.dart';
import 'package:docs/verify.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gznsrxsyvanpvmhdsqdz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd6bnNyeHN5dmFucHZtaGRzcWR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYzNzUzMjYsImV4cCI6MjAzMTk1MTMyNn0.uaPLMTnDPXv-i4lXXR-I2JkiuS5jPmJmvezOBF43EPM',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SignIn(),
      routes: {
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/emailverification': (context) => const EmailVerification(),
      },
    );
  }
}