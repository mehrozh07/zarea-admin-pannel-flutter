import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:zarea_admin/services/side_bar.dart';
import 'package:zarea_admin/widgets/vendor_filter.dart';
import 'package:zarea_admin/widgets/vendor_widget.dart';

class VendorScreen extends StatelessWidget {
  static const id = 'Vendor-Screen';
  const VendorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SideWidget _sideBar = SideWidget();
    return AdminScaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('Zarea Admin Panel Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      sideBar: _sideBar.sideBarMenue(context, VendorScreen.id),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Manage Vendor',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
            const Text('Manage Vendor through Zarea Admin'),
            // const Divider(thickness: 5,),
            // const VendorFilterWidget(),
            const Divider(thickness: 5 ,),
            const VendorManage(),
          ],
        ),
      ),
    );
  }
}
