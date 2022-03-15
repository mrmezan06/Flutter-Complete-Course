import 'package:flutter/material.dart';
import 'item.dart';

class Customer {
  Customer({
    required this.name,
    required this.imageProvider,
    List<Item>? items,
}) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  List<Item> items;

  String get FormattedTotalItemPrice {
    final totalPrice = items.fold<int>(0, (prev, item) => prev + item.totalPrice);
    return '\$${(totalPrice/100.0).toStringAsFixed(2)}';
  }
}