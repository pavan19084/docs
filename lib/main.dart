import 'package:docs/home_admin.dart';
import 'package:docs/home_user.dart';
import 'package:docs/signin.dart';
import 'package:docs/signup.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://arroyrfssmtyenpgycmk.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFycm95cmZzc210eWVucGd5Y21rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYzNjYyMDUsImV4cCI6MjAzMTk0MjIwNX0.4x_byWMV5LZAs7AxAKYtjs8h8eJXR-zcu4AnP3ivIts',
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SignIn(),
        '/login': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/home_user': (context) => const HomeUser(),
        '/home_admin': (context) => const HomeAdmin(),
      },
    );
  }
}
