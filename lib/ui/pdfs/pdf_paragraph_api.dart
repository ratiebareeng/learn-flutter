import 'dart:io';
import 'dart:math';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'pdf_api.dart';

class PdfParagraphApi {
  static Future<File> generatePDF() async {
    final pdf = Document();

    // laod font
    /*  final font = Font.ttf(
      await rootBundle.load('assets/fonts/font_name.ttf'),
    ); */

    pdf.addPage(
      MultiPage(
        build: (context) {
          return [
            buildCustomHeader2(null),
            buildCustomHeader('A header'),
            Header(
              child: Text('PDF Headline'),
            ),
            buildLink(),
            ...buildBulletPoints(),
            Paragraph(
              text: LoremText(random: Random()).paragraph(60),
            ),
            Paragraph(
              text: 'Uses custom font',
              // style: TextStyle(font: font),
            ),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
          ];
        },
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            child: Text(text),
          );
        },
      ),
    );

    return PdfApi.saveDocument(
      name: 'paragraph.pdf',
      pdf: pdf,
    );
  }

  static Widget buildCustomHeader2(String? text) => Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: PdfColors.amber500,
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: [
            PdfLogo(),
            SizedBox(width: 0.5 * PdfPageFormat.cm),
            Text(
              text ?? 'Dumelang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: PdfColors.amber,
              ),
            )
          ],
        ),
      );

  static Widget buildCustomHeader(String text) => Header(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: PdfColors.white,
          ),
        ),
        decoration: const BoxDecoration(
          color: PdfColors.amber,
        ),
      );

  static List<Widget> buildBulletPoints() => [
        Bullet(text: 'First Point'),
        Bullet(text: 'Second Point'),
        Bullet(text: 'Third Point'),
      ];

  static Widget buildLink() => UrlLink(
        child: Text(
          'Click Here',
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: PdfColors.blue,
          ),
        ),
        destination: 'www.nalediapps.com',
      );
}
