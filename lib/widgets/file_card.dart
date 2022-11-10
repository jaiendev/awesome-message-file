import 'dart:io';
import 'dart:isolate';

import 'package:askany_file_card/colors/package_color.dart';
import 'package:askany_file_card/models/file_box_paramenters.dart';
import 'package:askany_file_card/models/string_of_file.dart';
import 'package:askany_file_card/widgets/button_download_file.dart';
import 'package:flutter/material.dart';

class FileCard extends StatefulWidget {
  final FileBoxParamenters fileBoxParamenters;
  final String filePath;
  final String textOpen;
  final double sizeTextTitle;
  final double sizeTextCapacity;
  final Color? colorIconDownload;
  final int? fileSize;
  final String? urlFile;
  const FileCard({
    super.key,
    required this.fileBoxParamenters,
    required this.filePath,
    this.textOpen = 'Mở',
    this.sizeTextCapacity = 12,
    this.sizeTextTitle = 15,
    this.colorIconDownload,
    this.fileSize,
    this.urlFile,
  });

  @override
  State<FileCard> createState() => _FileCardState();
}

class _FileCardState extends State<FileCard> {
  ReceivePort receivePort = ReceivePort();
  String taskID = '';
  int downloadStatus = 0;
  int percentProgress = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.fileBoxParamenters.brightness == Brightness.dark
                  ? const Color(0xFF393c47)
                  : const Color(0xFFE5E6EA),
              // : Colors.grey.shade300,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(9),
            child: Image.asset(
              StringOfFile().assetImage(filePath: widget.filePath),
              height: widget.fileBoxParamenters.iconSize,
              width: widget.fileBoxParamenters.iconSize,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringOfFile().getTitleFile(widget.filePath),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: widget.sizeTextTitle,
                    fontWeight: FontWeight.w600,
                    color: widget.fileBoxParamenters.colorTitle ??
                        (widget.fileBoxParamenters.brightness == Brightness.dark
                            ? colorTitleFileDark
                            : colorTitleFileLight),
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: widget.sizeTextCapacity,
                      color: widget.fileBoxParamenters.colorCapacity ??
                          (widget.fileBoxParamenters.brightness ==
                                  Brightness.dark
                              ? colorCapacityDark
                              : colorCapacityLight),
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${(widget.filePath.isEmpty ? '' : StringOfFile().getTypeFile(widget.filePath)).toString().toUpperCase()} - ',
                      ),
                      TextSpan(
                        text: widget.fileSize != null
                            ? StringOfFile().getSizeFromBytes(widget.fileSize!)
                            : ((widget.filePath.isEmpty
                                    ? 0
                                    : StringOfFile()
                                        .getFileSize(widget.filePath)))
                                .toString(),
                      ),
                      const TextSpan(
                        text: ' - 09/11/2022',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ButtonActionFile(
            textOpen: widget.textOpen,
            percent: percentProgress,
            isExist: (FileSystemEntity.typeSync(filePathUrl) !=
                    FileSystemEntityType.notFound) ||
                (FileSystemEntity.typeSync(widget.filePath) !=
                    FileSystemEntityType.notFound),
            onTap: () async {
              // await _handleOnTap();
            },
            fileBoxParamenters: widget.fileBoxParamenters,
            status: downloadStatus,
            filePath: (FileSystemEntity.typeSync(widget.filePath) !=
                    FileSystemEntityType.notFound)
                ? widget.filePath
                : filePathUrl,
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  String get filePathUrl {
    String directory = '/storage/emulated/0/Download/';
    if (widget.urlFile == null) {
      return '';
    } else {
      return '$directory${widget.urlFile!.split('/').last}';
    }
  }
}
