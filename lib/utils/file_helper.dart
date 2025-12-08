import 'dart:typed_data';

import 'file_helper_io.dart' if (dart.library.html) 'file_helper_web.dart';

/// Fetches bytes from a local file path.
///
/// On mobile/desktop (IO), this uses `dart:io`'s `File`.
/// On web, this will return `null` as direct file path access is not supported
/// in the same way, or it can be implemented to handle blob URLs if needed.
Future<Uint8List?> fetchFileBytes(String path) {
  return fetchFileBytesImpl(path);
}
