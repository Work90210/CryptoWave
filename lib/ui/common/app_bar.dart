import 'package:flutter/material.dart';

AppBar CWAppBar(BuildContext context, {String title = 'CryptoWave'}) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    elevation: 4,
  );
}
