// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:file_saver/file_saver_web.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:open_file_web/open_file_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FileSaverWeb.registerWith(registrar);
  FluttertoastWebPlugin.registerWith(registrar);
  OpenFilePlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
