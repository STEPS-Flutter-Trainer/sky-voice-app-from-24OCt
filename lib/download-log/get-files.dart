//18
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _files = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final List<FileSystemEntity> files = directory.listSync();
//
//     setState(() {
//       _files = files; // Update the state with the list of files
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Documents Directory Files'),
//       ),
//       body: _files.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _files.length,
//         itemBuilder: (context, index) {
//           final file = _files[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // You can add functionality to open the file or perform other actions here
//             },
//           );
//         },
//       ),
//     );
//   }
// }

//18
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _localFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLocalFiles();
//   }
//
//   Future<void> _loadLocalFiles() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final List<FileSystemEntity> files = directory.listSync();
//
//     setState(() {
//       _localFiles = files; // Update the state with the list of local files
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Documents Directory Files'),
//       ),
//       body: _localFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _localFiles.length,
//         itemBuilder: (context, index) {
//           final file = _localFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file in another app
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     // This might require platform-specific implementation using MethodChannels
//
//     // Example: Open with the default application
//     // Not implemented here since Flutter does not provide a direct way to open files
//     // You might need to use `url_launcher` or another method to handle this
//
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }
//Pick from iClod
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// class FilePickerScreen extends StatefulWidget {
//   @override
//   _FilePickerScreenState createState() => _FilePickerScreenState();
// }
//
// class _FilePickerScreenState extends State<FilePickerScreen> {
//   List<String> _selectedFiles = [];
//
//   Future<void> _pickFiles() async {
//     try {
//       // Open the file picker dialog
//       final result = await FilePicker.platform.pickFiles(
//         allowMultiple: true, // Allow multiple file selection
//         type: FileType.any, // You can specify the file type if needed
//       );
//
//       if (result != null) {
//         setState(() {
//           // Store the paths of the selected files
//           _selectedFiles = result.paths.where((path) => path != null).cast<String>().toList();
//         });
//       }
//     } catch (e) {
//       print('Error picking files: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Files from iCloud'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.upload_file),
//             onPressed: _pickFiles, // Call the file picker when the button is pressed
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: _selectedFiles.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_selectedFiles[index].split('/').last), // Display the file name
//             subtitle: Text(_selectedFiles[index]), // Display the full path
//           );
//         },
//       ),
//     );
//   }
// }


//FRom Doc
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _localFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLocalFiles();
//   }
//
//   Future<void> _loadLocalFiles() async {
//     try {
//       // Get both application documents directory and temporary directory
//       final documentsDirectory = await getApplicationDocumentsDirectory();
//       final tempDirectory = await getTemporaryDirectory();
//
//       // Load files from both directories
//       final List<FileSystemEntity> documentsFiles = documentsDirectory.listSync();
//       final List<FileSystemEntity> tempFiles = tempDirectory.listSync();
//
//       setState(() {
//         // Combine both lists of files
//         _localFiles = [...documentsFiles, ...tempFiles];
//       });
//     } catch (e) {
//       print('Error loading files: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Documents and Temp Directory Files'),
//       ),
//       body: _localFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _localFiles.length,
//         itemBuilder: (context, index) {
//           final file = _localFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file in another app
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     // This might require platform-specific implementation using MethodChannels
//
//     // Example: Open with the default application
//     // Not implemented here since Flutter does not provide a direct way to open files
//     // You might need to use `url_launcher` or another method to handle this
//
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }
//Get from cache
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _localFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLocalFiles();
//   }
//
//   Future<void> _loadLocalFiles() async {
//     try {
//       // Get the temporary directory
//       final tempDirectory = await getTemporaryDirectory();
//
//       // Load files from the temporary directory
//       final List<FileSystemEntity> tempFiles = tempDirectory.listSync();
//
//       setState(() {
//         // Update the state with the list of files from the temp directory
//         _localFiles = tempFiles;
//       });
//     } catch (e) {
//       print('Error loading files: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Temporary Directory Files'),
//       ),
//       body: _localFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _localFiles.length,
//         itemBuilder: (context, index) {
//           final file = _localFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file in another app
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     // This might require platform-specific implementation using MethodChannels
//
//     // Example: Open with the default application
//     // Not implemented here since Flutter does not provide a direct way to open files
//     // You might need to use `url_launcher` or another method to handle this
//
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }
//Get from all
//18
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _txtFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadTxtFiles();
//   }
//
//   Future<void> _loadTxtFiles() async {
//     try {
//       // Get the application's Documents directory
//       final documentsDirectory = await getApplicationDocumentsDirectory();
//       // Get the temporary directory
//       final tempDirectory = await getTemporaryDirectory();
//
//       // Load files from both directories
//       final List<FileSystemEntity> documentsFiles = documentsDirectory.listSync();
//       final List<FileSystemEntity> tempFiles = tempDirectory.listSync();
//
//       // Combine files from both directories and filter for .txt files
//       final List<FileSystemEntity> allFiles = [...documentsFiles, ...tempFiles];
//       final List<FileSystemEntity> txtFiles = allFiles.where((file) {
//         return file is File && file.path.endsWith('.txt');
//       }).toList();
//
//       setState(() {
//         _txtFiles = txtFiles; // Update the state with the list of .txt files
//       });
//     } catch (e) {
//       print('Error loading files: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Files'),
//       ),
//       body: _txtFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _txtFiles.length,
//         itemBuilder: (context, index) {
//           final file = _txtFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     // This might require platform-specific implementation using MethodChannels
//
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }


// //icloud/doc
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _allFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     try {
//       // Get the application's Documents directory
//       final documentsDirectory = await getApplicationDocumentsDirectory();
//       // Get the temporary directory
//       final tempDirectory = await getTemporaryDirectory();
//
//       // Load files from both directories
//       final List<FileSystemEntity> documentsFiles = documentsDirectory.listSync();
//       final List<FileSystemEntity> tempFiles = tempDirectory.listSync();
//
//       // Specify additional directory to include files from
//       final additionalDirectoryPath = '/var/mobile/Containers/Data/Application/F8DB19B7-6E98-4717-B2B5-D9222EE0D6A0/Documents/';
//       final additionalDirectory = Directory(additionalDirectoryPath);
//       final List<FileSystemEntity> additionalFiles = additionalDirectory.existsSync()
//           ? additionalDirectory.listSync()
//           : []; // Check if the directory exists before listing files
//
//       // Combine files from all directories
//       final List<FileSystemEntity> allFiles = [
//         ...documentsFiles,
//         ...tempFiles,
//         ...additionalFiles,
//       ];
//
//       setState(() {
//         _allFiles = allFiles; // Update the state with the list of all files
//       });
//     } catch (e) {
//       print('Error loading files: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All Files'),
//       ),
//       body: _allFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _allFiles.length,
//         itemBuilder: (context, index) {
//           final file = _allFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }
//doc only txt
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _txtFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     try {
//       // Get the application's Documents directory
//       final documentsDirectory = await getApplicationDocumentsDirectory();
//       // Get the temporary directory
//       final tempDirectory = await getTemporaryDirectory();
//
//       // Load files from both directories
//       final List<FileSystemEntity> documentsFiles = documentsDirectory.listSync();
//       final List<FileSystemEntity> tempFiles = tempDirectory.listSync();
//
//       // Specify additional directory to include files from
//       final additionalDirectoryPath = '/var/mobile/Containers/Data/Application/F8DB19B7-6E98-4717-B2B5-D9222EE0D6A0/Documents/';
//       final additionalDirectory = Directory(additionalDirectoryPath);
//       final List<FileSystemEntity> additionalFiles = additionalDirectory.existsSync()
//           ? additionalDirectory.listSync()
//           : []; // Check if the directory exists before listing files
//
//       // Filter for .txt files only
//       final List<FileSystemEntity> txtFiles = [
//         ...documentsFiles.where((file) => file.path.endsWith('.txt')),
//         ...tempFiles.where((file) => file.path.endsWith('.txt')),
//         ...additionalFiles.where((file) => file.path.endsWith('.txt')),
//       ];
//
//       setState(() {
//         _txtFiles = txtFiles; // Update the state with the list of .txt files
//       });
//     } catch (e) {
//       print('Error loading files: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Files'),
//       ),
//       body: _txtFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _txtFiles.length,
//         itemBuilder: (context, index) {
//           final file = _txtFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }
//
//pick and load
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:file_picker/file_picker.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _txtFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     try {
//       // Get the application's Documents directory
//       final documentsDirectory = await getApplicationDocumentsDirectory();
//       // Get the temporary directory
//       final tempDirectory = await getTemporaryDirectory();
//
//       // Load files from both directories
//       final List<FileSystemEntity> documentsFiles = documentsDirectory.listSync();
//       final List<FileSystemEntity> tempFiles = tempDirectory.listSync();
//
//       // Filter for .txt files only
//       final List<FileSystemEntity> txtFiles = [
//         ...documentsFiles.where((file) => file.path.endsWith('.txt')),
//         ...tempFiles.where((file) => file.path.endsWith('.txt')),
//       ];
//
//       setState(() {
//         _txtFiles = txtFiles; // Update the state with the list of .txt files
//       });
//
//       // Load files from iCloud Drive using file picker
//       _loadFilesFromICloud();
//     } catch (e) {
//       print('Error loading files: $e');
//     }
//   }
//
//   Future<void> _loadFilesFromICloud() async {
//     // Open file picker to select files from iCloud Drive
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['txt'],
//     );
//
//     if (result != null && result.paths.isNotEmpty) {
//       setState(() {
//         _txtFiles.addAll(result.paths.map((path) => File(path!))); // Add selected files to the list
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Files'),
//       ),
//       body: _txtFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _txtFiles.length,
//         itemBuilder: (context, index) {
//           final file = _txtFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }
//onlu doc
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileListScreen extends StatefulWidget {
  @override
  _FileListScreenState createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {
  List<FileSystemEntity> _txtFiles = [];

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    try {
      // Get the application's Documents directory
      final documentsDirectory = await getApplicationDocumentsDirectory();
      // Get the temporary directory
      final tempDirectory = await getTemporaryDirectory();

      // Load files from both directories
      final List<FileSystemEntity> documentsFiles = documentsDirectory.listSync();
      final List<FileSystemEntity> tempFiles = tempDirectory.listSync();

      // Filter for .txt files only
      final List<FileSystemEntity> txtFiles = [
        ...documentsFiles.where((file) => file.path.endsWith('.txt')),
        ...tempFiles.where((file) => file.path.endsWith('.txt')),
      ];

      setState(() {
        _txtFiles = txtFiles; // Update the state with the list of .txt files
      });

      // Check for files in iCloud, if accessible to the app (example path)
      // Note: This is a hypothetical approach. You still need user input to get files from iCloud.
      final iCloudPath = '/private/var/mobile/Containers/Data/Application/F8DB19B7-6E98-4717-B2B5-D9222EE0D6A0/Documents/';
      final iCloudFiles = Directory(iCloudPath).listSync();
      final List<FileSystemEntity> iCloudTxtFiles = iCloudFiles.where((file) => file.path.endsWith('.txt')).toList();

      setState(() {
        _txtFiles.addAll(iCloudTxtFiles); // Update the list with iCloud .txt files
      });

    } catch (e) {
      print('Error loading files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Files'),
      ),
      body: _txtFiles.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
          : ListView.builder(
        itemCount: _txtFiles.length,
        itemBuilder: (context, index) {
          final file = _txtFiles[index];
          return ListTile(
            title: Text(file.path.split('/').last), // Display the file name
            subtitle: Text(file.path),
            onTap: () {
              // Add functionality to open the file
              _openFile(file);
            },
          );
        },
      ),
    );
  }

  Future<void> _openFile(FileSystemEntity file) async {
    // Logic to open the file with the system file viewer
    print('Open file: ${file.path}'); // Placeholder for opening file
  }
}

//pick doc print path
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:file_picker/file_picker.dart';
//
// class FileListScreen extends StatefulWidget {
//   @override
//   _FileListScreenState createState() => _FileListScreenState();
// }
//
// class _FileListScreenState extends State<FileListScreen> {
//   List<FileSystemEntity> _txtFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     try {
//       // Get the application's Documents directory
//       final documentsDirectory = await getApplicationDocumentsDirectory();
//       // Get the temporary directory
//       final tempDirectory = await getTemporaryDirectory();
//
//       // Load files from both directories
//       final List<FileSystemEntity> documentsFiles = documentsDirectory.listSync();
//       final List<FileSystemEntity> tempFiles = tempDirectory.listSync();
//
//       // Filter for .txt files only
//       final List<FileSystemEntity> txtFiles = [
//         ...documentsFiles.where((file) => file.path.endsWith('.txt')),
//         ...tempFiles.where((file) => file.path.endsWith('.txt')),
//       ];
//
//       setState(() {
//         _txtFiles = txtFiles; // Update the state with the list of .txt files
//       });
//
//       // Load files from iCloud Drive using file picker
//       await _loadFilesFromICloud();
//     } catch (e) {
//       print('Error loading files: $e');
//     }
//   }
//
//   Future<void> _loadFilesFromICloud() async {
//     // Open file picker to select files from iCloud Drive
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['txt'],
//     );
//
//     if (result != null && result.paths.isNotEmpty) {
//       // Print the paths of the picked files to the console
//       for (var path in result.paths) {
//         if (path != null) {
//           print('Picked file path: $path'); // Log the picked file path
//           _txtFiles.add(File(path)); // Add selected files to the list
//         }
//       }
//       setState(() {
//         // Update the state to reflect the new files added
//       });
//     } else {
//       print('No files picked'); // Log if no files were picked
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Files'),
//       ),
//       body: _txtFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are loading
//           : ListView.builder(
//         itemCount: _txtFiles.length,
//         itemBuilder: (context, index) {
//           final file = _txtFiles[index];
//           return ListTile(
//             title: Text(file.path.split('/').last), // Display the file name
//             subtitle: Text(file.path),
//             onTap: () {
//               // Add functionality to open the file
//               _openFile(file);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _openFile(FileSystemEntity file) async {
//     // Logic to open the file with the system file viewer
//     print('Open file: ${file.path}'); // Placeholder for opening file
//   }
// }  Future<void> _openFile(FileSystemEntity file) async {
//   // Logic to open the file with the system file viewer
//   print('Open file: ${file.path}'); // Placeholder for opening file
// }
// }

