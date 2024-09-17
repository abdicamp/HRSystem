import 'package:flutter/material.dart';

import '../../component/constants.dart';
import '../../component/responsive.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Text(
              "Dashboard screen",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
