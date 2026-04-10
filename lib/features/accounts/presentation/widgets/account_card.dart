import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final double balance;

  const AccountCard({
    super.key,
    required this.name,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text('R\$ $balance'),
      ),
    );
  }
}