import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../services/side_bar.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home-Screen';
   HomeScreen({Key? key}) : super(key: key);
  SideWidget _sideBar = SideWidget();
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('Zarea Admin Panel Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      sideBar: _sideBar.sideBarMenue(context, HomeScreen.id),
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
