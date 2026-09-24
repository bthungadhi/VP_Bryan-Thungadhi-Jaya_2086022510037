import 'package:flutter/material.dart';
import 'quantity_stepper.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.promo,
    required this.qty,
    required this.onDecrement,
    required this.onIncrement,
  });

  final String name;
  final int price;
  final bool promo;
  final int qty;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (promo) const SizedBox(width: 6),
                      if (promo)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'PROMO',
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onTertiaryContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Rp $price',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            QuantityStepper(
              qty: qty,
              onDecrement: onDecrement,
              onIncrement: onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}