// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<String>> uploadFilesToSupabaseNewEvolution(
    List<FFUploadedFile> files) async {
  final storage = Supabase.instance.client.storage;
  final bucketName = 'files';
  final directory = 'attachments/';

  List<Future<String>> uploadTasks = [];

  String sanitizeFileName(String fileName) {
    return fileName
        .replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_')
        .replaceAll(' ', '_');
  }

  for (final file in files) {
    final sanitizedFileName = sanitizeFileName(file.name ?? 'unnamed_file');
    final filePath = '$directory$sanitizedFileName';
    final fileBytes = file.bytes;

    if (fileBytes != null) {
      uploadTasks.add(storage
          .from(bucketName)
          .uploadBinary(filePath, fileBytes,
              fileOptions: FileOptions(upsert: true))
          .then((_) {
        return storage.from(bucketName).getPublicUrl(filePath);
      }));
    }
  }

  return await Future.wait(uploadTasks);
}

//a
