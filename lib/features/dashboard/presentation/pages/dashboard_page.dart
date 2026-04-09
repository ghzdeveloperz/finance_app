import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/buttons/app_icon_button.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Future<void> _logout(BuildContext context) async {
    // logout real entra no próximo bloco se você quiser
    context.go(RouteNames.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        title: 'Dashboard',
        actions: [
          AppIconActionButton(
            icon: Icons.logout,
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: const Center(
        child: Text('Dashboard inicial'),
      ),
    );
  }
}