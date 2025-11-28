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
    final controlStyle = style ?? NavigationControlsStyle();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          controlStyle.shadow ??
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Previous button
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
            onPressed: () => pageNavigation.navigateToPreviousPage(context),
            tooltip: 'Previous Page',
          ),

          SizedBox(width: 16),

          /// Page Indicator
          Text(
            '${appState.currentPage + 1} / ${appState.document?.pagesCount ?? 0}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(width: 16),

          /// Next button
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20),
            onPressed: () => pageNavigation.navigateToNextPage(context),
            tooltip: 'Next Page',
          ),
        ],
      ),
    );
  }
}
