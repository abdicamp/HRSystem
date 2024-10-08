import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_choky/screen/data_karyawan/data_karyawan_ho/data_karyawan_ho_viewmodel.dart';
import 'package:intl/intl.dart';
import '../screen/data_gaji_karyawan/data_gaji_ho.dart/data_gaji_karyawanHO_viewmodel.dart';
import 'helpers/scalable_dp_helper.dart';
import 'shared/dimens.dart';
import 'shared/styles.dart';

class DataTableGajiHO extends DataTableSource {
  DataGajiKaryawanHoViewmodel? vm;

  DataTableGajiHO({
    this.vm,
    List<dynamic>? productData,
  })  : _productData = productData ?? [],
        assert(productData != null);

  final List<dynamic>? _productData;

  @override
  DataRow? getRow(int index) {
    final item = _productData?[index];
    print("item : ${item?['EmployeeID']}");

    final formatRupiah = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);

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
            '${item?['Nama'] ?? ''}',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['GajiPokok'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['Jabatan'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['Transportasi'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['UangMakan'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['SubtotalBaseHO'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['TunjanganProyek'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['EvaluasiKinerja'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['PenggantiLembur'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['RangkapJabatan'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['RangkapProyek'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['TeleponTransport'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        
        // DataCell(
        //   Text(
        //     item?['TunjanganTambahanSK'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['TunjanganKebersihanSOHO1815'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['SubtotalTunjanganTambahan'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['SubtotalGaji'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['TunjanganPengganti'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['TunjanganPerbantuanProyek'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['KekuranganGajiBulanLalu'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['PengembalianJaminanKontrak'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['DendaTerlambat'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['Pemotongan'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['PemotonganBPJS'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
       
        DataCell(
          Text(
            formatRupiah.format(int.parse(item?['TotalGaji'] ?? 0)),
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        // DataCell(
        //   Text(
        //     item?['JumlahLemburWajib'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['TerpenuhiTidak'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['RekeningBank'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['Keterangan'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        // DataCell(
        //   Text(
        //     item?['KesesuaianSlipGaji'] ?? '',
        //     style: blackRegularTextStyle.copyWith(
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
        
        DataCell(
          Row(
          children: [
            InkWell(
              onTap: () async {
                vm?.deleteDataGajiKaryawan(item?['EmployeeID']);
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            vm?.deleteDataGajiKaryawan(item?['EmployeeID']);
                          },
                          child: Icon(Icons.delete)),
                      Text("||"),
                      InkWell(
                          onTap: () {
                            vm?.getUpdateDataGajiKaryawan(item?['EmployeeID']);
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
