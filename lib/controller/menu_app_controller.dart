import 'package:flutter/material.dart';
import 'package:hr_choky/screen/data_gaji_karyawan/data_gaji_ho.dart/data_gaji_ho.dart';
import 'package:hr_choky/screen/data_karyawan/data_karyawan_ho/data_karyawan_ho.dart';
import 'package:hr_choky/screen/report_gaji_karyawan/report_gaji_karyawan_ho.dart/report_gaji_karyawan_ho.dart';

import '../screen/dashboard/dashboard_screen.dart';

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  Widget _currentScreen = ReportGajiKaryawanHo();
  String _currentTitle = "Report Gaji Karyawan HO"; // Menyimpan title halaman aktif

  Widget get currentScreen => _currentScreen;
  String get currentTitle => _currentTitle; // Menyimpan title halaman aktif

  void setCurrentScreen(Widget screen, String title) {
    _currentScreen = screen;
    _currentTitle = title;
    notifyListeners();
    // controlMenu();  // Tutup drawer setelah berpindah halaman
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
