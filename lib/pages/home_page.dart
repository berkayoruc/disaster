import 'package:disaster/core/states/bnb_state.dart';
import 'package:disaster/pages/contacts_page.dart';
import 'package:disaster/pages/emergency_page.dart';
import 'package:disaster/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final List<dynamic> pages = const [
    EmergencyPage(),
    ContactsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final pageIndexProvider = Provider.of<BNBProvider>(context);
    int currentIndex = pageIndexProvider.currentIndex;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (int value) => value != currentIndex
              ? pageIndexProvider.currentIndex = value
              : {},
          items: [
            BottomNavigationBarItem(
                icon: Icon(currentIndex == 0
                    ? Icons.home_filled
                    : Icons.home_outlined),
                label: '',
                backgroundColor: Colors.indigo),
            BottomNavigationBarItem(
                icon: Icon(currentIndex == 1
                    ? Icons.contact_emergency
                    : Icons.contact_emergency_outlined),
                label: '',
                backgroundColor: Colors.indigo),
            BottomNavigationBarItem(
                icon: Icon(currentIndex == 2
                    ? Icons.settings
                    : Icons.settings_outlined),
                label: '',
                backgroundColor: Colors.indigo),
          ],
        ),
        body: pages.elementAt(currentIndex),
      ),
    );
  }
}
