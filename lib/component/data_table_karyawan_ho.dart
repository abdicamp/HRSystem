import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_choky/screen/data_karyawan/data_karyawan_ho/data_karyawan_ho_viewmodel.dart';

import 'helpers/scalable_dp_helper.dart';
import 'shared/dimens.dart';
import 'shared/styles.dart';

class DataTableKaryawanHO extends DataTableSource {
  DataKaryawanHoViewmodel? vm;

  DataTableKaryawanHO({
    this.vm,
    List<dynamic>? productData,
  })  : _productData = productData ?? [],
        assert(productData != null);

  final List<dynamic>? _productData;

  @override
  DataRow? getRow(int index) {
    final item = _productData?[index];
    print("item : ${item['Nama']}");

    return DataRow.byIndex(
      onSelectChanged: (value) {},
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(
            '${index + 1}',
            style: montserratRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['Nama'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['Jabatan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['Divisi'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['NIK'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['NPWP'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['TgglMulaiNPWP'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['JenisKelamin'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['StatusPernikahan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['StatusKewargaNegaraan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['Alamat'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['AlamatEmailResmi'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['AlamatEmailResmi2'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item['Golongan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(Row(
          children: [
            InkWell(
              onTap: () async {
                // await vm?.deleteMerek(item?.MerekCode);
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            vm?.deleteDataKaryawan(item['EmployeeID']);
                          },
                          child: Icon(Icons.delete)),
                      Text("||"),
                      InkWell(
                          onTap: () {
                            vm?.getUpdateDataKaryawan(item['EmployeeID']);
                          },
                          child: Icon(Icons.edit)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _productData?.length ?? 0;

  @override
  int get selectedRowCount => 0;
}


// class DataTableKaryawanHO extends DataTableSource {
//   DataTableKaryawanHO({
//     required this.productData,
//     required this.columnNames,
//   });

//   final List<Map<String, dynamic>> productData;
//   final List<String> columnNames;

//   @override
//   DataRow? getRow(int index) {
//     final item = productData[index];

//     return DataRow.byIndex(
//       index: index,
//       cells: columnNames.map((columnName) {
//         final value = item[columnName] ?? 'N/A';
//         return DataCell(
//           Text(
//             '$value',
//             style: TextStyle(fontSize: 12),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => productData.length;

//   @override
//   int get selectedRowCount => 0;
// }
