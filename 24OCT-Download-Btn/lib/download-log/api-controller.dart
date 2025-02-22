import 'package:flutter/material.dart';
import 'api-service.dart';

class ApiController {
  final ApiService _apiService = ApiService();

  // Function to handle the full workflow
  Future<void> handleRequests(BuildContext context) async {
    try {
      // First request: Check registration status
      final regResponse = await _apiService.regStatusCheck();
      if (regResponse.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('First request successful')));

        // Second request: Post maintenance login
        final loginResponse = await _apiService.postMaintenanceLogin();
        if (loginResponse.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login successful')));

          // Define file suffix for the third request
          String file_suffix = 'file_suffix'; // Replace with actual file suffix if needed

          // Third request: Download log files
          final downloadResponse = await _apiService.postLogfile(file_suffix);
          if (downloadResponse.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Log file downloaded successfully')));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to download log files: ${downloadResponse.statusCode}')));
          }
        } else {
          // Login failed
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login failed: ${loginResponse.statusCode}')));
        }
      } else {
        // Registration check failed
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to check registration status: ${regResponse.statusCode}')));
      }
    } catch (e) {
      // Catch and display any errors
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')));
    }
  }
}
