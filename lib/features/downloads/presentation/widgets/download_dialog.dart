import 'package:flutter/material.dart';

class DownloadDialog extends StatefulWidget {
  final String url;
  final String suggestedFilename;
  final String downloadPath;

  const DownloadDialog({
    super.key,
    required this.url,
    required this.suggestedFilename,
    required this.downloadPath,
  });

  @override
  State<DownloadDialog> createState() => _DownloadDialogState();
}

class _DownloadDialogState extends State<DownloadDialog> {
  late TextEditingController _filenameController;

  @override
  void initState() {
    super.initState();
    _filenameController = TextEditingController(text: widget.suggestedFilename);
  }

  @override
  void dispose() {
    _filenameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Start Download'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'URL: ${widget.url}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Save to: ${widget.downloadPath}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _filenameController,
            decoration: const InputDecoration(
              labelText: 'Filename',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context, _filenameController.text);
          },
          child: const Text('Download'),
        ),
      ],
    );
  }
}
