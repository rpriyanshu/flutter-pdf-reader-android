import 'package:flutter/material.dart';
import 'package:pdf_app/StateManagement/CurrentPage.dart';
import 'package:pdf_app/widgets/PdfView.dart';
import 'package:pdf_app/widgets/SliderWidget.dart';
import 'package:provider/provider.dart';

class PdfViewingPage extends StatelessWidget {
  final String path;
  PdfViewingPage(this.path);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => PdfController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pdf Reader"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PdfView(path),
              SliderWidget(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
