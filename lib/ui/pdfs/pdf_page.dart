import 'package:flutter/material.dart';

import 'pdf_api.dart';
import 'pdf_paragraph_api.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate PDF'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                onPressed: () async {
                  final pdfFile =
                      await PdfApi.generateCenteredText('Dumelang!');

                  PdfApi.openPdf(pdfFile);
                },
                child: const Text('Simple PDF'),
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () async {
                  final pdfFile = await PdfParagraphApi.generatePDF();

                  PdfApi.openPdf(pdfFile);
                },
                child: const Text('Paragraphs PDF'),
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () async {},
                child: const Text('Table PDF'),
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () async {},
                child: const Text('Image PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
