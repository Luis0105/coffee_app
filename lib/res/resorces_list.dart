import 'package:flutter/material.dart';

// Listas de datos estáticos para usar en la app
// Sirven para alimentar la UI sin necesidad de una base de datos real

// Categorías de productos (si están seleccionadas o no)
var category = [true, false, false, false, false];

// Imágenes de los productos
var images = [
  const AssetImage("assets/images/s2.jpeg"),
  const AssetImage("assets/images/s4.jpeg"),
  const AssetImage("assets/images/s3.jpeg"),
  const AssetImage("assets/images/p1.jpeg"),
  const AssetImage("assets/images/p3.jpeg"),
  const AssetImage("assets/images/p4.jpeg"),
  const AssetImage("assets/images/p5.jpeg"),
  const AssetImage("assets/images/s1.jpeg"),
  const AssetImage("assets/images/p6.jpeg"),
  const AssetImage("assets/images/p2.jpeg"),
];

// Ratings (calificaciones) para cada producto
var ratting = [4.2, 4.5, 4.1, 4.0, 2.2, 3.2, 1.2, 3.2, 3.6, 4.8];

// Nombres de los productos
var names = [
  "Cappuccino",
  "Espresso",
  "Red Eye",
  "Black Eye",
  "Americano",
  "Long Black",
  "Machination",
  "Macchiato",
  "Double",
  "Frappe",
];

// Tipos de leche o acompañamiento
var with_ = [
  "with Oat Milk",
  "with Chocolate",
  "with White Milk",
  "with Oat Milk",
  "with Chocolate",
  "with White Milk",
  "with Oat Milk",
  "with Chocolate",
  "with White Milk",
  "with Oat Milk",
  "with Chocolate",
  "with White Milk",
];

// Precios de los productos (versión pequeña)
var prices = [
  "4.20",
  "5.10",
  "2.86",
  "7.56",
  "1.14",
  "6.72",
  "2.66",
  "7.17",
  "9.73",
  "5.66",
];

// Ratings, prefijos y precios para tamaños medianos y grandes
var mediumRating = [3.2, 2.3, 4.3, 1.9, 3.8, 1.8, 3.6, 2.7, 1.6, 4.5];
var largeRating = [3.2, 2.3, 1.8, 3.6, 2.7, 1.6, 4.5, 4.3, 1.9, 3.8];

var prefix = [
  "(5.753)",
  "(3.343)",
  "(4.653)",
  "(1.49)",
  "(4.353)",
  "(6.333)",
  "(2.743)",
  "(4.355)",
  "(2.443)",
  "(1.123)"
];
var prefixMedium = [
  "(2.443)",
  "(5.753)",
  "(3.343)",
  "(4.653)",
  "(6.333)",
  "(2.743)",
  "(4.355)",
  "(1.49)",
  "(4.353)",
  "(1.123)"
];
var prefixLarge = [
  "(4.653)",
  "(1.49)",
  "(2.743)",
  "(4.355)",
  "(5.753)",
  "(3.343)",
  "(2.443)",
  "(4.353)",
  "(6.333)",
  "(1.123)"
];

var mediumPrice = [
  "5.10",
  "6.20",
  "3.56",
  "4.77",
  "2.64",
  "7.25",
  "3.86",
  "8.56",
  "10.84",
  "6.98"
];
var largePrice = [
  "6.03",
  "7.21",
  "4.23",
  "5.45",
  "3.32",
  "8.44",
  "3.09",
  "9.87",
  "11.63",
  "7.57"
];
