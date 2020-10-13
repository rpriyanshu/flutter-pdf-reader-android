import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:pdf_app/StateManagement/CurrentPage.dart';

class PdfView extends StatelessWidget {
  final String path;

  PdfView(this.path);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PdfController>(context);



    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          PDFView(
            filePath: path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: 0,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            // if set to true the link is handled in flutter
            onRender: (_pages) {
              print(_pages);
              _controller.totalPages = _pages;
            },
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.pdfViewController = pdfViewController;

            },
            onLinkHandler: (String uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int page, int total) {
              _controller.currentPage = page;
            },
          ),
        ],
      ),
    );
  }
}
