import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:zarea_admin/services/side_bar.dart';

class OrdersScreen extends StatefulWidget {
  static const id = 'Order-Screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {


  @override
  Widget build(BuildContext context) {
    SideWidget _sideWidget = SideWidget();
    return AdminScaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('Zarea Admin Panel Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      sideBar: _sideWidget.sideBarMenue(context, OrdersScreen.id),
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
