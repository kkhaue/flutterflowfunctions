// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:file_picker/file_picker.dart';

Future<List<FFUploadedFile>?> filePicker(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.any,
  );

  if (result != null) {
    List<FFUploadedFile> uploadedFiles = result.files
        .map((file) => FFUploadedFile(
              name: file.name,
              bytes: file.bytes,
            ))
        .toList();

    return uploadedFiles;
  } else {
    return [];
  }
}

//a
