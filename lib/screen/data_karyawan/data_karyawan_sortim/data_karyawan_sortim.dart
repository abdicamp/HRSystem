import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hr_choky/component/custom_text_field.dart';
import 'package:hr_choky/component/data_table_karyawan_ho.dart';
import 'package:hr_choky/component/data_table_karyawan_sortim.dart';
import 'package:hr_choky/component/helpers/scalable_dp_helper.dart';

import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import '../../../component/constants.dart';
import '../../../component/shared/constant/spaces.dart';
import '../../../component/shared/styles.dart';
import '../../../component/shared/ui_helpers.dart';
import 'data_karyawan_sortim_viewmodel.dart';

class DataKaryawanSortim extends StatefulWidget {
  const DataKaryawanSortim({super.key});

  @override
  State<DataKaryawanSortim> createState() => _DataKaryawanSortimState();
}


class _DataKaryawanSortimState extends State<DataKaryawanSortim> {
  List<dynamic> dataList = [];
  final ScrollController _scrollController = ScrollController();

  Map<String, dynamic> listdatajson = {};
  List<String> columnNames = [];
  List<Map<String, dynamic>> transformedData = [];
  bool? isBusy;

  Future<void> getAllUser() async {
    try {
      setState(() {
        isBusy = true;
      });
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        dataList = List.from(jsonResponse['users']);

        // Extract column names and transform data
        columnNames = getColumnNames(dataList);
        transformedData = transformData(dataList, columnNames);

        setState(() {
          isBusy = false;
        }); // Rebuild the widget
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  List<String> getColumnNames(List<dynamic> dataList) {
    if (dataList.isEmpty) return [];

    final firstItem = dataList[0] as Map<String, dynamic>;
    final List<String> columnNames = [];

    // Function to flatten keys
    void flatten(Map<String, dynamic> map, String prefix) {
      map.forEach((key, value) {
        if (value is Map) {
          flatten(value as Map<String, dynamic>, '$prefix$key.');
        } else {
          columnNames.add('$prefix$key');
        }
      });
    }

    flatten(firstItem, '');
    return columnNames;
  }

  List<Map<String, dynamic>> transformData(
      List<dynamic> dataList, List<String> columnNames) {
    return dataList.map((item) {
      final Map<String, dynamic> row = {};
      for (var column in columnNames) {
        final keys = column.split('.');
        dynamic value = item;
        for (var key in keys) {
          if (value is Map) {
            value = value[key];
          } else {
            value = null;
            break;
          }
        }
        row[column] = value ?? 'N/A';
      }
      return row;
    }).toList();
  }

  TextEditingController? alamatController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUser();
    alamatController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DataKaryawanSortimViewmodel(),
        builder: (context, vm, child) {
          return Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: isBusy == true
                    ? Container(child: loadingSpin)
                    : SafeArea(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    "Form Karyawan Sortim",
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
                                            controller: vm.namaKaryawan!,
                                            label: 'Nama'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller: vm.jabatanKaryawan!,
                                            label: 'Jabatan'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller: vm.divisiKaryawan!,
                                            label: 'Divisi'),
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
                                            controller: vm.nikKaryawan!,
                                            label: 'NIK'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller: vm.npwpKaryawan!,
                                            label: 'NPWP'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller:
                                                vm.tglmulainnpwpKaryawan!,
                                            label: 'Tanggal Mulai NPWP'),
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
                                                vm.jeniskelaminKaryawan!,
                                            label: 'Jenis Kelamin'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller:
                                                vm.statusPernikahanKaryawan!,
                                            label: 'Status Nikah'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller:
                                                vm.statuswarganegaraKaryawan!,
                                            label: 'Status Kewarganegaraan'),
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
                                                vm.alamatemailresmiKaryawan!,
                                            label: 'Alamat Email Resmi'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller:
                                                vm.alamatemailresmi2Karyawan!,
                                            label: 'Alamat Email Resmi 2'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: CustomTextField(
                                            controller: vm.golonganKaryawan!,
                                            label: 'Golongan'),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status Karyawan",
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
                                        child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
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
                                            value: vm.statusKaryawan,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                vm.statusKaryawan = newValue!;
                                              });
                                            },
                                            items: vm.dropdownItems),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomTextField(
                                    controller: vm.alamatKaryawan!,
                                    label: "Alamat",
                                    maxLines: 5,
                                  ),
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
                                                vm.postDataKaryawan();
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
                                                    vm.updateDataKaryawan();
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
                                                    vm.namaKaryawan?.clear();
                                                    vm.jabatanKaryawan?.clear();
                                                    vm.divisiKaryawan?.clear();
                                                    vm.nikKaryawan?.clear();
                                                    vm.npwpKaryawan?.clear();
                                                    vm.tglmulainnpwpKaryawan
                                                        ?.clear();
                                                    vm.jeniskelaminKaryawan
                                                        ?.clear();
                                                    vm.statusPernikahanKaryawan
                                                        ?.clear();
                                                    vm.statuswarganegaraKaryawan
                                                        ?.clear();
                                                    vm.alamatKaryawan?.clear();
                                                    vm.alamatemailresmiKaryawan
                                                        ?.clear();
                                                    vm.alamatemailresmi2Karyawan
                                                        ?.clear();
                                                    vm.golonganKaryawan
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
                            ),
                          ),
                        ),
                      ),
              ));
        
        });
  }
}

Widget dataTabel(List<dynamic>? source, DataKaryawanSortimViewmodel? vm) {
  return Container(
    width: double.infinity,
    child: SingleChildScrollView(
      child: PaginatedDataTable(
        showCheckboxColumn: false,
        showFirstLastButtons: true,
        rowsPerPage: 6,
        columnSpacing: 20.0,
        columns: [
          DataColumn(
            label: Text(
              "No",
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            tooltip: "No",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Nama",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Nama",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Jabatan",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Jabatan",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Divisi",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Divisi",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "NIK",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "NIK",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "NPWP",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "NPWP",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Tanggal Mulai NPWP",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Tanggal Mulai NPWP",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Jenis Kelamin",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Jenis Kelamin",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Status Pernikahan",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Status Pernikahan",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Status Kewarganegaraan",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Status Kewarganegaraan",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Alamat",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Alamat",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Alamat Email Resmi",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Alamat Email Resmi",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Alamat Email Resmi 2",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Alamat Email Resmi 2",
          ),
          DataColumn(
            label: Row(
              children: [
                Text(
                  "Golongan",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Golongan",
          ),
          DataColumn(
            label: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Text(
                  "Aksi",
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                horizontalSpace(SDP.sdp(4.0)),
              ],
            ),
            tooltip: "Aksi",
          ),
        ],
        source: DataTableKaryawanSortim(
          vm: vm,
          productData: source ?? [],
        ),
      ),
    ),
  );
}



                  // DataColumn(
                  //   label: Text(
                  //     "No",
                  //     style: blackSemiBoldTextStyle.copyWith(
                  //       fontSize: 10,
                  //     ),
                  //   ),
                  //   tooltip: "No",
                  // ),
                  // DataColumn(
                  //   label: Row(
                  //     children: [
                  //       Text(
                  //         "Nama Brand",
                  //         style: blackSemiBoldTextStyle.copyWith(
                  //           fontSize: 10,
                  //         ),
                  //       ),
                  //       horizontalSpace(SDP.sdp(4.0)),
                  //     ],
                  //   ),
                  //   tooltip: "Nama Brand",
                  // ),
                  // DataColumn(
                  //   label: Row(
                  //     children: [
                  //       Text(
                  //         "Nama Merek",
                  //         style: blackSemiBoldTextStyle.copyWith(
                  //           fontSize: 10,
                  //         ),
                  //       ),
                  //       horizontalSpace(SDP.sdp(4.0)),
                  //     ],
                  //   ),
                  //   tooltip: "Nama Merek",
                  // ),
                  // DataColumn(
                  //   label: Row(
                  //     children: [
                  //       Text(
                  //         "Manfaat",
                  //         style: blackSemiBoldTextStyle.copyWith(
                  //           fontSize: 10,
                  //         ),
                  //       ),
                  //       horizontalSpace(SDP.sdp(4.0)),
                  //     ],
                  //   ),
                  //   tooltip: "Manfaat",
                  // ),
                  // DataColumn(
                  //   label: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Container(),
                  //       Text(
                  //         "Aksi",
                  //         style: blackSemiBoldTextStyle.copyWith(
                  //           fontSize: 10,
                  //         ),
                  //       ),
                  //       horizontalSpace(SDP.sdp(4.0)),
                  //     ],
                  //   ),
                  //   tooltip: "Aksi",
                  // ),
                