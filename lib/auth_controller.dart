import 'package:docs/supabase.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:docs/routes_name.dart'; // Ensure you import your routes

class AuthController extends GetxController {
  RxBool signinloading = false.obs;
  RxBool signuploading = false.obs;

  final AuthApi authApi;

  AuthController({required this.authApi});

  void login(String email, String password) async {
    signinloading.value = true;
    final response = await authApi.login_method(email, password);
    if (response.error == null) {
      Get.snackbar("Success", "Logged in successfully");
    } else {
      Get.snackbar("Error", response.error!.message);
    }
    signinloading.value = false;
  }

  Future<void> signup(String email, String password) async {
    signuploading.value = true;
    final response = await authApi.signup_method(email, password);
    signuploading.value = false;
    if (response.error == null) {
      Get.snackbar(
          "Success", "Signed up successfully. Please verify your email.");
      Get.toNamed(RoutesName.verify);
    } else {
      Get.snackbar("Error", response.error!.message);
    }
  }

  Future<void> logout() async {
    await authApi.logout_method();
    Get.offAllNamed(RoutesName.signin); // Navigate to the sign-in page
  }

  Future<void> resetPassword(String email) async {
    final response = await authApi.resetPassword_method(email);
    if (response.error == null) {
      Get.snackbar("Success", "Password reset link sent to your email.");
    } else {
      Get.snackbar("Error", response.error!.message);
    }
  }
}

class AuthApi {
  final SupabaseClient supabaseClient;

  AuthApi({required this.supabaseClient});

  Future<GotrueSessionResponse> login_method(
      String email, String password) async {
    final response =
        await supabaseClient.auth.signIn(email: email, password: password);
    return response;
  }

  Future<GotrueSessionResponse> signup_method(
      String email, String password) async {
    final response = await supabaseClient.auth.signUp(email, password);
    return response;
  }

  Future<void> logout_method() async {
    await supabaseClient.auth.signOut();
    StorageService.clearUserSession();
  }

  Future<GotrueJsonResponse> resetPassword_method(String email) async {
    final response = await supabaseClient.auth.api.resetPasswordForEmail(email);
    return response;
  }
}
