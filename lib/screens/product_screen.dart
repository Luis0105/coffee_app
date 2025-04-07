import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final int index;

  const ProductScreen({super.key, required this.index});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
