import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  Future<void> _shareCV(BuildContext context) async {
    try {
      // 1. Get the ByteData from the asset
      const String assetPath = 'assets/cv/DuhaResumeFlutterDeveloper.pdf';
      final ByteData bytes = await rootBundle.load(assetPath);
      final List<int> list = bytes.buffer.asUint8List();

      // 2. Get a temporary directory
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = tempDir.path;
      
      // 3. Create a temporary file path
      final String fileName = assetPath.split('/').last; // Get filename from asset path
      final File file = File('$tempPath/$fileName');

      // 4. Write the ByteData to the temporary file
      await file.writeAsBytes(list, flush: true);

      // 5. Use share_plus to share the file
      // ignore: deprecated_member_use
      await Share.shareFiles(
          [file.path],
          text: 'Duha Abu Shanab - CV',
          subject: 'CV - Duha Abu Shanab' // Optional: Subject for email sharing
      );

      // Optional: Delete the temporary file after sharing if needed, 
      // but share_plus might need it to remain accessible briefly.
      // await file.delete();

    } catch (e) {
      print('Error sharing CV: $e');
      // Show a snackbar or dialog to the user about the error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not share CV. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.download),
      tooltip: 'Download/Share CV',
      onPressed: () => _shareCV(context),
    );
  }
}

