import 'package:flutter/foundation.dart';
import '../services/pdf_loader.dart';

/// Controller for programmatically controlling the [PdfBookViewer]
class PdfBookController extends ChangeNotifier {
  PdfLoader? _pdfLoader;

  /// Internal use only: attaches the loader to the controller
  void attach(PdfLoader loader) {
    _pdfLoader = loader;
  }

  /// Internal use only: detaches the loader
  void detach() {
    _pdfLoader = null;
  }

  /// Navigates to a specific page index (0-based)
  Future<void> setPage(int pageIndex) async {
    if (_pdfLoader == null) {
      debugPrint('PdfBookController: No PDF loaded yet');
      return;
    }
    await _pdfLoader!.navigateToPage(pageIndex);
  }

  /// Returns the total number of pages in the document
  /// Returns 0 if no document is loaded
  int get pageCount {
    return _pdfLoader?.appState.document?.pagesCount ?? 0;
  }

  /// Returns the current page index (0-based)
  int get currentPage {
    return _pdfLoader?.appState.currentPage ?? 0;
  }
}
