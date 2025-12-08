import 'dart:typed_data';

Future<Uint8List?> fetchFileBytesImpl(String path) async {
  // Direct file path access is not supported on web.
  // URLs should be handled by the HTTP fetcher in the caller.
  return null;
}
