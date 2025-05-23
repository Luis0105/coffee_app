import 'package:coffee_app/res/resorces_list.dart';
import 'package:flutter/material.dart';

// Pantalla de detalles de un producto de café seleccionado
class ProductScreen extends StatefulWidget {
  final int index; // Índice que representa qué producto se va a mostrar

  const ProductScreen({super.key, required this.index});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var s = true; // Controla si el tamaño Small está seleccionado
  var m = false; // Controla si Medium está seleccionado
  var l = false; // Controla si Large está seleccionado
  var xl = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF1d2630), // Fondo oscuro
        child: Column(
          children: [
            // Sección de imagen del producto
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Stack(
                    // Stack permite superponer widgets (imagen, botones, etc)
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: images[widget.index],
                          fit: BoxFit.cover, // La imagen llena el espacio
                        ),
                      ),
                      // Botón de regresar y botón de favorito
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Botón de regreso
                              InkWell(
                                onTap: () {
                                  Navigator.pop(
                                      context); // Vuelve a la pantalla anterior
                                },
                                child: _circleButton(
                                    Icons.arrow_back_ios_outlined),
                              ),
                              // Botón de "favorito"
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: _circleButton(Icons.favorite,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Sección inferior semitransparente con info del producto
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 30, right: 30, left: 30),
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFF1d2630).withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Nombre, tipo de café, calificación
                              _infoProductSection(),
                              // Iconos de café y leche + tamaño tostado
                              _infoIconsSection(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Sección de descripción
            Expanded(
              flex: 2,
              child: _descriptionSection(),
            ),
            // Sección inferior: precio y botón de compra
            Expanded(
              child: _bottomBuySection(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget que crea los botones circulares (para "regresar" y "favorito")
  Widget _circleButton(IconData icon, {Color color = Colors.white}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Color(0XFF1d2630),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color.withOpacity(0.5)),
    );
  }

  // Widget para la sección de nombre de producto, tipo de leche y calificación
  Widget _infoProductSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(names[widget.index],
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        Text(with_[widget.index],
            style:
                TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.5))),
        Row(
          children: [
            Icon(Icons.star, color: Colors.orange),
            SizedBox(width: 10),
            Text(
              s
                  ? ratting[widget.index].toString()
                  : m
                      ? mediumRating[widget.index].toString()
                      : largeRating[widget.index].toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(width: 10),
            Text(
              s
                  ? prefix[widget.index]
                  : m
                      ? prefixMedium[widget.index]
                      : prefixLarge[widget.index],
              style:
                  TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  // Widget para la sección de iconos de café y leche, más descripción del tamaño
  Widget _infoIconsSection() {
    return Column(
      children: [
        Row(
          children: [
            // Iconos que estan dentro de la app
            _iconContainer(Icons.coffee, "Prueba"),
            SizedBox(width: 15),
            _iconContainer(Icons.coffee, "Coffee"),
            SizedBox(width: 15),
            _iconContainer(Icons.water_drop_rounded, "Milk"),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            color: Color(0xFF1d2630),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              s
                  ? "Small Roasted"
                  : m
                      ? "Medium Roasted"
                      : "Large Roasted",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // Widget que crea un contenedor para iconos con texto debajo
  Widget _iconContainer(IconData icon, String label) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Color(0xFF1d2630), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.orange),
            Text(label, style: TextStyle(color: Colors.white.withOpacity(0.5))),
          ],
        ),
      ),
    );
  }

  // Widget para sección de descripción y tamaño seleccionable
  Widget _descriptionSection() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          SizedBox(height: 10),
          Text(
              "A Cappuccino is the perfect balance of espresso, steamed milk. This coffee is all about the structure.",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          SizedBox(height: 20),
          Text("Size",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botones para elegir el tamaño
              _sizeButton("XL", () {
                s = true;
                m = false;
                l = false;
                setState(() {});
              }, xl),
              _sizeButton("S", () {
                s = true;
                m = false;
                l = false;
                setState(() {});
              }, s),
              _sizeButton("M", () {
                s = false;
                m = true;
                l = false;
                setState(() {});
              }, m),
              _sizeButton("L", () {
                s = false;
                m = false;
                l = true;
                setState(() {});
              }, l),
            ],
          ),
        ],
      ),
    );
  }

  // Widget para botones de selección de tamaño
  Widget _sizeButton(String label, VoidCallback onTap, bool selected) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 70,
        decoration: BoxDecoration(
          color: selected ? Color(0xFF1d2630) : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: selected ? Colors.orange : Color(0xFF1d2630)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.orange : Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Widget para la sección de precio y botón "Buy Now"
  Widget _bottomBuySection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Price",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            SizedBox(height: 5),
            Row(
              children: [
                Text("\$",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(width: 10),
                Text(
                  s
                      ? prices[widget.index]
                      : m
                          ? mediumPrice[widget.index]
                          : largePrice[widget.index],
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 60,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text("Buy Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
