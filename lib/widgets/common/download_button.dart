import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  Future<void> _downloadCV(BuildContext context) async {
    try {
      // 1. Request storage permission (only required for Android)
      if (Platform.isAndroid) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Storage permission denied')),
          );
          return;
        }
      }

      // 2. Load PDF asset
      const String assetPath = 'assets/cv/DuhaResumeFlutterDeveloper.pdf';
      final ByteData bytes = await rootBundle.load(assetPath);
      final List<int> list = bytes.buffer.asUint8List();

      // 3. Determine appropriate download path
      Directory? downloadDir;
      if (Platform.isAndroid) {
        downloadDir = Directory('/storage/emulated/0/Download');
      } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        downloadDir = await getDownloadsDirectory();
      } else if (Platform.isIOS) {
        downloadDir = await getApplicationDocumentsDirectory();
      } else {
        throw UnsupportedError('Unsupported platform');
      }

      if (downloadDir == null) {
        throw Exception('Could not access downloads folder');
      }

      // 4. Save file to the download directory
      final String filePath = '${downloadDir.path}/DuhaResumeFlutterDeveloper.pdf';
      final File file = File(filePath);
      await file.writeAsBytes(list, flush: true);

      // 5. Notify user of success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('CV downloaded to: ${file.path}')),
      );
    } catch (e) {
      print('Error downloading CV: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download CV.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.download),
      tooltip: 'Download CV',
      onPressed: () => _downloadCV(context),
    );
  }
}
