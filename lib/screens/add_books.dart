import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFromLocalStorage extends StatefulWidget {
  const AddFromLocalStorage({super.key});

  @override
  State<AddFromLocalStorage> createState() => _AddFromLocalStorageState();
}

class _AddFromLocalStorageState extends State<AddFromLocalStorage> {
  String? result;

  @override
  void initState() {
    super.initState();
    _loadPathDir();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                  color: Colors.blueGrey[100],
                  width: 350,
                  height: 50,
                  alignment: Alignment.center,
                  child: result != null
                      ? Text(result.toString())
                      : const Text("No Directory is Selected")),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => _selectFolder(context),
                  child: const Text("Change Folder"))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectFolder(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? path = await FilePicker.platform.getDirectoryPath();
    setState(() {
      result = path;
      prefs.setString('dir_path', path!);
    });
  }

  _loadPathDir() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      result = prefs.getString('dir_path');
    });
  }
}
