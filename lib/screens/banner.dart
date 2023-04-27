import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:zarea_admin/widgets/banner.dart';

import '../services/side_bar.dart';

class BannerScreen extends StatelessWidget {
  static const id = 'Banner-Screen';
  const BannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SideWidget _sideWidget = SideWidget();
    return AdminScaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('Zarea Admin Panel Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      sideBar: _sideWidget.sideBarMenue(context, BannerScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Banner Screen',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              Text("Add or Delete Home Screen Banner"),
              Divider(thickness: 1,),
              BannerWidget(),
              Divider(thickness: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
