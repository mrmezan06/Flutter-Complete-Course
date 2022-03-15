import 'dart:html';

import 'package:flutter/material.dart';

import 'customer.dart';

class CustomerCart extends StatelessWidget {
  const CustomerCart({
    Key? key,
    required this.customer,
    this.highlighted = false,
    this.hasItems = false,
  }) : super(key: key);

  final Customer customer;
  final bool highlighted;
  final bool hasItems;

  @override
  Widget build(BuildContext context) {

    final textColor = highlighted ? Colors.white : Colors.black;
    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted? 8.0 : 4.0,
        borderRadius: BorderRadius.circular(22.0),
        color: highlighted?  const Color(0xFFF64209) : Colors.white,
        child:  Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Image(
                    image: customer.imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                customer.name,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: textColor,
                  fontWeight:
                  hasItems ? FontWeight.normal : FontWeight.bold,
                ),
              ),
             Visibility(
                 visible: hasItems,
                 maintainState: true,
                 maintainAnimation: true,
                 maintainSize: true,
                 child: Column(
                   children: [
                     const SizedBox(height: 4.0,),
                     Text(customer.FormattedTotalItemPrice,
                     style: Theme.of(context).textTheme.caption!.copyWith(
                       color: textColor,
                       fontSize: 16.0,
                       fontWeight: FontWeight.bold,
                     ),
                     ),
                     const SizedBox(height: 4.0),
                     Text(
                       '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
                       style: Theme.of(context).textTheme.subtitle1!.copyWith(
                         color: textColor,
                         fontSize: 12.0,
                       ),
                     ),
                   ],
                 ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
