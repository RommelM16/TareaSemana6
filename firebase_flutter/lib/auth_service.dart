import 'package:firebase_auth/firebase_auth.dart'; // Importa la librería de Firebase Authentication

// Clase AuthService: Maneja la autenticación de usuarios
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;  // Instancia de FirebaseAuth

  // Método para registrar a un usuario con email y contraseña
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      // Llama a la API de Firebase para crear un nuevo usuario
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      return userCredential.user; // Retorna el usuario creado
    } catch (e) {
      print("Error al registrar: $e"); // Imprime el error en caso de que falle el registro
      return null; // Retorna null si ocurre un error
    }
  }

  // Método para iniciar sesión con email y contraseña
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      // Llama a la API de Firebase para iniciar sesión con el correo y la contraseña proporcionados
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return userCredential.user; // Retorna el usuario autenticado
    } catch (e) {
      print("Error al iniciar sesión: $e"); // Imprime el error en caso de que falle el inicio de sesión
      return null; // Retorna null si ocurre un error
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();  // Llama a la función de Firebase para cerrar sesión
  }

  // Método para obtener el usuario actual
  User? getCurrentUser() {
    return _auth.currentUser;  // Retorna el usuario que está autenticado actualmente
  }
}
