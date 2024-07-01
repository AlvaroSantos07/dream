import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../buttons/iconButton.dart';
import '../buttons/rectangleButton.dart';
import "../buttons/textButton.dart";

class LoginSpace extends StatefulWidget {
  const LoginSpace({super.key});

  @override
  State<LoginSpace> createState() => _LoginSpaceState();
}

class _LoginSpaceState extends State<LoginSpace> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(120),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            _logoLogin(),
            _form(emailController, passwordController),
            RectangleButton(
              onTap: () => _login(emailController, passwordController, context),
              color: Colors.red,
              title: "Entrar",
            ),
            _googleAndFace(),
            SizedBox(height: 30),
            _registerLink(context),
          ],
        ),
      ),
    );
  }

  Widget _form(TextEditingController email, TextEditingController senha) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          _textInfo(
            "Username",
            Icon(
              Icons.account_circle_outlined,
              color: Colors.red,
            ),
          ),
          TextField(
            controller: email,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              labelText: 'Digite seu nome de Usuário',
              labelStyle: TextStyle(color: Colors.black),
              hoverColor: Colors.blue.shade900,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 10),
          _textInfo(
            "Password",
            Icon(
              Icons.lock_open_sharp,
              color: Colors.red,
            ),
          ),
          TextField(
            controller: senha,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Digite sua senha',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hoverColor: Colors.blue[900],
              iconColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textInfo(String text, Widget anyIcon) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 8),
      child: Row(
        children: [
          anyIcon,
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _googleAndFace() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoxButton(
            child: Image(image: AssetImage("assets/googleLogo.png")),
            onTap: () => _signInWithGoogle(context),
          ),
          SizedBox(width: 10),
          BoxButton(
            child: Image(image: AssetImage("assets/FaceLogo.png")),
            onTap: () => _signInWithFacebook(context),
          ),
        ],
      ),
    );
  }

  Widget _logoLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Image(
              image: AssetImage("assets/logo.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerLink(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/RegisterPage"),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Text(
          "Não tem uma conta? \nRegistre-se",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<void> _login(TextEditingController emailController, TextEditingController passwordController, BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushNamed(context, "/MainPage");
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        message = "Usuário ou senha incorretos";
      } else {
        message = "Erro ao fazer login: ${e.message}";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao fazer login: Falha na Internet"), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamed(context, "/MainPage");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao fazer login com Google: ${e.toString()}"), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken? accessToken = result.accessToken;
      if (accessToken != null) {
        final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushNamed(context, "/MainPage");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao obter o token de acesso do Facebook"), backgroundColor: Colors.red),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao fazer login com Facebook: ${result.message}"), backgroundColor: Colors.red),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Erro ao fazer login com Facebook: ${e.toString()}"), backgroundColor: Colors.red),
    );
  }
}
}