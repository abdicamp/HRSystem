import 'package:flutter/material.dart';
import 'package:hr_choky/screen/data_gaji_karyawan/data_gaji_ho.dart/data_gaji_karyawanHO_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../component/custom_text_field.dart';
import '../../../component/data_table_gaji_ho.dart';
import '../../../component/shared/constant/spaces.dart';
import '../../../component/shared/styles.dart';
import '../../../component/shared/ui_helpers.dart';

class DataGajiSorteng extends StatefulWidget {
  const DataGajiSorteng({super.key});

  @override
  State<DataGajiSorteng> createState() => _DataGajiSortengState();
}

class _DataGajiSortengState extends State<DataGajiSorteng> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DataGajiKaryawanHoViewmodel(),
        builder: (context, vm, child) {
          return Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Form Karyawan HO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.gajiPokokController!,
                                    label: 'Gaji Pokok',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.jabatanController!,
                                    label: 'Jabatan',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.transportasiController!,
                                    label: 'Transportasi',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.uangMakanController!,
                                    label: 'Uang Makan',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.subtotalBaseHOController!,
                                    label: 'Subtotal Base HO',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.tunjanganProyekController!,
                                    label: 'Tunjangan Proyek',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.evaluasiKinerjaController!,
                                    label: 'Evaluasi Kinerja',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.penggantiLemburController!,
                                    label: 'Pengganti Lembur',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.rangkapJabatanController!,
                                    label: 'Rangkap Jabatan',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.teleponTransportController!,
                                    label: 'Telepon Transport',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller:
                                        vm.tunjanganTambahanSKController!,
                                    label: 'Tunjangan Tambahan SK',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm
                                        .tunjanganKebersihanSOHO1815Controller!,
                                    label: 'Tunjangan Kebersihan SOHO1815',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller:
                                        vm.subtotalTunjanganTambahanController!,
                                    label: 'Subtotal Tunjangan Tambahan',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.subtotalGajiController!,
                                    label: 'Subtotal Gaji',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller:
                                        vm.tunjanganPenggantiController!,
                                    label: 'Tunjangan Pengganti',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller:
                                        vm.tunjanganPerbantuanProyekController!,
                                    label: 'Tunjangan Perbantuan Proyek',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller:
                                        vm.kekuranganGajiBulanLaluController!,
                                    label: 'Kekurangan Gaji Bulan Lalu',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm
                                        .pengembalianJaminanKontrakController!,
                                    label: 'Pengembalian Jaminan Kontrak',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.dendaTerlambatController!,
                                    label: 'Denda Terlambat',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.pemotonganController!,
                                    label: 'Pemotongan',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.pemotonganBPJSController!,
                                    label: 'Pemotongan BPJS',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.totalGajiController!,
                                    label: 'Total Gaji',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.jumlahLemburWajibController!,
                                    label: 'Jumlah Lembur Wajib',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.terpenuhiTidakController!,
                                    label: 'Terpenuhi Tidak',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.rekeningBankController!,
                                    label: 'Rekening Bank',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.keteranganController!,
                                    label: 'Keterangan',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller:
                                        vm.kesesuaianSlipGajiController!,
                                    label: 'Kesesuaian Slip Gaji',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.crossCheck1Controller!,
                                    label: 'Cross Check 1',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.crossCheck2Controller!,
                                    label: 'Cross Check 2',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.crossCheck3Controller!,
                                    label: 'Cross Check 3',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.revisiController!,
                                    label: 'Revisi',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.wilayahController!,
                                    label: 'Wilayah',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          vm.isUpdate == false
                              ? Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          vm.postDataGajiKaryawan();
                                        }
                                      },
                                      child: Text("Masukan Data")),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              vm.updateDataGajiKaryawan();
                                            }
                                          },
                                          child: Text("Update Data")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              vm.isUpdate = false;
                                              vm.employeeIDController?.clear();
                                              vm.gajiPokokController?.clear();
                                              vm.jabatanController?.clear();
                                              vm.transportasiController
                                                  ?.clear();
                                              vm.uangMakanController?.clear();
                                              vm.subtotalBaseHOController
                                                  ?.clear();
                                              vm.tunjanganProyekController
                                                  ?.clear();
                                              vm.evaluasiKinerjaController
                                                  ?.clear();
                                              vm.penggantiLemburController
                                                  ?.clear();
                                              vm.rangkapJabatanController
                                                  ?.clear();
                                              vm.teleponTransportController
                                                  ?.clear();
                                              vm.tunjanganTambahanSKController
                                                  ?.clear();
                                              vm.tunjanganKebersihanSOHO1815Controller
                                                  ?.clear();
                                              vm.subtotalTunjanganTambahanController
                                                  ?.clear();
                                              vm.subtotalGajiController
                                                  ?.clear();
                                              vm.tunjanganPenggantiController
                                                  ?.clear();
                                              vm.tunjanganPerbantuanProyekController
                                                  ?.clear();
                                              vm.kekuranganGajiBulanLaluController
                                                  ?.clear();
                                              vm.pengembalianJaminanKontrakController
                                                  ?.clear();
                                              vm.dendaTerlambatController
                                                  ?.clear();
                                              vm.pemotonganController?.clear();
                                              vm.pemotonganBPJSController
                                                  ?.clear();
                                              vm.totalGajiController?.clear();
                                              vm.jumlahLemburWajibController
                                                  ?.clear();
                                              vm.terpenuhiTidakController
                                                  ?.clear();
                                              vm.rekeningBankController
                                                  ?.clear();
                                              vm.keteranganController?.clear();
                                              vm.kesesuaianSlipGajiController
                                                  ?.clear();
                                              vm.crossCheck1Controller?.clear();
                                              vm.crossCheck2Controller?.clear();
                                              vm.crossCheck3Controller?.clear();
                                              vm.revisiController?.clear();
                                              vm.wilayahController?.clear();
                                            });
                                          },
                                          child: Text("Cancel")),
                                    ],
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: vm.isBusy
                                ? loadingSpin
                                : dataTabel(vm.listDataKaryawan, vm),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}

Widget dataTabel(List<dynamic>? source, DataGajiKaryawanHoViewmodel? vm) {
  return SingleChildScrollView(
    child: PaginatedDataTable(
      showCheckboxColumn: false,
      showFirstLastButtons: true,
      rowsPerPage: 6,
      columnSpacing: 25.0,
      columns: [
        DataColumn(
          label: Expanded(
            child: Text(
              "No",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "No",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Gaji Pokok",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Gaji Pokok",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Jabatan",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Jabatan",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Transportasi",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Transportasi",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Uang Makan",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Uang Makan",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Subtotal Base HO",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Subtotal Base HO",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Tunjangan Proyek",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Tunjangan Proyek",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Evaluasi Kinerja",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Evaluasi Kinerja",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Pengganti Lembur",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Pengganti Lembur",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Rangkap Jabatan",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Rangkap Jabatan",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Telepon Transport",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Telepon Transport",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Tunjangan Tambahan SK",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Tunjangan Tambahan SK",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Tunjangan Kebersihan SOHO 1815",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Tunjangan Kebersihan SOHO 1815",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Subtotal Tunjangan Tambahan",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Subtotal Tunjangan Tambahan",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Subtotal Gaji",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Subtotal Gaji",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Tunjangan Pengganti",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Tunjangan Pengganti",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Tunjangan Perbantuan Proyek",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Tunjangan Perbantuan Proyek",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Kekurangan Gaji Bulan Lalu",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Kekurangan Gaji Bulan Lalu",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Pengembalian Jaminan Kontrak",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Pengembalian Jaminan Kontrak",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Denda Terlambat",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Denda Terlambat",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Pemotongan",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Pemotongan",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Pemotongan BPJS",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Pemotongan BPJS",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Total Gaji",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Total Gaji",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Jumlah Lembur Wajib",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Jumlah Lembur Wajib",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Terpenuhi Tidak",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Terpenuhi Tidak",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Rekening Bank",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Rekening Bank",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Keterangan",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Keterangan",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Kesesuaian Slip Gaji",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Kesesuaian Slip Gaji",
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              "Aksi",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Aksi",
        ),
      ],
      source: DataTableGajiHO(
        vm: vm,
        productData: source ?? [],
      ),
    ),
  );
}
