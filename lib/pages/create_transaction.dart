import 'package:flutter/material.dart';

class CreateTransaction extends StatelessWidget {
  const CreateTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transascciones"),
      ),
      body: Center(
        child: Text(
          "Crear transaccion",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
