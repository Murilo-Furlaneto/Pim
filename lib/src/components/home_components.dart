import 'package:flutter/material.dart';

class HomeComponents extends StatelessWidget {
  const HomeComponents(
      {super.key,
      required this.function,
      required this.icon,
      required this.description});

  final IconData icon;
  final String description;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InkWell(onTap: function, child: Icon(icon, size: 50)),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(fontSize: 19),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
