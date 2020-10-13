import 'package:flutter/material.dart';
import 'package:pdf_app/StateManagement/CurrentPage.dart';
import 'package:provider/provider.dart';

class SliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PdfController>(context);

    return Expanded(
      child: Consumer<PdfController>(
          builder: (context, controller, _) => Slider(
              value: controller.currentPage.toDouble(),
              max: controller.totalPages.toDouble(),
              min: 0,
              onChanged: (value) {
                _controller.currentPage = value.toInt();
                controller.pdfViewController.setPage(value.toInt());
              })),
    );
  }
}
