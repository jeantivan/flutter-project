import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            KeyItem(
              onTap: () {},
              child: Text("1", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: Text("2", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: Text("3", style: theme.textTheme.titleMedium),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            KeyItem(
              onTap: () {},
              child: Text("4", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: Text("5", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: Text("6", style: theme.textTheme.titleMedium),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            KeyItem(
              onTap: () {},
              child: Text("7", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: Text("8", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: Text("9", style: theme.textTheme.titleMedium),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            KeyItem(
              onTap: () {},
              child: Text(".", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: Text("0", style: theme.textTheme.titleMedium),
            ),
            const SizedBox(
              width: 4,
            ),
            KeyItem(
              onTap: () {},
              child: const Icon(Icons.backspace_outlined, size: 20),
            )
          ],
        ),
      ],
    );
    /* return GridView.count(
      crossAxisCount: 3,
      children: [buildKey(context, child: Text("1"))],
    ); */
  }

  /* Widget buildKey(BuildContext context, {required Widget child}) {
    final buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8), // Cambia el valor para ajustar el radio
          ),
        ));
    return Expanded(
      child: SizedBox(
        height: 60,
        child: FilledButton.tonal(
            onPressed: () {}, style: buttonStyle, child: child),
      ),
    );
  } */
}

class KeyItem extends StatelessWidget {
  static final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8), // Cambia el valor para ajustar el radio
        ),
      ));

  final Widget child;
  final Function onTap;
  const KeyItem({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: FilledButton.tonal(
            onPressed: () {}, style: buttonStyle, child: child),
      ),
    );
  }
}
