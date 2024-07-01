import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _form(usernameController, emailController, passwordController),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => _register(usernameController, emailController, passwordController, context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)

                  )
                  ,child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(child: Text("Registrar")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _form(TextEditingController username, TextEditingController email, TextEditingController password) {
  return Column(
    children: [
      TextField(
        controller: username,
        decoration: InputDecoration(
          labelText: 'Nome de Usuário',
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        controller: email,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        controller: password,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Senha',
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}

Future<void> _register(TextEditingController usernameController, TextEditingController emailController, TextEditingController passwordController, BuildContext context) async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    // Você pode adicionar o nome de usuário ao perfil do usuário aqui, se necessário
    // userCredential.user?.updateDisplayName(usernameController.text.trim());

    Navigator.pushNamed(context, "/MainPage");
  } on FirebaseAuthException catch (e) {
    String message;
    if (e.code == 'email-already-in-use') {
      message = "O email já está em uso.";
    } else if (e.code == 'weak-password') {
      message = "A senha é muito fraca.";
    } else {
      message = "Erro ao registrar: ${e.message}";
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Erro ao registrar: Falha na Internet"), backgroundColor: Colors.red),
    );
  }
}
