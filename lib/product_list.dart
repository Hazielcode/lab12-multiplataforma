import 'package:flutter/cupertino.dart';

import 'shared_styles.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const products = [
      _Product('Arroz Costeno', 'Abarrotes', 'S/ 4.80', '42 und.'),
      _Product('Aceite Vegetal', 'Cocina', 'S/ 9.50', '18 und.'),
      _Product('Leche Evaporada', 'Lacteos', 'S/ 3.90', '36 und.'),
      _Product('Galletas Soda', 'Snacks', 'S/ 2.20', '64 und.'),
      _Product('Detergente Bolsa', 'Limpieza', 'S/ 7.40', '21 und.'),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Listado Productos',
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Inventario visual de ejemplo.',
                    style: TextStyle(color: AppColors.deepTeal),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                CupertinoIcons.search,
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ...products.map((product) => _ProductTile(product: product)),
      ],
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final _Product product;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      border: Border.all(color: AppColors.lightBorder),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              CupertinoIcons.shopping_cart,
              color: AppColors.greenTeal,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: AppColors.darkText,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.category,
                  style: const TextStyle(color: AppColors.deepTeal),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                product.price,
                style: const TextStyle(
                  color: AppColors.danger,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                product.stock,
                style: const TextStyle(color: AppColors.greenTeal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Product {
  const _Product(this.name, this.category, this.price, this.stock);

  final String name;
  final String category;
  final String price;
  final String stock;
}
