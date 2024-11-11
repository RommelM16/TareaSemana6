import 'package:firebase_flutter/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

// Clase HomeScreen: Pantalla que se muestra después del inicio de sesión exitoso
class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService(); // Instancia de AuthService

  // Método para cerrar sesión
  Future<void> _signOut(BuildContext context) async {
    await _authService.signOut();  // Llama al método de cierre de sesión
    // Redirige al usuario a la pantalla de inicio de sesión después de cerrar sesión
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => LoginScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla de Inicio')), // Título de la pantalla
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signOut(context),  // Llama al método _signOut al presionar el botón
          child: Text('Cerrar sesión'),
        ),
      ),
    );
  }
}