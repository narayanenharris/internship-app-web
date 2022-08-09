import 'package:flutter/material.dart';
import 'package:app/constants/colors.dart';
import 'package:app/pages/bookings.dart';
import 'package:app/pages/home/home_wrapper.dart';
import 'package:app/pages/notifications.dart';
import 'package:app/pages/support.dart';
import 'package:app/pages/wallet.dart';
import 'package:app/widget/drawer_widget/drawer_wrapper.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int selectedIndex = 0;

  static const List<Widget> pages = [
    HomeWrapper(),
    BookingsPage(),
    WalletPage(),
    NotificationsPage(),
    SupportPage(),
  ];

  static const List<String> items = [
    'Home',
    'Bookings',
    'Wallet',
    'Notifications',
    'Support',
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.elementAt(selectedIndex)),
        backgroundColor: ColorConstants.red,
      ),
      drawer: const DrawerWrapper(),
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: ColorConstants.red,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Support",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
