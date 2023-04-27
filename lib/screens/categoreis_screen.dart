import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../services/side_bar.dart';

class CategoriesScreen extends StatelessWidget {
  static const id = 'Categories-Screen';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SideWidget _sideWidget = SideWidget();
    return AdminScaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('Zarea Admin Panel Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      sideBar: _sideWidget.sideBarMenue(context, CategoriesScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
