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
        context.watch<CreateTransactionProvider>().category;
    final theme = Theme.of(context);
    return ChoiceChip(
      /* selected: category.name === selectedCategory?.name
        onSelected: (Category value) => context.watch<CreateTransactionProvider>().selectCategory(value),
         */
      label: Text(category.name),
      avatar: Icon(getCategoryIcon(category)),
    );
  }

  IconData getCategoryIcon(Category category) {
    switch (category) {
      case Category.health:
        return Icons.healing;
      case Category.home:
        return Icons.home_outlined;
      case Category.entertainment:
        return Icons.videogame_asset_outlined;
      case Category.coffee:
        return Icons.coffee_outlined;
      case Category.education:
        return Icons.school_outlined;
      case Category.food:
        return Icons.restaurant_outlined;
      case Category.family:
        return Icons.family_restroom_outlined;
      case Category.transport:
        return Icons.train_outlined;
      case Category.gift:
        return Icons.redeem_outlined;
      default:
        return Icons.question_mark_outlined;
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
