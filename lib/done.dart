// done.dart

import 'package:docs/supabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart'; // Import the AuthController

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the AuthController if it's not already done
    final AuthController authController = Get.put(AuthController(
        authApi: AuthApi(supabaseClient: SupabaseService.supabase)));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout(); // Call the logout method
            },
          )
        ],
      ),
      body: const Center(
        child: Text("Welcome to the Dashboard!"),
      ),
    );
  }
}
