import 'package:flutter/material.dart';
import 'package:chat_app/core/widgets/status_tile.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Recent Updates",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StatusTile(name: "Jil-Jil", time: "11:41"),
          StatusTile(name: "JSON", time: "12:00"),
          StatusTile(name: "El-Malek", time: "14:24"),
        ],
      ),
    );
  }
}