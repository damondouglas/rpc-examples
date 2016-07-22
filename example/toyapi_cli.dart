/// Example using client generated library of lib/toyapi.dart
/// Run:
/// $ bash tool/generate.sh
/// then
/// $ dart bin/shelf_sample.dart
/// before running this file.

import 'dart:async';
import 'package:toyapi/toyapi/0_1.dart' as toyapi;
import 'package:http/http.dart' as http;
import 'dart:io';

Future main(List<String> args) async {
  var client = new http.Client();
  var api = new toyapi.ToyApiApi(client, servicePath: 'api/toyApi/0.1/');
  var response = await api.helloNameAge("foo", 1);
  print(response.result);
  return exit(0);
}
