import 'package:askany_file_card/askany_file_card.dart';
import 'package:askany_file_card/colors/package_color.dart';
import 'package:askany_file_card/widgets/progress_circle.dart';
import 'package:flutter/material.dart';

class ButtonActionFile extends StatefulWidget {
  final String textOpen;
  final int percent;
  final bool isExist;
  final Function onTap;
  final FileBoxParamenters fileBoxParamenters;
  final int status;
  final String filePath;
  const ButtonActionFile({
    super.key,
    required this.textOpen,
    required this.percent,
    required this.isExist,
    required this.onTap,
    required this.fileBoxParamenters,
    required this.status,
    required this.filePath,
  });

  @override
  State<ButtonActionFile> createState() => _ButtonActionFileState();
}

class _ButtonActionFileState extends State<ButtonActionFile> {
  int statusDownload = 0;
  int percentDownload = 0;
  @override
  void initState() {
    super.initState();
    statusDownload = widget.status;
    percentDownload = widget.percent;
  }

  @override
  void didUpdateWidget(covariant ButtonActionFile oldWidget) {
    super.didUpdateWidget(oldWidget);
    statusDownload = widget.status;
    percentDownload = widget.percent;
  }

  @override
  Widget build(BuildContext context) {
    return buildButtonEnd();
  }

  Widget buildButtonEnd() {
    if (widget.isExist) {
      return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: widget.fileBoxParamenters.brightness == Brightness.dark
                ? backgroundOpenDark
                : backgroundOpenLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.textOpen,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: widget.fileBoxParamenters.brightness == Brightness.dark
                  ? colorOpenDark
                  : colorOpenLight,
            ),
          ),
        ),
      );
    } else {
      switch (widget.status) {
        case 2:
          return ProgressCircle(
            percentProgress: widget.percent,
            onActionTap: () {
              widget.onTap();
            },
          );
        case 3:
          return GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: widget.fileBoxParamenters.brightness == Brightness.dark
                    ? backgroundOpenDark
                    : backgroundOpenLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.textOpen,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: widget.fileBoxParamenters.brightness == Brightness.dark
                      ? colorOpenDark
                      : colorOpenLight,
                ),
              ),
            ),
          );
        case 5:
          return GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: Image.asset(
                'packages/askany_file_card/icons/ic_download.png',
                height: 17,
                width: 17,
                color: (widget.fileBoxParamenters.brightness == Brightness.dark
                    ? colorTitleFileDark
                    : colorTitleFileLight)),
          );
        default:
          return GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: Image.asset(
              'packages/askany_file_card/icons/ic_download.png',
              height: 17,
              width: 17,
              color: (widget.fileBoxParamenters.brightness == Brightness.dark
                  ? colorTitleFileDark
                  : colorTitleFileLight),
            ),
          );
      }
    }
  }
}
