//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<File> _savedFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedFiles();
//   }
//
//   // Method to load saved files
//   Future<void> _loadSavedFiles() async {
//     final files = await _getSavedFiles();
//     setState(() {
//       _savedFiles = files;
//     });
//   }
//
//   // Method to get saved files from app's directory
//   Future<List<File>> _getSavedFiles() async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final List<FileSystemEntity> files = directory.listSync();
//       List<File> savedFiles = files
//           .where((entity) => entity is File)
//           .map((entity) => File(entity.path))
//           .toList();
//       return savedFiles;
//     } catch (e) {
//       print('Error getting saved files: $e');
//       return [];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saved Files'),
//       ),
//       body: _savedFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are being loaded
//           : ListView.builder(
//         itemCount: _savedFiles.length,
//         itemBuilder: (context, index) {
//           final file = _savedFiles[index];
//           return ListTile(
//             title: Text(path.basename(file.path)), // Display the file name
//             subtitle: Text(file.path), // Optionally, show the file path as a subtitle
//             leading: Icon(Icons.insert_drive_file),
//             onTap: () {
//               // Handle file tap here (open file or perform an action)
//               print('Tapped on: ${file.path}');
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class FileListScreen extends StatefulWidget {
  @override
  _FileListScreenState createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {
  List<File> _savedTxtFiles = [];

  @override
  void initState() {
    super.initState();
    _loadSavedTxtFiles();
  }

  // Method to load saved .txt files
  Future<void> _loadSavedTxtFiles() async {
    final files = await _getSavedTxtFiles();
    setState(() {
      _savedTxtFiles = files;
    });
  }

  // Method to get saved .txt files from app's directory
  Future<List<File>> _getSavedTxtFiles() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final List<FileSystemEntity> files = directory.listSync();
      List<File> savedTxtFiles = files
          .where((entity) =>
      entity is File && path.extension(entity.path) == '.txt') // Filter for .txt files
          .map((entity) => File(entity.path))
          .toList();
      return savedTxtFiles;
    } catch (e) {
      print('Error getting saved .txt files: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved .txt Files'),
      ),
      body: _savedTxtFiles.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are being loaded
          : ListView.builder(
        itemCount: _savedTxtFiles.length,
        itemBuilder: (context, index) {
          final file = _savedTxtFiles[index];
          return SizedBox(
            height: 102,
            child: Card(
              elevation: 4,
              child: Center(
                child: ListTile(
                  title: Text(path.basename(file.path),
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.black,
                        fontSize: 12.sp,
                      )), // Display the file name
                  trailing: SizedBox(
                    height: 180.h ,
                    child: ElevatedButton(
                      onPressed:(){}, // Call the upload method for non-uploaded files
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF0C7C3C),
                        ),
                      ),
                      child: Text(
                       'Sent to Holymicro',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),

                      ), // Button text based on status
                    ),
                  ),
                  onTap: () async {
                  },
                ),
              ),
            ),
          );


        },
      ),
    );
  }
}
