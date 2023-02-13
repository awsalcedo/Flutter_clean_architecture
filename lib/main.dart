import 'package:flutter/material.dart';

import 'injector.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const SriMovilApp());
}

class SriMovilApp extends StatelessWidget {
  const SriMovilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SRI MÓVIL'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
