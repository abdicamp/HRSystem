import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerListTileCustom extends StatelessWidget {
  const DrawerListTileCustom({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.orange : Colors.black, // Warna ikon ketika aktif
          BlendMode.srcIn,
        ),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected
              ? Colors.orange
              : Colors.black, // Warna teks ketika aktif
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      // Warna latar belakang ketika aktif
    );
  }
}
