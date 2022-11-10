import 'package:askany_file_card/askany_file_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Example(
        brightness: Brightness.light,
      ),
    );
  }
}

class Example extends StatefulWidget {
  final Brightness brightness;
  const Example({Key? key, this.brightness = Brightness.light})
      : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List<String> listFile = [];
  Brightness? _brightness;

  Future<void> pickFileExcel() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          listFile.add(result.files.first.path.toString());
        });
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _brightness = widget.brightness;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: _brightness == Brightness.light
              ? const Color(0xFFF5F5F5)
              : const Color(0xFF14171A),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await pickFileExcel();
                      // ignore: use_build_context_synchronously
                      // Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.folder,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        if (_brightness == Brightness.dark) {
                          _brightness = Brightness.light;
                        } else {
                          _brightness = Brightness.dark;
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        _brightness == Brightness.dark
                            ? Icons.sunny
                            : Icons.dark_mode,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              FileCard(
                fileBoxParamenters: FileBoxParamenters(
                  brightness: _brightness!,
                  iconSize: 24,
                ),
                filePath: listFile.isNotEmpty ? listFile.last : '',
                fileSize: 123123,
                urlFile: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
