import 'package:flutter/material.dart';

class DummyFeaturePage extends StatelessWidget {
  const DummyFeaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dummy Feature')),
      body: const Center(child: Text('This is a simple dummy feature!')),
    );
  }
}
