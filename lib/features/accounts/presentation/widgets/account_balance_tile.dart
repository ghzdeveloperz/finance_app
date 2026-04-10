import 'package:flutter/material.dart';

class AccountBalanceTile extends StatelessWidget {
  final double balance;

  const AccountBalanceTile({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Text('Saldo: R\$ $balance');
  }
}