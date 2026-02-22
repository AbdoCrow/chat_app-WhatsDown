import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final String name;
  final String time;

  const StatusTile({
    super.key,
    required this.name,
    required this.time,
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text(time),
    );
  }
}