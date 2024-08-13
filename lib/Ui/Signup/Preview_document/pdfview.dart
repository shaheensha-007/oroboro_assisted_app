import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerPage extends StatefulWidget {
  final String convertbase;

  const PDFViewerPage({super.key, required this.convertbase});

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? filePath;

  @override
  void initState() {
    super.initState();
    _writeToFile(widget.convertbase);
  }

  Future<void> _writeToFile(String base64String) async {
    final bytes = base64.decode(base64String);
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/example.pdf');
    await file.writeAsBytes(bytes);
    setState(() {
      filePath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Center(
        child: filePath != null
            ? PDFView(
          filePath: filePath!,
          // You can adjust the display options here
          enableSwipe: true,
          autoSpacing: false,
          pageFling: false,
          pageSnap: true,
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
