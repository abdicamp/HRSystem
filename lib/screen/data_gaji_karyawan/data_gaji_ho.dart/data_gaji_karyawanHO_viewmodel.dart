import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:hr_choky/component/network.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class DataGajiKaryawanHoViewmodel extends FutureViewModel {
  TextEditingController? employeeIDController = new TextEditingController();
  TextEditingController? gajiPokokController = new TextEditingController();
  TextEditingController? jabatanController = new TextEditingController();
  TextEditingController? transportasiController = new TextEditingController();
  TextEditingController? uangMakanController = new TextEditingController();
  TextEditingController? subtotalBaseHOController = new TextEditingController();
  TextEditingController? tunjanganProyekController =
      new TextEditingController();
  TextEditingController? evaluasiKinerjaController =
      new TextEditingController();
  TextEditingController? penggantiLemburController =
      new TextEditingController();
  TextEditingController? rangkapJabatanController = new TextEditingController();
  TextEditingController? teleponTransportController =
      new TextEditingController();
  TextEditingController? tunjanganTambahanSKController =
      new TextEditingController();
  TextEditingController? tunjanganKebersihanSOHO1815Controller =
      new TextEditingController();
  TextEditingController? subtotalTunjanganTambahanController =
      new TextEditingController();
  TextEditingController? subtotalGajiController = new TextEditingController();
  TextEditingController? tunjanganPenggantiController =
      new TextEditingController();
  TextEditingController? tunjanganPerbantuanProyekController =
      new TextEditingController();
  TextEditingController? kekuranganGajiBulanLaluController =
      new TextEditingController();
  TextEditingController? pengembalianJaminanKontrakController =
      new TextEditingController();
  TextEditingController? dendaTerlambatController = new TextEditingController();
  TextEditingController? pemotonganController = new TextEditingController();
  TextEditingController? pemotonganBPJSController = new TextEditingController();
  TextEditingController? totalGajiController = new TextEditingController();
  TextEditingController? jumlahLemburWajibController =
      new TextEditingController();
  TextEditingController? terpenuhiTidakController = new TextEditingController();
  TextEditingController? rekeningBankController = new TextEditingController();
  TextEditingController? keteranganController = new TextEditingController();
  TextEditingController? rangkapProyekController = new TextEditingController();
  TextEditingController? kesesuaianSlipGajiController =
      new TextEditingController();
  TextEditingController? crossCheck1Controller = new TextEditingController();
  TextEditingController? crossCheck2Controller = new TextEditingController();
  TextEditingController? crossCheck3Controller = new TextEditingController();
  TextEditingController? revisiController = new TextEditingController();
  TextEditingController? wilayahController = new TextEditingController();

  List<dynamic>? listDataKaryawan = [];

  int hasil = 0;
  bool? isUpdate = false;
  String? getemployeeID;
  String? getemployeeIDSelected;
  String? getNamaKaryawanSelected;

  Future<List<DropdownMenuItem<String>>> fetchDropdownData() async {
    final response =
        await http.get(Uri.parse("${Networks.baseUrl}getDataKaryawan/HO"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map<DropdownMenuItem<String>>((item) {
        return DropdownMenuItem<String>(
          value: item['EmployeeID'], // Sesuaikan dengan struktur data Anda
          child: Text(item['Nama']), // Sesuaikan dengan struktur data Anda
        );
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  getDataKaryawan() async {
    try {
      setBusy(true);
      final response =
          await http.get(Uri.parse("${Networks.baseUrl}getDataKaryawan/HO"));

      if (response.statusCode == 200) {
        final dataJson = jsonDecode(response.body);

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

  getDataGajiKaryawan() async {
    try {
      setBusy(true);
      final response = await http
          .get(Uri.parse("${Networks.baseUrl}getDataGajiKaryawan/HO"));

      if (response.statusCode == 200) {
        final dataJson = jsonDecode(response.body);
        listDataKaryawan = List.from(dataJson);
        print("list data gaji : ${listDataKaryawan}");

        notifyListeners();
        setBusy(false);
      }
    } catch (e) {
      print("data karyawan error : ${e}");
    }
  }

  postDataGajiKaryawan() async {
    try {
      setBusy(true);

      final Map<String, dynamic> data = {
        "EmployeeID": "${getemployeeIDSelected}",
        "GajiPokok":
            "${gajiPokokController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "Jabatan":
            "${jabatanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "Transportasi":
            "${transportasiController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "UangMakan":
            "${uangMakanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "SubtotalBaseHO":
            "${subtotalBaseHOController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TunjanganProyek":
            "${tunjanganProyekController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "EvaluasiKinerja":
            "${evaluasiKinerjaController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "PenggantiLembur":
            "${penggantiLemburController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "RangkapJabatan":
            "${rangkapJabatanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TeleponTransport":
            "${teleponTransportController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "RangkapProyek":
            "${rangkapProyekController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "SubtotalTunjanganTambahan":
            "${subtotalTunjanganTambahanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "SubtotalGaji": "",
        "TunjanganPengganti": "",
        "TunjanganPerbantuanProyek": "",
        "KekuranganGajiBulanLalu": "",
        "PengembalianJaminanKontrak": "",
        "DendaTerlambat": "",
        "Pemotongan": "",
        "PemotonganBPJS": "",
        "TotalGaji":
            "${totalGajiController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "JumlahLemburWajib": "",
        "TerpenuhiTidak": "",
        "RekeningBank": "",
        "Keterangan": "",
        "KesesuaianSlipGaji": "",
        "Wilayah": "HO",
        "IsSuspend": "False",
      };

      print("data : ${data}");
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final response = await http.post(
        Uri.parse("${Networks.baseUrl}postDataGajiKaryawan"),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        getDataGajiKaryawan();
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

  deleteDataGajiKaryawan(String? employeeID) async {
    try {
      setBusy(true);
      final response = await http.get(
          Uri.parse("${Networks.baseUrl}deleteDataGajiKaryawan/${employeeID}"));
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
        getDataGajiKaryawan();
        notifyListeners();
        setBusy(false);
      }
    } catch (e) {
      print("Error Delete : ${e}");
    }
  }

  getUpdateDataGajiKaryawan(String? employeeID) async {
    try {
      final response = await http.get(Uri.parse(
          "${Networks.baseUrl}getUpdateDataGajiKaryawan/${employeeID}"));
      if (response.statusCode == 200) {
        isUpdate = true;
        final dataResponse = jsonDecode(response.body);
        print("data response : ${dataResponse}");

        for (var i in dataResponse) {
          getemployeeID = i['EmployeeID'];
          gajiPokokController?.text = i['GajiPokok'] ?? '';
          jabatanController?.text = i['Jabatan'] ?? '';
          transportasiController?.text = i['Transportasi'] ?? '';
          uangMakanController?.text = i['UangMakan'] ?? '';
          subtotalBaseHOController?.text = i['SubtotalBaseHO'] ?? '';
          tunjanganProyekController?.text = i['TunjanganProyek'] ?? '';
          evaluasiKinerjaController?.text = i['EvaluasiKinerja'] ?? '';
          penggantiLemburController?.text = i['PenggantiLembur'] ?? '';
          rangkapJabatanController?.text = i['RangkapJabatan'] ?? '';
          teleponTransportController?.text = i['TeleponTransport'] ?? '';
          tunjanganTambahanSKController?.text = i['TunjanganTambahanSK'] ?? '';
          tunjanganKebersihanSOHO1815Controller?.text =
              i['TunjanganKebersihanSOHO1815'] ?? '';
          subtotalTunjanganTambahanController?.text =
              i['SubtotalTunjanganTambahan'] ?? '';
          subtotalGajiController?.text = i['SubtotalGaji'] ?? '';
          tunjanganPenggantiController?.text = i['TunjanganPengganti'] ?? '';
          tunjanganPerbantuanProyekController?.text =
              i['TunjanganPerbantuanProyek'] ?? '';
          kekuranganGajiBulanLaluController?.text =
              i['KekuranganGajiBulanLalu'] ?? '';
          pengembalianJaminanKontrakController?.text =
              i['PengembalianJaminanKontrak'] ?? '';
          dendaTerlambatController?.text = i['DendaTerlambat'] ?? '';
          pemotonganController?.text = i['Pemotongan'] ?? '';
          pemotonganBPJSController?.text = i['PemotonganBPJS'] ?? '';
          totalGajiController?.text = i['TotalGaji'] ?? '';
          jumlahLemburWajibController?.text = i['JumlahLemburWajib'] ?? '';
          terpenuhiTidakController?.text = i['TerpenuhiTidak'] ?? '';
          rekeningBankController?.text = i['RekeningBank'] ?? '';
          keteranganController?.text = i['Keterangan'] ?? '';
          kesesuaianSlipGajiController?.text = i['KesesuaianSlipGaji'] ?? '';
          rangkapProyekController?.text = i['RangkapProyek'] ?? '';

          notifyListeners();
        }
        notifyListeners();
      }
    } catch (e) {
      print("gett update data gaji karyawan ${e}");
    }
  }

  updateDataGajiKaryawan() async {
    try {
      setBusy(true);

      final Map<String, dynamic> data = {
        "EmployeeID": "${getemployeeID}",
        "GajiPokok":
            "${gajiPokokController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "Jabatan":
            "${jabatanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "Transportasi":
            "${transportasiController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "UangMakan":
            "${uangMakanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "SubtotalBaseHO":
            "${subtotalBaseHOController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TunjanganProyek":
            "${tunjanganProyekController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "EvaluasiKinerja":
            "${evaluasiKinerjaController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "PenggantiLembur":
            "${penggantiLemburController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "RangkapJabatan":
            "${rangkapJabatanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TeleponTransport":
            "${teleponTransportController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TunjanganTambahanSK":
            "${tunjanganTambahanSKController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TunjanganKebersihanSOHO1815":
            "${tunjanganKebersihanSOHO1815Controller?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "SubtotalTunjanganTambahan":
            "${subtotalGajiController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "SubtotalGaji":
            "${subtotalTunjanganTambahanController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TunjanganPengganti":
            "${tunjanganPenggantiController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TunjanganPerbantuanProyek":
            "${tunjanganPerbantuanProyekController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "KekuranganGajiBulanLalu":
            "${kekuranganGajiBulanLaluController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "PengembalianJaminanKontrak":
            "${pengembalianJaminanKontrakController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "DendaTerlambat":
            "${dendaTerlambatController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "Pemotongan":
            "${pemotonganController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "PemotonganBPJS":
            "${pemotonganBPJSController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TotalGaji":
            "${totalGajiController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "JumlahLemburWajib":
            "${jumlahLemburWajibController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "TerpenuhiTidak":
            "${terpenuhiTidakController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "RekeningBank":
            "${rekeningBankController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "Keterangan":
            "${keteranganController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
        "KesesuaianSlipGaji":
            "${kesesuaianSlipGajiController?.text.replaceAll(RegExp(r'[^0-9]'), '') ?? ''}",
      };

      print("data : ${data}");
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.patch(
          Uri.parse("${Networks.baseUrl}updateDataGajiKaryawan"),
          body: jsonEncode(data),
          headers: headers);

      if (response.statusCode == 200) {
        isUpdate = false;
        gajiPokokController?.clear();
        jabatanController?.clear();
        transportasiController?.clear();
        uangMakanController?.clear();
        subtotalBaseHOController?.clear();
        tunjanganProyekController?.clear();
        evaluasiKinerjaController?.clear();
        penggantiLemburController?.clear();
        rangkapJabatanController?.clear();
        teleponTransportController?.clear();
        tunjanganTambahanSKController?.clear();
        tunjanganKebersihanSOHO1815Controller?.clear();
        subtotalTunjanganTambahanController?.clear();
        subtotalGajiController?.clear();
        tunjanganPenggantiController?.clear();
        tunjanganPerbantuanProyekController?.clear();
        kekuranganGajiBulanLaluController?.clear();
        pengembalianJaminanKontrakController?.clear();
        dendaTerlambatController?.clear();
        pemotonganController?.clear();
        pemotonganBPJSController?.clear();
        totalGajiController?.clear();
        jumlahLemburWajibController?.clear();
        terpenuhiTidakController?.clear();
        rekeningBankController?.clear();
        keteranganController?.clear();
        kesesuaianSlipGajiController?.clear();

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
        getDataGajiKaryawan();
        notifyListeners();

        setBusy(false);
      } else {
        setBusy(false);
      }
    } catch (e) {
      print("Update Berhasil");
    }
  }

  value() async {
    employeeIDController?.text = '0';
    gajiPokokController?.text = '0';
    jabatanController?.text = '0';
    transportasiController?.text = '0';
    uangMakanController?.text = '0';
    subtotalBaseHOController?.text = '0';
    tunjanganProyekController?.text = '0';
    evaluasiKinerjaController?.text = '0';
    penggantiLemburController?.text = '0';
    rangkapJabatanController?.text = '0';
    teleponTransportController?.text = '0';
    tunjanganTambahanSKController?.text = '0';
    tunjanganKebersihanSOHO1815Controller?.text = '0';
    subtotalTunjanganTambahanController?.text = '0';
    subtotalGajiController?.text = '0';
    tunjanganPenggantiController?.text = '0';
    tunjanganPerbantuanProyekController?.text = '0';
    kekuranganGajiBulanLaluController?.text = '0';
    pengembalianJaminanKontrakController?.text = '0';
    dendaTerlambatController?.text = '0';
    pemotonganController?.text = '0';
    pemotonganBPJSController?.text = '0';
    totalGajiController?.text = '0';
    jumlahLemburWajibController?.text = '0';
    terpenuhiTidakController?.text = '0';
    rekeningBankController?.text = '0';
    keteranganController?.text = '0';
    kesesuaianSlipGajiController?.text = '0';
    crossCheck1Controller?.text = '0';
    crossCheck2Controller?.text = '0';
    crossCheck3Controller?.text = '0';
    revisiController?.text = '0';
    wilayahController?.text = '0';
  }

  @override
  Future futureToRun() async {
    // await value();
    await fetchDropdownData();
    await getDataGajiKaryawan();
  }
}
