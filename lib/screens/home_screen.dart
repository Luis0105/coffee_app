import 'package:coffee_app/res/resorces_list.dart';
import 'package:coffee_app/screens/product_screen.dart';
import 'package:flutter/material.dart';

// Pantalla principal que muestra la búsqueda y listado de productos
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold: estructura principal de la pantalla
      backgroundColor: Color(0xFF1d2630), // Fondo de color oscuro
      body: Padding(
        padding:
            EdgeInsets.only(left: 30, right: 30, top: 40), // Espaciado interno
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila del ícono de menú y foto de perfil
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Menú (íconos circulares)
                Card(
                  // Card: contenedor con sombra
                  elevation: 20,
                  color: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    // Container: diseño del área del menú
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        circleRow(), // Fila de 2 pequeños círculos (íconos)
                        circleRow(),
                      ],
                    ),
                  ),
                ),
                // Imagen de perfil
                ClipRRect(
                  // ClipRRect: recorta las esquinas redondeadas
                  borderRadius: BorderRadius.circular(100),
                  child: Card(
                    child: Image.asset(
                      // Imagen circular del usuario
                      "assets/images/profile.jpg",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Texto de bienvenida
            Text(
              "Find the best",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text(
              "Coffee for you",
              style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(height: 25),

            // Barra de búsqueda
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.1),
              ),
              child: TextFormField(
                // TextFormField: campo de entrada de texto editable
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.coffee, color: Colors.white.withOpacity(0.3)),
                  border: InputBorder.none,
                  hintText: "Find Your Coffee...", // Texto sugerido
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.3), fontSize: 12),
                ),
              ),
            ),
            SizedBox(height: 25),

            // Categorías (estático para UI)
            SizedBox(
              height: 30,
              child: ListView.builder(
                // ListView.builder: lista horizontal dinámica
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // GestureDetector: detecta toques sin efecto visual
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        names[index],
                        style: TextStyle(
                          color: category[index]
                              ? Colors.orange
                              : Colors.white.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Productos principales
            Expanded(
              child: SingleChildScrollView(
                // SingleChildScrollView: permite hacer scroll
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lista horizontal de productos
                    SizedBox(
                      height: 270,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 9,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            // InkWell: detecta toques con animación de "ripple"
                            onTap: () {
                              Navigator.push(
                                // Al tocar, navega a ProductScreen
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen(index: index),
                                ),
                              );
                            },
                            child: Card(
                              // Card: tarjeta del producto
                              elevation: 20,
                              color: Colors.white.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.only(right: 20),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: 155,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Imagen del producto
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: 120,
                                        width: double.infinity,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Image(
                                                  image: images[index],
                                                  fit: BoxFit.cover),
                                            ),
                                            // Rating encima de la imagen
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                height: 25,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF1d2630)
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(Icons.star,
                                                        color: Colors.orange,
                                                        size: 14),
                                                    Text(
                                                        ratting[index]
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      with_[index],
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 15),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("\$",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Text(prices[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    // Texto "Special for you"
                    Text(
                      "Special for you",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(height: 20),

                    // Tarjetas especiales (CustomCard)
                    customCard(images[5]),
                    SizedBox(height: 20),
                    customCard(images[6]),
                    SizedBox(height: 20),
                    customCard(images[7]),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir los íconos circulares del menú
  Widget circleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleIcon(),
        circleIcon(),
      ],
    );
  }

  // Pequeño ícono circular
  Widget circleIcon() {
    return Icon(
      Icons.circle,
      color: Colors.white.withOpacity(0.5),
      size: 10,
    );
  }

  // Tarjeta personalizada especial (customCard)
  Widget customCard(AssetImage asset) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: double.infinity,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: asset, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "5 Coffee beans You\nMust Try!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
