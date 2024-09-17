import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_choky/screen/data_karyawan/data_karyawan_ho/data_karyawan_ho_viewmodel.dart';
import 'package:hr_choky/screen/report_gaji_karyawan/report_gaji_karyawan_ho.dart/report_gaji_karyawan_ho_viewmodel.dart';
import '../screen/data_gaji_karyawan/data_gaji_ho.dart/data_gaji_karyawanHO_viewmodel.dart';
import 'helpers/scalable_dp_helper.dart';
import 'shared/dimens.dart';
import 'shared/styles.dart';

class DataTableReportHo extends DataTableSource {
  ReportGajiKaryawanHoViewmodel? vm;

  DataTableReportHo({
    this.vm,
    List<dynamic>? productData,
  })  : _productData = productData ?? [],
        assert(productData != null);

  final List<dynamic>? _productData;

  @override
  DataRow? getRow(int index) {
    final item = _productData?[index];
    print("item : ${item?['EmployeeID']}");

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
            item?['GajiPokok'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['Jabatan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['Transportasi'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['UangMakan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['SubtotalBaseHO'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TunjanganProyek'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['EvaluasiKinerja'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['PenggantiLembur'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['RangkapJabatan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TeleponTransport'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TunjanganTambahanSK'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TunjanganKebersihanSOHO1815'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['SubtotalTunjanganTambahan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['SubtotalGaji'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TunjanganPengganti'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TunjanganPerbantuanProyek'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['KekuranganGajiBulanLalu'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['PengembalianJaminanKontrak'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['DendaTerlambat'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['Pemotongan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['PemotonganBPJS'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TotalGaji'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['JumlahLemburWajib'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['TerpenuhiTidak'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['RekeningBank'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['Keterangan'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(
          Text(
            item?['KesesuaianSlipGaji'] ?? '',
            style: blackRegularTextStyle.copyWith(
              fontSize: 10,
            ),
          ),
        ),
        DataCell(Row(
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
