import 'package:download_button/services/download_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key? key, required this.url}) : super(key: key);

  final String url;

  Future<void> _downloadFile() async {
    DownloadService downloadService =
        kIsWeb ? WebDownloadService() : MobileDownloadService();
    await downloadService.download(url: url);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _downloadFile,
      icon: const Icon(Icons.download),
      label: const Text('Download'),
    );
  }
}
