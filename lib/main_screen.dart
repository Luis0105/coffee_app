import 'package:coffee_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

// Pantalla principal donde eliges Home, Shop, Favourite, Notifications
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenkState();
}

class _MainScreenkState extends State<MainScreen> {
  int index = 0; // Guarda qué ícono de navegación está seleccionado

  // Lista de pantallas disponibles
  final List<Widget> pages = [
    HomeScreen(), // Página principal de productos
    Center(
        child: Text("Shop Screen",
            style:
                TextStyle(color: Colors.black))), // Pantalla vacía para tienda
    Center(
        child: Text("Favourite Screen",
            style:
                TextStyle(color: Colors.black))), // Pantalla vacía de favoritos
    Center(
        child: Text("Notifications Screen",
            style:
                TextStyle(color: Colors.black))), // Pantalla de notificaciones
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index], // Muestra la página dependiendo del índice
      bottomNavigationBar: BottomNavigationBar(
        // BottomNavigationBar: Barra de navegación inferior
        showSelectedLabels: false,
        currentIndex: index, // Marca cuál ícono está activo
        onTap: (value) {
          // Cambia el índice cuando el usuario toca un ícono
          setState(() {
            index = value;
          });
        },
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed, // Barra fija (no flotante)
        backgroundColor: Color(0xFF1d2630),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home,
                color:
                    index == 0 ? Colors.orange : Colors.grey.withOpacity(0.6)),
          ),
          BottomNavigationBarItem(
            label: "Shop",
            icon: Icon(Icons.shopify,
                color:
                    index == 1 ? Colors.orange : Colors.grey.withOpacity(0.6)),
          ),
          BottomNavigationBarItem(
            label: "Favourite",
            icon: Icon(Icons.favorite,
                color:
                    index == 2 ? Colors.orange : Colors.grey.withOpacity(0.6)),
          ),
          BottomNavigationBarItem(
            label: "Notifications",
            icon: Icon(Icons.notification_add,
                color:
                    index == 3 ? Colors.orange : Colors.grey.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
