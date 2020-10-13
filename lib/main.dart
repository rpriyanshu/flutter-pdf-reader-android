import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:pdf_app/StateManagement/CurrentPage.dart';
import 'package:pdf_app/screens/PdfViewingPage.dart';
import 'dart:io';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pdf Reader',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Pdf Reader'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  String _path;

  void _openFileExplorer(context) async {

      try {


        FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['pdf'],);
        if(result != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewingPage(result.files.single.path)));
        }

      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Select Pdf File by clicking on floating + button to View")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:  () => _openFileExplorer(context),

          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
