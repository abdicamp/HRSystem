import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_choky/screen/data_karyawan/data_karyawan_ho/data_karyawan_ho.dart';
import 'package:hr_choky/screen/data_karyawan/data_karyawan_sorteng/data_karyawan_sorteng.dart';
import 'package:hr_choky/screen/report_gaji_karyawan/report_gaji_karyawan_ho.dart/report_gaji_karyawan_ho.dart';
import 'package:hr_choky/screen/slip_gaji/slip_gaji.dart';
import 'package:provider/provider.dart';

import '../controller/menu_app_controller.dart';
import '../screen/dashboard/dashboard_screen.dart';
import '../screen/data_gaji_karyawan/data_gaji_ho.dart/data_gaji_ho.dart';
import '../screen/data_karyawan/data_karyawan_sortim/data_karyawan_sortim.dart';
import 'drawer_custom.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentTitle = context.watch<MenuAppController>().currentTitle;
    return Drawer(
        child: Container(
      color: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/profile_pic.png"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "HR Solution",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          DrawerListTileCustom(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              context
                  .read<MenuAppController>()
                  .setCurrentScreen(DashboardScreen(), "Dashboard");
            },
            isSelected: currentTitle == "Dashboard",
          ),
          ExpansionTile(
            collapsedIconColor: Colors.black,
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                SvgPicture.asset("assets/icons/menu_tran.svg"),
                SizedBox(
                  width: 10,
                ),
                Text("HO",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.normal))
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DrawerListTileCustom(
                  title: "Data Karyawan HO",
                  svgSrc: "assets/icons/Documents.svg",
                  press: () {
                    context
                        .read<MenuAppController>()
                        .setCurrentScreen(DataKaryawanHO(), "Data Karyawan HO");
                  },
                  isSelected: currentTitle == "Data Karyawan HO",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DrawerListTileCustom(
                  title: "Data Gaji Karyawan HO",
                  svgSrc: "assets/icons/Documents.svg",
                  press: () {
                    context.read<MenuAppController>().setCurrentScreen(
                        DataGajiHo(), "Data Gaji Karyawan HO");
                  },
                  isSelected: currentTitle == "Data Gaji Karyawan HO",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DrawerListTileCustom(
                  title: "Report Gaji Karyawan HO",
                  svgSrc: "assets/icons/Documents.svg",
                  press: () {
                    context.read<MenuAppController>().setCurrentScreen(
                        ReportGajiKaryawanHo(), "Report Gaji Karyawan HO");
                  },
                  isSelected: currentTitle == "Report Gaji Karyawan HO",
                ),
              ),
            ],
          ),
          ExpansionTile(
            collapsedIconColor: Colors.black,
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                SvgPicture.asset("assets/icons/menu_tran.svg"),
                SizedBox(
                  width: 10,
                ),
                Text("Sorteng",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.normal))
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DrawerListTileCustom(
                  title: "Data Karyawan Sorteng",
                  svgSrc: "assets/icons/Documents.svg",
                  press: () {
                    context.read<MenuAppController>().setCurrentScreen(
                        DataKaryawanSorteng(), "Data Karyawan Sorteng");
                  },
                  isSelected: currentTitle == "Data Karyawan Sorteng",
                ),
              ),
              //  Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DrawerListTileCustom(
              //     title: "Data Gaji Karyawan Sorteng",
              //     svgSrc: "assets/icons/Documents.svg",
              //     press: () {
              //       context.read<MenuAppController>().setCurrentScreen(
              //           DataKaryawanSorteng(), "Data Gaji Karyawan Sorteng");
              //     },
              //     isSelected: currentTitle == "Data Gaji Karyawan Sorteng",
              //   ),
              // ),
            ],
          ),
          ExpansionTile(
            collapsedIconColor: Colors.black,
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                SvgPicture.asset("assets/icons/menu_tran.svg"),
                SizedBox(
                  width: 10,
                ),
                Text("Sortim",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.normal))
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DrawerListTileCustom(
                  title: "Data Karyawan Sortim",
                  svgSrc: "assets/icons/Documents.svg",
                  press: () {
                    context.read<MenuAppController>().setCurrentScreen(
                        DataKaryawanSortim(), "Data Karyawan Sortim");
                  },
                  isSelected: currentTitle == "Data Karyawan Sortim",
                ),
              ),
            ],
          ),
          DrawerListTileCustom(
            title: "Slip Gaji",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              context
                  .read<MenuAppController>()
                  .setCurrentScreen(SlipGaji(), "Slip Gaji");
            },
            isSelected: currentTitle == "Slip Gaji",
          ),
        ],
      ),
    ));
  }
}
