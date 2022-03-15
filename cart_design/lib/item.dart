import 'package:flutter/material.dart';

@immutable
class Item{
  const Item({
    required this.totalPrice,
    required this.name,
    required this.uid,
    required this.imageProvider,
});

  final int totalPrice;
  final String name;
  final String uid;
  final ImageProvider imageProvider;

  String get formattedTotalItemPrice =>
      '\$${(totalPrice/100.0).toStringAsFixed(2)}';

}