import 'package:flutter/material.dart';
import '../models/app_state.dart';
import '../services/page_navigation.dart';
import '../services/pdf_loader.dart';
import 'pdf_book_viewer.dart';

/// Import for NavigationControlsStyle

class NavigationControls extends StatelessWidget {
  final AppState appState;
  final PageNavigation pageNavigation;
  final PdfLoader pdfLoader;
  final TextEditingController pageController;
  final NavigationControlsStyle? style;

  const NavigationControls({
    Key? key,
    required this.appState,
    required this.pageNavigation,
    required this.pdfLoader,
    required this.pageController,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Previous button
              Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 20,
                  ),
                  onPressed: () => pageNavigation.navigateToPreviousPage(context),
                  tooltip: 'Previous Page',
                  splashRadius: 24,
                ),
              ),

              SizedBox(width: 16),

              /// Page Indicator
              Text(
                _getPageText(appState),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(width: 16),

              /// Next button
              Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 20,
                  ),
                  onPressed: () => pageNavigation.navigateToNextPage(context),
                  tooltip: 'Next Page',
                  splashRadius: 24,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getPageText(AppState appState) {
    final total = appState.document?.pagesCount ?? 0;
    if (total == 0) return '0 / 0';

    final currentSpread = appState.currentPage;

    if (currentSpread == 0) {
      return '1 / $total';
    }

    final startPage = currentSpread * 2;
    final endPage = startPage + 1;

    if (endPage > total) {
      return '$startPage / $total';
    }

    return '$startPage-$endPage / $total';
  }
}
