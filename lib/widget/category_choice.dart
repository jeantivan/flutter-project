import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/common/category.dart';
import 'package:proyecto_flutter/providers/create_transaction_provider.dart';

class CategoryChoice extends StatelessWidget {
  final Category category;
  const CategoryChoice({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final selectedCategory =
        Provider.of<CreateTransactionProvider>(context, listen: true).category;
    return ChoiceChip(
      selected: category.name == selectedCategory?.name,
      onSelected: (_) {
        Provider.of<CreateTransactionProvider>(context, listen: false)
            .selectCategory(category);
      },
      label: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          Text(category.name),
          Icon(
            getCategoryIcon(category),
            color: getCategoryColor(category),
            size: 18,
          )
        ],
      ),
    );
  }

  IconData getCategoryIcon(Category category) {
    switch (category) {
      case Category.health:
        return Icons.healing_rounded;
      case Category.home:
        return Icons.home_rounded;
      case Category.entertainment:
        return Icons.videogame_asset_rounded;
      case Category.coffee:
        return Icons.coffee_rounded;
      case Category.education:
        return Icons.school_rounded;
      case Category.food:
        return Icons.restaurant_rounded;
      case Category.family:
        return Icons.family_restroom_rounded;
      case Category.transport:
        return Icons.train_rounded;
      case Category.gift:
        return Icons.redeem_rounded;
      default:
        return Icons.help_rounded;
    }
  }

  Color getCategoryColor(Category category) {
    switch (category) {
      case Category.health:
        return const Color.fromRGBO(34, 139, 34, 1.0); // Forest Green
      case Category.home:
        return const Color.fromRGBO(70, 130, 180, 1.0); // Steel Blue
      case Category.coffee:
        return const Color.fromRGBO(139, 69, 19, 1.0); // Saddle Brown
      case Category.education:
        return const Color.fromRGBO(255, 215, 0, 1.0); // Gold
      case Category.gift:
        return const Color.fromRGBO(255, 105, 180, 1.0); // Hot Pink
      case Category.food:
        return const Color.fromRGBO(255, 99, 71, 1.0); // Tomato
      case Category.family:
        return const Color.fromRGBO(0, 191, 255, 1.0); // Deep Sky Blue
      case Category.transport:
        return const Color.fromRGBO(0, 0, 128, 1.0); // Navy
      case Category.entertainment:
        return const Color.fromRGBO(255, 69, 0, 1.0); // Orange Red
      case Category.other:
        return const Color.fromRGBO(128, 128, 128, 1.0); // Gray
      default:
        return const Color.fromRGBO(0, 0, 0, 1.0); // Default to Black
    }
  }
}
