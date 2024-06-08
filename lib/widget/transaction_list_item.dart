import 'package:flutter/material.dart';
import 'package:proyecto_flutter/common/transaction.dart';
import 'package:timeago/timeago.dart' as timeago;

String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);

  print("Hace ${difference.inHours} horas");
  //return timeago.format(now.subtract(difference));
  if (difference.inHours < 72) {
    return timeago.format(now.subtract(difference));
  }

  return date.toLocal().toString();
}

class TransactionItemList extends StatelessWidget {
  final Transaction transaction;
  const TransactionItemList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.filled(
        child: ListTile(
      subtitleTextStyle: theme.textTheme.labelMedium,
      titleTextStyle: theme.textTheme.titleMedium,
      textColor: theme.colorScheme.onSecondaryContainer,
      iconColor: theme.colorScheme.error,
      onTap: () {},
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.red.shade200, borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Icon(size: 24, Icons.favorite_border),
        ),
      ),
      title: Text(
        transaction.title,
      ),
      subtitle: Text(
        formatDate(transaction.date),
      ),
      trailing: Text(
        transaction.amount.toStringAsFixed(2),
        style: theme.textTheme.titleMedium?.apply(fontSizeFactor: 1.2),
      ),
    ));
  }
}
