import 'dart:async'; // Para usar Timer
import 'package:coffee_app/main_screen.dart';
import 'package:flutter/material.dart';

// Pantalla de bienvenida (Splash) que se muestra unos segundos
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Timer: Ejecuta algo después de 3 segundos
      Navigator.pushReplacement(
          // Navega automáticamente al MainScreen y elimina el Splash
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold: Proporciona la estructura básica de una pantalla (fondo, AppBar, body, etc.)
      body: Container(
        // Container: Define un área rectangular con decoración
        height: MediaQuery.of(context)
            .size
            .height, // Toma toda la altura de pantalla
        width: MediaQuery.of(context).size.width, // Toma toda la anchura
        decoration: BoxDecoration(
          // BoxDecoration: Permite fondo de color o imagen
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/p6.jpeg"), // Imagen de fondo
            fit: BoxFit.cover,
            opacity: 0.9, // Opacidad de imagen
          ),
        ),
      ),
    );
  }
}
