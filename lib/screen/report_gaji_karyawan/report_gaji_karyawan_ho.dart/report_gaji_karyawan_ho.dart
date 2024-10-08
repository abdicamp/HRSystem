import 'package:flutter/material.dart';
import 'package:hr_choky/component/search_textfield.dart';
import 'package:hr_choky/screen/data_gaji_karyawan/data_gaji_ho.dart/data_gaji_karyawanHO_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../component/custom_text_field_number.dart';
import '../../../component/data_table_gaji_ho.dart';
import '../../../component/data_table_report_ho.dart';
import '../../../component/shared/constant/spaces.dart';
import '../../../component/shared/styles.dart';
import '../../../component/shared/ui_helpers.dart';
import 'report_gaji_karyawan_ho_viewmodel.dart';

class ReportGajiKaryawanHo extends StatefulWidget {
  const ReportGajiKaryawanHo({super.key});

  @override
  State<ReportGajiKaryawanHo> createState() => _ReportGajiKaryawanHoState();
}

class _ReportGajiKaryawanHoState extends State<ReportGajiKaryawanHo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ReportGajiKaryawanHoViewmodel(),
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
                              "Report Data Gaji Karyawan HO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          vm.isUpdate == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    vm.getStatusKaryawan == 'Kontrak'
                                        ? Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4.1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: CustomTextFieldNumber(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: vm
                                                        .seluruhPendapatan!,
                                                    label: 'Seluruh Pendapatan',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(),
                                    Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.1,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  vm.btnAkumulasi();
                                                });
                                              },
                                              child: Text("Akumulasikan")),
                                        )),
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
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.gajiPokokController!,
                                              label: 'Gaji Pokok',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm.jabatanController!,
                                              label: 'Jabatan',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.transportasiController!,
                                              label: 'Transportasi',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.1,
                                        child: CustomTextFieldNumber(
                                          readOnly: true,
                                          onChanged: (value) {
                                            print("valuess : ${value}");
                                            setState(() {
                                              if (value.isEmpty) {
                                                vm.uangMakanController?.text =
                                                    '0';
                                              } else {
                                                vm.subtotalBaseHOController
                                                        ?.text =
                                                    "${int.parse(vm.gajiPokokController?.text.toString() ?? '0') + int.parse(vm.jabatanController?.text.toString() ?? '0') + int.parse(vm.transportasiController?.text.toString() ?? '0') + int.parse(vm.uangMakanController?.text.toString() ?? '0')}";
                                              }
                                            });
                                          },
                                          controller: vm.uangMakanController!,
                                          label: 'Uang Makan',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.2,
                                        child: CustomTextFieldNumber(
                                          
                                          keyboardType: TextInputType.number,
                                          readOnly: true,
                                          controller:
                                              vm.subtotalBaseHOController!,
                                          label: 'Sub Total',
                                        ),
                                      ),
                                    ),
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
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.evaluasiKinerjaController!,
                                              label: 'Evaluasi Kinerja',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.penggantiLemburController!,
                                              label: 'Pengganti Lembur',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.rangkapJabatanController!,
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
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .teleponTransportController!,
                                              label: 'Telepon Transport',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .tunjanganTambahanSKController!,
                                              label: 'Tunjangan Tambahan SK',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .tunjanganKebersihanSOHO1815Controller!,
                                              label:
                                                  'Tunjangan Kebersihan SOHO1815',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.1,
                                        child: CustomTextFieldNumber(
                                          keyboardType: TextInputType.number,
                                          controller:
                                              vm.tunjanganProyekController!,
                                          label: 'Tunjangan Proyek',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.1,
                                        child: CustomTextFieldNumber(
                                          keyboardType: TextInputType.number,
                                          readOnly: true,
                                          controller: vm
                                              .subtotalTunjanganTambahanController!,
                                          label: 'Sub Total',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.1,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  vm.subtotalGajiController
                                                          ?.text =
                                                      "${int.parse(vm.evaluasiKinerjaController?.text.toString() ?? '0') + int.parse(vm.penggantiLemburController?.text.toString() ?? '0') + int.parse(vm.rangkapJabatanController?.text.toString() ?? '0') + int.parse(vm.teleponTransportController?.text.toString() ?? '0') + int.parse(vm.tunjanganTambahanSKController?.text.toString() ?? '0') + int.parse(vm.tunjanganKebersihanSOHO1815Controller?.text.toString() ?? '0') + int.parse(vm.tunjanganProyekController?.text.toString() ?? '0')}";
                                                  vm.subtotalTunjanganTambahanController!
                                                          .text =
                                                      "${int.parse(vm.evaluasiKinerjaController?.text.toString() ?? '0') + int.parse(vm.penggantiLemburController?.text.toString() ?? '0') + int.parse(vm.rangkapJabatanController?.text.toString() ?? '0') + int.parse(vm.teleponTransportController?.text.toString() ?? '0') + int.parse(vm.tunjanganTambahanSKController?.text.toString() ?? '0') + int.parse(vm.tunjanganKebersihanSOHO1815Controller?.text.toString() ?? '0') + int.parse(vm.tunjanganProyekController?.text.toString() ?? '0') + int.parse(vm.subtotalBaseHOController?.text.toString() ?? '0')}";
                                                });
                                              },
                                              child: Text("Hasil")),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: CustomTextFieldNumber(
                                        keyboardType: TextInputType.number,
                                        controller:
                                            vm.tunjanganPenggantiController!,
                                        label: 'Tunjangan Pengganti',
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .tunjanganPerbantuanProyekController!,
                                              label:
                                                  'Tunjangan Perbantuan Proyek',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .kekuranganGajiBulanLaluController!,
                                              label:
                                                  'Kekurangan Gaji Bulan Lalu',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .pengembalianJaminanKontrakController!,
                                              label:
                                                  'Pengembalian Jaminan Kontrak',
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
                                              onChanged: (value) {
                                                setState(() {
                                                  vm.dendaTerlambatController
                                                          ?.text =
                                                      '${int.parse(value) * 50000}';
                                                });
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.haridendaController!,
                                              label: 'Jumlah Hari',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.dendaTerlambatController!,
                                              label: 'Denda Terlambat',
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
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.pemotonganController!,
                                              label: 'Pemotongan',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.pemotonganBPJSController!,
                                              label: 'Pemotongan BPJS',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          4.1,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.1,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  vm.totalGajiController!.text =
                                                      "${int.parse(vm.subtotalTunjanganTambahanController?.text.toString() ?? '0') + int.parse(vm.tunjanganPenggantiController?.text.toString() ?? '0') + int.parse(vm.tunjanganPenggantiController?.text.toString() ?? '0') + int.parse(vm.kekuranganGajiBulanLaluController?.text.toString() ?? '0') + int.parse(vm.pengembalianJaminanKontrakController?.text.toString() ?? '0') - int.parse(vm.dendaTerlambatController?.text.toString() ?? '0') - int.parse(vm.pemotonganController?.text.toString() ?? '0') - int.parse(vm.pemotonganBPJSController?.text.toString() ?? '0')}";
                                                });
                                              },
                                              child: Text("Hasil")),
                                        )),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .jumlahLemburWajibController!,
                                              label: 'Jumlah Lembur Wajib',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.terpenuhiTidakController!,
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
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.rekeningBankController!,
                                              label: 'Rekening Bank',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  vm.keteranganController!,
                                              label: 'Keterangan',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: CustomTextFieldNumber(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: vm
                                                  .kesesuaianSlipGajiController!,
                                              label: 'Kesesuaian Slip Gaji',
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
                                                  if (_formKey.currentState!
                                                      .validate()) {
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
                                                        vm.employeeIDController
                                                            ?.clear();
                                                        vm.gajiPokokController
                                                            ?.clear();
                                                        vm.jabatanController
                                                            ?.clear();
                                                        vm.transportasiController
                                                            ?.clear();
                                                        vm.uangMakanController
                                                            ?.clear();
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
                                                        vm.pemotonganController
                                                            ?.clear();
                                                        vm.pemotonganBPJSController
                                                            ?.clear();
                                                        vm.totalGajiController
                                                            ?.clear();
                                                        vm.jumlahLemburWajibController
                                                            ?.clear();
                                                        vm.terpenuhiTidakController
                                                            ?.clear();
                                                        vm.rekeningBankController
                                                            ?.clear();
                                                        vm.keteranganController
                                                            ?.clear();
                                                        vm.kesesuaianSlipGajiController
                                                            ?.clear();
                                                        vm.crossCheck1Controller
                                                            ?.clear();
                                                        vm.crossCheck2Controller
                                                            ?.clear();
                                                        vm.crossCheck3Controller
                                                            ?.clear();
                                                        vm.revisiController
                                                            ?.clear();
                                                        vm.wilayahController
                                                            ?.clear();
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
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SearchTextField(
                                        controller: vm.search_textfield!,
                                        onChanged: (value) {
                                          setState(() {
                                            vm.filterData(value);
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: vm.isBusy
                                          ? loadingSpin
                                          : dataTabel(vm.filteredList, vm),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ElevatedButton(onPressed: () async{
                                        vm.exportJsonWeb();
                                      }, child: Text("Export Excel"),)
                                    ),
                                  ],
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

Widget dataTabel(List<dynamic>? source, ReportGajiKaryawanHoViewmodel? vm) {
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
              "Nama",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
          ),
          tooltip: "Nama",
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
      source: DataTableReportHo(
        vm: vm,
        productData: source ?? [],
      ),
    ),
  );
}
