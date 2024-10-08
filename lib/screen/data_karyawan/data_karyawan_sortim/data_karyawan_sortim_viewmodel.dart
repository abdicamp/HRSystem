import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:hr_choky/component/network.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class DataKaryawanSortimViewmodel extends FutureViewModel {
  
  TextEditingController? namaKaryawan = new TextEditingController();
  TextEditingController? jabatanKaryawan = new TextEditingController();
  TextEditingController? divisiKaryawan = new TextEditingController();
  TextEditingController? nikKaryawan = new TextEditingController();
  TextEditingController? npwpKaryawan = new TextEditingController();
  TextEditingController? tglmulainnpwpKaryawan = new TextEditingController();
  TextEditingController? jeniskelaminKaryawan = new TextEditingController();
  TextEditingController? statusPernikahanKaryawan = new TextEditingController();
  TextEditingController? statuswarganegaraKaryawan =
      new TextEditingController();
  TextEditingController? alamatKaryawan = new TextEditingController();
  TextEditingController? alamatemailresmiKaryawan = new TextEditingController();
  TextEditingController? alamatemailresmi2Karyawan =
      new TextEditingController();
  TextEditingController? golonganKaryawan = new TextEditingController();

  List<dynamic>? listDataKaryawan = [];
  String? statusKaryawan;
  List<DropdownMenuItem<String>> get dropdownItems {
    return [
      DropdownMenuItem(
        value: "Tetap",
        child: Text("Tetap"),
      ),
      DropdownMenuItem(
        value: "Kontrak",
        child: Text("Kontrak"),
      ),
    ];
  }

  int hasil = 0;
  bool? isUpdate = false;
  String? getemployeeID;

  getDataKaryawan() async {
    
    try {
      setBusy(true);
      final response =
          await http.get(Uri.parse("${Networks.baseUrl}getDataKaryawan/Sortim"));

      if (response.statusCode == 200) {
        final dataJson = jsonDecode(response.body);
        listDataKaryawan = List.from(dataJson);

        if (dataJson!.isEmpty) {
          hasil = 1;
        } else {
          String? lastData = listDataKaryawan?.last['EmployeeID'];

          hasil = int.parse(lastData!.split('.')[1]);

          hasil += 1;
          notifyListeners();
        }
        notifyListeners();
        setBusy(false);
      }
    } catch (e) {
      print("data karyawan error : ${e}");
    }
  }

  clear() {
    namaKaryawan?.text = '';
    jabatanKaryawan?.text = '';
    divisiKaryawan?.text = '';
    nikKaryawan?.text = '';
    npwpKaryawan?.text = '';
    tglmulainnpwpKaryawan?.text = '';
    jeniskelaminKaryawan?.text = '';
    statusPernikahanKaryawan?.text = '';
    statuswarganegaraKaryawan?.text = '';
    alamatKaryawan?.text = '';
    alamatemailresmiKaryawan?.text = '';
    alamatemailresmi2Karyawan?.text = '';
    golonganKaryawan?.text = '';
    notifyListeners();
  }

  postDataKaryawan() async {
    try {
      setBusy(true);
      final Map<String, dynamic> data = {
        "EmployeeID": "SORTIM.${hasil.toString().padLeft(3, '0')}",
        "Nama": "${namaKaryawan?.text}",
        "Jabatan": "${jabatanKaryawan?.text}",
        "Divisi": "${divisiKaryawan?.text}",
        "NIK": "${nikKaryawan?.text}",
        "NPWP": "${npwpKaryawan?.text}",
        "TgglMulaiNPWP": "${tglmulainnpwpKaryawan?.text}",
        "JenisKelamin": "${jeniskelaminKaryawan?.text}",
        "StatusPernikahan": "${statusPernikahanKaryawan?.text}",
        "StatusKewargaNegaraan": "${statuswarganegaraKaryawan?.text}",
        "StatusKaryawan": "${statusKaryawan}",
        "Alamat": "${alamatKaryawan?.text}",
        "AlamatEmailResmi": "${alamatemailresmiKaryawan?.text}",
        "AlamatEmailResmi2": "${alamatemailresmi2Karyawan?.text}",
        "Golongan": "${golonganKaryawan?.text}",
        "Wilayah": "Sortim",
        "IsSuspend": "False",

      };
      print("data : ${data}");
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final response = await http.post(
        Uri.parse("${Networks.baseUrl}postDataKaryawan"),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        getDataKaryawan();
        clear();
        Fluttertoast.showToast(
          msg: "Berhasil Upload",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        setBusy(false);
      }
    } catch (e) {
      print("post data ${e}");
    }
  }

  deleteDataKaryawan(String? employeeID) async {
    try {
      setBusy(true);
      final response = await http.get(
          Uri.parse("${Networks.baseUrl}deleteDataKaryawan/${employeeID}"));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Berhasil Delete",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        getDataKaryawan();
        notifyListeners();
        setBusy(false);
      }
    } catch (e) {
      print("Error Delete : ${e}");
    }
  }

  getUpdateDataKaryawan(String? employeeID) async {
    try {
      final response = await http.get(
          Uri.parse("${Networks.baseUrl}getUpdateDataKaryawan/${employeeID}"));
      if (response.statusCode == 200) {
        isUpdate = true;
        final dataResponse = jsonDecode(response.body);

        for (var i in dataResponse) {
          getemployeeID = i['EmployeeID'];
          namaKaryawan?.text = i['Nama'];
          jabatanKaryawan?.text = i['Jabatan'];
          divisiKaryawan?.text = i['Divisi'];
          nikKaryawan?.text = i['NIK'];
          npwpKaryawan?.text = i['NPWP'];
          tglmulainnpwpKaryawan?.text = i['TgglMulaiNPWP'];
          jeniskelaminKaryawan?.text = i['JenisKelamin'];
          statusPernikahanKaryawan?.text = i["StatusPernikahan"];
          statuswarganegaraKaryawan?.text = i["StatusKewargaNegaraan"];
          alamatKaryawan?.text = i['Alamat'];
          alamatemailresmiKaryawan?.text = i['AlamatEmailResmi'];
          alamatemailresmi2Karyawan?.text = i['AlamatEmailResmi2'];
          golonganKaryawan?.text = i["Golongan"];
          notifyListeners();
        }
        notifyListeners();
      }
    } catch (e) {}
  }

  updateDataKaryawan() async {
    try {
      setBusy(true);
      final Map<String, dynamic> data = {
        "EmployeeID": "${getemployeeID}",
        "Nama": "${namaKaryawan?.text}",
        "Jabatan": "${jabatanKaryawan?.text}",
        "Divisi": "${divisiKaryawan?.text}",
        "NIK": "${nikKaryawan?.text}",
        "NPWP": "${npwpKaryawan?.text}",
        "TgglMulaiNPWP": "${tglmulainnpwpKaryawan?.text}",
        "JenisKelamin": "${jeniskelaminKaryawan?.text}",
        "StatusPernikahan": "${statusPernikahanKaryawan?.text}",
        "StatusKewargaNegaraan": "${statuswarganegaraKaryawan?.text}",
        "Alamat": "${alamatKaryawan?.text}",
        "AlamatEmailResmi": "${alamatemailresmiKaryawan?.text}",
        "AlamatEmailResmi2": "${alamatemailresmi2Karyawan?.text}",
        "Golongan": "${golonganKaryawan?.text}",
        "Wilayah": "Sortim",
        "IsSuspend": "False",
      };
      print("data : ${data}");
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.patch(
          Uri.parse("${Networks.baseUrl}updateDataKaryawan"),
          body: jsonEncode(data),
          headers: headers);

      if (response.statusCode == 200) {
        isUpdate = false;
        namaKaryawan?.clear();
        jabatanKaryawan?.clear();
        divisiKaryawan?.clear();
        nikKaryawan?.clear();
        npwpKaryawan?.clear();
        tglmulainnpwpKaryawan?.clear();
        jeniskelaminKaryawan?.clear();
        statusPernikahanKaryawan?.clear();
        statuswarganegaraKaryawan?.clear();
        alamatKaryawan?.clear();
        alamatemailresmiKaryawan?.clear();
        alamatemailresmi2Karyawan?.clear();
        golonganKaryawan?.clear();
        Fluttertoast.showToast(
          msg: "Berhasil Update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        getDataKaryawan();
        notifyListeners();

        setBusy(false);
      } else {
        setBusy(false);
      }
    } catch (e) {
      print("Update Berhasil");
    }
  }

  @override
  Future futureToRun() async {
    await getDataKaryawan();
  }
}
