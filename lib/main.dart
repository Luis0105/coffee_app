import 'package:coffee_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

// Función principal de arranque de la app
void main() {
  runApp(MyApp()); // runApp inicializa el widget principal
}

// Widget principal de toda la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp: Crea toda la estructura base de una app de Flutter (temas, rutas, idioma, etc.)
      debugShowCheckedModeBanner: false, // Quita la etiqueta "Debug"
      title: "Coffee App", // Nombre de la aplicación
      home: SplashScreen(), // Pantalla inicial de bienvenida
    );
  }
}
