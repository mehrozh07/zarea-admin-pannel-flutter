import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:zarea_admin/screens/admin_users.dart';
import 'package:zarea_admin/screens/banner.dart';
import 'package:zarea_admin/screens/categoreis_screen.dart';
import 'package:zarea_admin/screens/exist.dart';
import 'package:zarea_admin/screens/home_screen.dart';
import 'package:zarea_admin/screens/order_screen.dart';
import 'package:zarea_admin/screens/send_notice.dart';
import 'package:zarea_admin/screens/setting.dart';
import 'package:zarea_admin/screens/vendor_screen.dart';

class SideWidget{
  sideBarMenue(context, selecrtRoute){
    return SideBar(
      activeBackgroundColor: Colors.black54,
      activeIconColor: Colors.amber,
      activeTextStyle: const TextStyle(color: Colors.white),
      items: const [
        AdminMenuItem(
          title: 'Dashboard',
          route: HomeScreen.id,
          icon: Icons.dashboard_outlined,
        ),
        AdminMenuItem(
          title: 'Banners',
          route: BannerScreen.id,
          icon: CupertinoIcons.photo,
        ),
        AdminMenuItem(
          title: 'Vendor',
          route: VendorScreen.id,
          icon: Icons.add_shopping_cart,
        ),
        AdminMenuItem(
          title: 'Categories',
          route: CategoriesScreen.id,
          icon: Icons.category_outlined,
        ),
        AdminMenuItem(
          title: 'Orders',
          route: OrdersScreen.id,
          icon: Icons.shopping_bag_outlined,
        ),
        AdminMenuItem(
          title: 'Send Notifications',
          route: SendNotifications.id,
          icon: Icons.notification_important_outlined,
        ),
        AdminMenuItem(
          title: 'Admin Users',
          route: AdminUsers.id,
          icon: Icons.person_outline,
        ),
        AdminMenuItem(
          title: 'Setting',
          route: SettingScreen.id,
          icon: Icons.settings,
        ),
        AdminMenuItem(
          title: 'Exit',
          route: Exist.id,
          icon: Icons.exit_to_app,
        ),
      ],
      selectedRoute: '/',
      onSelected: (item) {
        if (item.route != null) {
          Navigator.of(context).pushNamed(item.route!);
        }
      },
      header: Container(
        height: 50,
        width: double.infinity,
        color: const Color(0xff444444),
        child: const Center(
          child: Text(
            'DashBoard',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      footer: Container(
        height: 50,
        width: double.infinity,
        color: const Color(0xff444444),
        child:  Center(
          child: Image.asset('assets/images/logo.png', height: 100,),
        ),
      ),
    );
  }
}