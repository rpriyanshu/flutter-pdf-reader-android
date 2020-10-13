import 'package:flutter/foundation.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfController with ChangeNotifier{
  int _currentPage=0;
  int _totalPages=1;
  PDFViewController pdfViewController=null;

  int get totalPages => _totalPages;

  int get currentPage => _currentPage;

  set currentPage(int page)
  {
    print(page);
    notifyListeners();
    _currentPage=page;
  }

  set totalPages(int pages){
    notifyListeners();
    _totalPages=pages-1;
  }
}