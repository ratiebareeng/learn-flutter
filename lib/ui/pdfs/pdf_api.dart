import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File> generateCenteredText(String text) async {
    final pdfDoc = pw.Document();

    pdfDoc.addPage(
      pw.Page(build: (context) {
        return pw.Center(
          child: pw.Text(
            text,
            style: pw.Theme.of(context).paragraphStyle.copyWith(
                  fontSize: 48,
                ),
          ),
        );
      }),
    );

    return saveDocument(name: 'my_example.pdf', pdf: pdfDoc);
  }

  static Future<File> saveDocument(
      {required String name, required pw.Document pdf}) async {
    // get bytes of pdf doc
    final bytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();
    // access file @ path
    File file = File('${directory.path}/$name');

    if (Platform.isWindows) {
      file = File(file.path.replaceAll('/', '\\'));
    }

    // write byte data to pdf file @ path
    file.writeAsBytes(bytes);

    return file;
  }

  static Future openPdf(File file) async {
    //  await OpenFile.open(file.path);
  }
}
