import 'package:flutter/material.dart';
import 'package:hr_choky/screen/data_gaji_karyawan/data_gaji_ho.dart/data_gaji_karyawanHO_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../component/custom_text_field.dart';
import '../../../component/custom_text_field_number.dart';
import '../../../component/data_table_gaji_ho.dart';
import '../../../component/shared/constant/spaces.dart';
import '../../../component/shared/styles.dart';
import '../../../component/shared/ui_helpers.dart';

class DataGajiHo extends StatefulWidget {
  const DataGajiHo({super.key});

  @override
  State<DataGajiHo> createState() => _DataGajiHoState();
}

class _DataGajiHoState extends State<DataGajiHo> {
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
                              "Form Data Gaji Karyawan HO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          vm.isUpdate == true
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pilih Karyawan",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SpaceHeight(12.0),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.1,
                                        child: FutureBuilder<
                                            List<DropdownMenuItem<String>>>(
                                          future: vm.fetchDropdownData(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return loadingSpin;
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else if (!snapshot.hasData ||
                                                snapshot.data!.isEmpty) {
                                              return Text('No data available');
                                            }

                                            List<DropdownMenuItem<String>>
                                                items = snapshot.data!;

                                            return DropdownButtonFormField<
                                                String>(
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              dropdownColor: Colors.white,
                                              value: vm.getemployeeIDSelected,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please select an option';
                                                }
                                                return null;
                                              },
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  vm.getemployeeIDSelected =
                                                      newValue;
                                                });
                                              },
                                              items: items,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Tunjangan Base HO",
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
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.gajiPokokController!,
                                    label: 'Gaji Pokok',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.jabatanController!,
                                    label: 'Jabatan',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.transportasiController!,
                                    label: 'Transportasi',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4.1,
                              child: CustomTextFieldNumber(
                                controller: vm.uangMakanController!,
                                label: 'Uang Makan',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4.2,
                              child: CustomTextFieldNumber(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                controller: vm.subtotalBaseHOController!,
                                label: 'Sub Total',
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4.1,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        vm.subtotalBaseHOController?.text =
                                            "${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(int.parse(vm.gajiPokokController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.jabatanController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.transportasiController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.uangMakanController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0'))}";
                                      });
                                    },
                                    child: Text("Hasil")),
                              )),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Tunjangan Tambahan",
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
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.tunjanganProyekController!,
                                    label: 'Tunjangan Proyek',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.evaluasiKinerjaController!,
                                    label: 'Evaluasi Kinerja',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.penggantiLemburController!,
                                    label: 'Pengganti Lembur',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
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
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.teleponTransportController!,
                                    label: 'Telepon / Transport',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextFieldNumber(
                                    keyboardType: TextInputType.number,
                                    controller: vm.rangkapProyekController!,
                                    label: 'Rangkap Proyek',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4.1,
                              child: CustomTextFieldNumber(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                controller:
                                    vm.subtotalTunjanganTambahanController!,
                                label: 'Sub Total',
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4.1,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        // vm.subtotalGajiController?.text =
                                        //     "${int.parse(vm.evaluasiKinerjaController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.penggantiLemburController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.rangkapJabatanController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.teleponTransportController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.tunjanganTambahanSKController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.tunjanganKebersihanSOHO1815Controller?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.tunjanganProyekController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0')}";

                                        vm.subtotalTunjanganTambahanController!
                                                .text =
                                            "${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(int.parse(vm.tunjanganProyekController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.evaluasiKinerjaController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.penggantiLemburController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.rangkapJabatanController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.teleponTransportController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.rangkapProyekController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0'))}";
                                      });
                                    },
                                    child: Text("Hasil")),
                              )),
                          // Padding(
                          //   padding: const EdgeInsets.all(20),
                          //   child: CustomTextFieldNumber(
                          //     keyboardType: TextInputType.number,
                          //     controller: vm.tunjanganPenggantiController!,
                          //     label: 'Tunjangan Pengganti',
                          //   ),
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller:
                          //               vm.tunjanganPerbantuanProyekController!,
                          //           label: 'Tunjangan Perbantuan Proyek',
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller:
                          //               vm.kekuranganGajiBulanLaluController!,
                          //           label: 'Kekurangan Gaji Bulan Lalu',
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm
                          //               .pengembalianJaminanKontrakController!,
                          //           label: 'Pengembalian Jaminan Kontrak',
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm.dendaTerlambatController!,
                          //           label: 'Denda Terlambat',
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm.pemotonganController!,
                          //           label: 'Pemotongan',
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm.pemotonganBPJSController!,
                          //           label: 'Pemotongan BPJS',
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          Container(
                            width: MediaQuery.of(context).size.width / 4.1,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: CustomTextFieldNumber(
                                keyboardType: TextInputType.number,
                                controller: vm.totalGajiController!,
                                label: 'Total Gaji',
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4.1,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        vm.totalGajiController!.text =
                                            "${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(int.parse(vm.subtotalBaseHOController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0') + int.parse(vm.subtotalTunjanganTambahanController?.text.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '0'))}";
                                      });
                                    },
                                    child: Text("Hasil")),
                              )),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm.jumlahLemburWajibController!,
                          //           label: 'Jumlah Lembur Wajib',
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm.terpenuhiTidakController!,
                          //           label: 'Terpenuhi Tidak',
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm.rekeningBankController!,
                          //           label: 'Rekening Bank',
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller: vm.keteranganController!,
                          //           label: 'Keterangan',
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(20),
                          //         child: CustomTextFieldNumber(
                          //           keyboardType: TextInputType.number,
                          //           controller:
                          //               vm.kesesuaianSlipGajiController!,
                          //           label: 'Kesesuaian Slip Gaji',
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
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
              "Rangkap Proyek",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Rangkap Proyek",
        ),
        
        // DataColumn(
        //   label: Expanded(
        //     child: Text(
        //       "Tunjangan Tambahan SK",
        //       style: blackSemiBoldTextStyle.copyWith(
        //         fontSize: 10,
        //       ),
        //     ),
        //   ),
        //   tooltip: "Tunjangan Tambahan SK",
        // ),
        // DataColumn(
        //   label: Expanded(
        //     child: Text(
        //       "Tunjangan Kebersihan SOHO 1815",
        //       style: blackSemiBoldTextStyle.copyWith(
        //         fontSize: 10,
        //       ),
        //     ),
        //   ),
        //   tooltip: "Tunjangan Kebersihan SOHO 1815",
        // ),
        
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
