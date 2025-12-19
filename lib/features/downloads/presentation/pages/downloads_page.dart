import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/entities/download_item.dart';
import '../bloc/downloads_bloc.dart';
import '../bloc/downloads_event.dart';
import '../bloc/downloads_state.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  void initState() {
    super.initState();
    context.read<DownloadsBloc>().add(const LoadDownloads());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              context.read<DownloadsBloc>().add(
                const ClearCompletedDownloads(),
              );
            },
            tooltip: 'Clear Completed',
          ),
        ],
      ),
      body: BlocBuilder<DownloadsBloc, DownloadsState>(
        builder: (context, state) {
          if (state.status == DownloadsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.downloads.isEmpty) {
            return const Center(child: Text('No downloads yet'));
          }

          return ListView.separated(
            itemCount: state.downloads.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = state.downloads[index];
              return _DownloadTile(item: item);
            },
          );
        },
      ),
    );
  }
}

class _DownloadTile extends StatelessWidget {
  final DownloadItem item;

  const _DownloadTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildIcon(item.status),
      title: Text(item.filename, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.status == DownloadStatus.running)
            LinearProgressIndicator(value: item.progress),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(child: Text(_getStatusText(item))),
              if (item.status == DownloadStatus.completed)
                FutureBuilder<bool>(
                  future: File(item.path).exists(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data == false) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Chip(
                          label: Text(
                            'Missing',
                            style: TextStyle(fontSize: 10),
                          ),
                          visualDensity: VisualDensity.compact,
                          backgroundColor: Colors.redAccent,
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
            ],
          ),
        ],
      ),
      trailing: _buildActionButtons(context, item),
      isThreeLine: true,
      onTap: () => _handleTap(context),
      onLongPress: () => _handleLongPress(context),
    );
  }

  Future<void> _handleTap(BuildContext context) async {
    if (item.status == DownloadStatus.completed) {
      if (await File(item.path).exists()) {
        final result = await OpenFilex.open(item.path);
        if (result.type != ResultType.done) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not open file: ${result.message}')),
            );
          }
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File not found on device')),
          );
        }
      }
    }
  }

  void _handleLongPress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.open_in_new),
            title: const Text('Open'),
            onTap: () {
              Navigator.pop(context);
              _handleTap(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () async {
              Navigator.pop(context);
              if (await File(item.path).exists()) {
                await Share.shareXFiles([
                  XFile(item.path),
                ], text: item.filename);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('File not found')),
                  );
                }
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.copy),
            title: const Text('Copy Link'),
            onTap: () {
              Navigator.pop(context);
              Clipboard.setData(ClipboardData(text: item.url));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Link copied to clipboard')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              context.read<DownloadsBloc>().add(
                DeleteDownload(item.id, deleteFile: true),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.completed:
        return const Icon(Icons.check_circle, color: Colors.green);
      case DownloadStatus.failed:
        return const Icon(Icons.error, color: Colors.red);
      case DownloadStatus.running:
        return const Icon(Icons.downloading, color: Colors.blue);
      case DownloadStatus.paused:
        return const Icon(Icons.pause_circle, color: Colors.orange);
      default:
        return const Icon(Icons.file_present);
    }
  }

  String _getStatusText(DownloadItem item) {
    if (item.status == DownloadStatus.running ||
        item.status == DownloadStatus.paused) {
      final percentage = (item.progress * 100).toStringAsFixed(1);
      final downloaded = _formatBytes(item.receivedBytes);
      final total = item.totalBytes > 0 ? _formatBytes(item.totalBytes) : '?';
      return '$percentage% • $downloaded / $total';
    }
    if (item.status == DownloadStatus.completed) {
      return 'Completed • ${_formatBytes(item.totalBytes)}';
    }
    return item.status.name.toUpperCase();
  }

  String _formatBytes(int bytes) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var i = 0;
    double size = bytes.toDouble();
    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }
    return '${size.toStringAsFixed(1)} ${suffixes[i]}';
  }

  Widget _buildActionButtons(BuildContext context, DownloadItem item) {
    final bloc = context.read<DownloadsBloc>();

    if (item.status == DownloadStatus.running) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.pause),
            onPressed: () => bloc.add(PauseDownload(item.id)),
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () => bloc.add(CancelDownload(item.id)),
          ),
        ],
      );
    }
    if (item.status == DownloadStatus.paused) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => bloc.add(ResumeDownload(item.id)),
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () => bloc.add(CancelDownload(item.id)),
          ),
        ],
      );
    }
    if (item.status == DownloadStatus.failed ||
        item.status == DownloadStatus.canceled) {
      return IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () => bloc.add(RetryDownload(item.id)),
      );
    }
    // For completed, we rely on Long Press for Delete to keep UI clean, or show icon?
    // The previous implementation had a delete icon.
    // Let's keep the Delete icon for quick access, but maybe menu is enough?
    // User asked for "options like Copy, Share" on Long Press.
    // Keeping Delete icon is fine.
    if (item.status == DownloadStatus.completed) {
      return IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => bloc.add(DeleteDownload(item.id, deleteFile: true)),
      );
    }
    return const SizedBox.shrink();
  }
}
