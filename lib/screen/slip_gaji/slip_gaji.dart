import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../component/constants.dart';

class SlipGaji extends StatefulWidget {
  const SlipGaji({super.key});

  @override
  State<SlipGaji> createState() => _SlipGajiState();
}

class _SlipGajiState extends State<SlipGaji> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.1), // Warna bayangan dengan opacity
              spreadRadius: 5, // Menyebarkan bayangan
              blurRadius: 7, // Membuat bayangan lebih blur
              offset: Offset(3, 3), // Mengatur posisi bayangan (x, y)
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
