part of presentation.utils;

Future<String> convertFileToBase64(String path) async {
  return base64.encode(await File(path).readAsBytes());
}
