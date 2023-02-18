import 'dart:convert';
import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
class SignWith{
static Future<void> google() async {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // TODO - null accessToken show error
    // Login Fails what to do
    if (googleAuth.accessToken != '') {
      var accessToken = googleAuth.accessToken;
      String your_auth_server_url =
          'https://africanap.000webhostapp.com/african_ap/google_sign_in.php'; // https endpoint
      var response = await http.post(Uri.parse(your_auth_server_url),
          body: {'access_token': accessToken, 'email': googleUser.email});

      final responseData = jsonDecode(response.body);
      var welcomeText = (responseData['error'])
          ? "Google Login Failed"
          : "Welcome ${googleUser.displayName}";
          // Toast.show(welcomeText);
    }
  } catch (error) {
    print("L'erreur est ::: $error");
    // TODO - Error what to do now
  }
}
}