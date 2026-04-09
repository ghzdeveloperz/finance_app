import 'package:flutter/material.dart';

class AppEmptyState extends StatelessWidget {
  final String title;
  final String? description;

  const AppEmptyState({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, textAlign: TextAlign.center),
          if (description != null) ...[
            const SizedBox(height: 8),
            Text(
              description!,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}