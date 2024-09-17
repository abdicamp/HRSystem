import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hr_choky/screen/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../component/responsive.dart';
import '../component/side_menu.dart';
import '../controller/menu_app_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),

            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: context.watch<MenuAppController>().currentScreen,
            ),
          ],
        ),
      ),
    );
  }
}
