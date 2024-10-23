// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;
//
// import '../download-log/api-controller.dart';
// class LogScreen extends StatefulWidget {
//   const LogScreen({super.key});
//
//   @override
//   State<LogScreen> createState() => _LogScreenState();
// }
//
// class _LogScreenState extends State<LogScreen> {
//   List<File> _savedTxtFiles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedTxtFiles();
//   }
//
//   // Method to load saved .txt files
//   Future<void> _loadSavedTxtFiles() async {
//     final files = await _getSavedTxtFiles();
//     setState(() {
//       _savedTxtFiles = files;
//     });
//   }
//
//   // Method to get saved .txt files from app's directory
//   Future<List<File>> _getSavedTxtFiles() async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final List<FileSystemEntity> files = directory.listSync();
//       List<File> savedTxtFiles = files
//           .where((entity) =>
//       entity is File && path.extension(entity.path) == '.txt') // Filter for .txt files
//           .map((entity) => File(entity.path))
//           .toList();
//       return savedTxtFiles;
//     } catch (e) {
//       print('Error getting saved .txt files: $e');
//       return [];
//     }
//   }
//   final ApiController _apiController = ApiController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Color(0xFF198754),
//         title: Text('Logs', style: TextStyle(color: Colors.white)),
//         actions: [
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: TextButton(
//                 onPressed: () {
//                   // Action for the download button
//                   print('Download clicked');
//                   _apiController.handleRequests(context);
//                 },
//                 style: TextButton.styleFrom(
//                   backgroundColor: Color(0xFFF4EA12), // Background color of the button
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0), // Rounded corners
//                   ),
//                 ),
//                 child: Text(
//                   'Download',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: "Roboto",
//                     fontSize: 12.sp,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: _savedTxtFiles.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loading indicator while files are being loaded
//           : ListView.builder(
//         itemCount: _savedTxtFiles.length,
//         itemBuilder: (context, index) {
//           final file = _savedTxtFiles[index];
//           return SizedBox(
//             height: 102,
//             child: Card(
//               elevation: 4,
//               child: Center(
//                 child: ListTile(
//                   title: Text(
//                     path.basename(file.path),
//                     style: TextStyle(
//                       fontFamily: "Roboto",
//                       color: Colors.black,
//                       fontSize: 12.sp,
//                     ),
//                   ), // Display the file name
//                   trailing: SizedBox(
//                     height: 180.h,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Call the upload method for non-uploaded files
//                         print('Sent to Holymicro: ${file.path}');
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color(0xFF0C7C3C),
//                         ),
//                       ),
//                       child: Text(
//                         'Sent to Holymicro',
//                         style: TextStyle(
//                           fontFamily: "Roboto",
//                           color: Colors.white,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                   onTap: () async {
//                     // Handle the tap to open the file
//                   },
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../download-log/api-controller.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  List<File> _savedTxtFiles = [];
  final ApiController _apiController = ApiController();

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
              entity is File &&
              path.extension(entity.path) == '.txt') // Filter for .txt files
          .map((entity) => File(entity.path))
          .toList();
      return savedTxtFiles;
    } catch (e) {
      print('Error getting saved .txt files: $e');
      return [];
    }
  }

  void _handleDownload() async {
    // Action for the download button
    print('Download clicked');

    // Perform the download operation
    await _apiController.handleRequests(context);

    // Refresh the list of saved .txt files
    await _loadSavedTxtFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF198754),
        title: Text('Logs', style: TextStyle(color: Colors.white)),
        // bottom: PreferredSize(
        //   preferredSize: Size(MediaQuery.of(context).size.width, 90),
        //   child: Center( // Center the button within the PreferredSize
        //     child: Padding(
        //       padding: const EdgeInsets.only(
        //         bottom: 20.0,
        //         left: 20.0,
        //         right: 20.0
        //       ),
        //       child: SizedBox(
        //         height: 80.h,
        //         width: 400.w,
        //         child: TextButton(
        //           style: ButtonStyle(
        //         backgroundColor: MaterialStateProperty.all<Color>(
        //             const Color(0xFFF4EA12),
        //                   ),
        //                 ),
        //           onPressed: () {
        //             _handleDownload();
        //             print('Download Log Files');
        //           },
        //
        //           child: Text(
        //             'Download Log Files',
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontFamily: "Roboto",
        //               fontSize: 16, // Adjust font size as needed
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),

        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: _handleDownload, // Call the handleDownload method
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFF4EA12),
                  // Background color of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Text(
                  'Download',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _savedTxtFiles.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while files are being loaded
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
                        title: Text(
                          path.basename(file.path),
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        ), // Display the file name
                        trailing: SizedBox(
                          height: 80.h,
                          child: ElevatedButton(
                            onPressed: () {
                              // Call the upload method for non-uploaded files
                              print('Sent to Holymicro: ${file.path}');
                            },
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
                            ),
                          ),
                        ),
                        onTap: () async {
                          // Handle the tap to open the file
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
