import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'home_screen.dart';  // Importa la pantalla de inicio

// Clase LoginScreen: Pantalla donde el usuario se autentica
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(); // Controlador para el campo de correo
  final TextEditingController _passwordController = TextEditingController(); // Controlador para el campo de contraseña
  final AuthService _authService = AuthService(); // Instancia de AuthService para manejar la autenticación

  // Método para registrar al usuario
  Future<void> _register() async {
    // Llama al método de registro en AuthService
    User? user = await _authService.registerWithEmailPassword(
      _emailController.text, 
      _passwordController.text
    );

    if (user != null) {
      // Si el registro es exitoso, muestra un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registro exitoso')));
    } else {
      // Si ocurre un error, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al registrar')));
    }
  }

  // Método para iniciar sesión
  Future<void> _login() async {
    // Llama al método de inicio de sesión en AuthService
    User? user = await _authService.signInWithEmailPassword(
      _emailController.text, 
      _passwordController.text
    );

    if (user != null) {
      // Si el inicio de sesión es exitoso, redirige a la pantalla de inicio
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => HomeScreen())  // Redirige a HomeScreen
      );
    } else {
      // Si ocurre un error, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al iniciar sesión')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar sesión')), // Título de la pantalla
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaciado alrededor de los elementos
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centra los elementos en la pantalla
          children: [
            // Campo de texto para el correo electrónico
            TextField(
              controller: _emailController, 
              decoration: InputDecoration(labelText: 'Correo Electrónico')
            ),
            // Campo de texto para la contraseña
            TextField(
              controller: _passwordController, 
              obscureText: true,  // Oculta los caracteres de la contraseña
              decoration: InputDecoration(labelText: 'Contraseña')
            ),
            SizedBox(height: 20),  // Espaciado entre los elementos
            // Botón para iniciar sesión
            ElevatedButton(
              onPressed: _login, 
              child: Text("Iniciar sesión")
            ),
            SizedBox(height: 10),
            // Botón para registrarse
            ElevatedButton(
              onPressed: _register, 
              child: Text("Registrarse")
            ),
          ],
        ),
      ),
    );
  }
}