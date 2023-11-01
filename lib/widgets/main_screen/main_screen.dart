import 'package:flutter/material.dart';

import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/interactive_map/interactive_map_screen.dart';
import 'package:smart_office/widgets/main_screen/main_widget.dart';
import 'package:smart_office/widgets/services_screen/services_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {


  List<Widget> screens = const [
    MapWidget(),
    MainWidget(),
    ServicesScreen(),
  ];

  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: screens[_screenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.purple,
        currentIndex: _screenIndex,
        onTap: (index) {
          _screenIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Zenly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Лента',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Сервисы',
          )
        ],
      ),
    );
  }
}
