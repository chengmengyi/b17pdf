import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:path_provider/path_provider.dart';

class B17QxnDemoFileHepVza {
  B17QxnDemoFileHepVza._();

  static final B17QxnDemoFileHepVza instance = B17QxnDemoFileHepVza._();

  static const String _b17KqmDemoPdfAssetPathWze = 'assets/PDF_Demo.pdf';
  static const String _b17VqnDemoPdfFileNameTza = 'PDF_Demo.pdf';
  static const String _b17PqnDemoDirectoryNameVze = 'b16_demo_files';

  FileToolsFileInfo? _b17HqmDemoPdfInfoWza;

  Future<FileToolsFileInfo?> b17KqnGetDemoPdfInfoVxe() async {
    final FileToolsFileInfo? b17QxmCachedInfoVza = _b17HqmDemoPdfInfoWza;
    if (b17QxmCachedInfoVza != null &&
        File(b17QxmCachedInfoVza.path ?? '').existsSync()) {
      return b17QxmCachedInfoVza;
    }
    try {
      final File b17VqnDemoFileTza = await _b17RqmEnsureDemoPdfWza();
      final FileStat b17PqnFileStatVze = await b17VqnDemoFileTza.stat();
      _b17HqmDemoPdfInfoWza = FileToolsFileInfo(
        name: _b17VqnDemoPdfFileNameTza,
        type: FileToolsDocumentType.pdf,
        updateTime: b17PqnFileStatVze.modified.millisecondsSinceEpoch,
        size: b17PqnFileStatVze.size,
        path: b17VqnDemoFileTza.path,
      );
      return _b17HqmDemoPdfInfoWza;
    } catch (_) {
      return null;
    }
  }

  Future<File> _b17RqmEnsureDemoPdfWza() async {
    final Directory b17KqmDocumentsDirectoryWze =
        await getApplicationDocumentsDirectory();
    final Directory b17VqnDemoDirectoryTza = Directory(
      '${b17KqmDocumentsDirectoryWze.path}/$_b17PqnDemoDirectoryNameVze',
    );
    if (!b17VqnDemoDirectoryTza.existsSync()) {
      await b17VqnDemoDirectoryTza.create(recursive: true);
    }
    final File b17QxnDemoFileVza = File(
      '${b17VqnDemoDirectoryTza.path}/$_b17VqnDemoPdfFileNameTza',
    );
    if (b17QxnDemoFileVza.existsSync()) {
      return b17QxnDemoFileVza;
    }
    final ByteData b17HqmDemoBytesWza = await rootBundle.load(
      _b17KqmDemoPdfAssetPathWze,
    );
    await b17QxnDemoFileVza.writeAsBytes(
      b17HqmDemoBytesWza.buffer.asUint8List(),
      flush: true,
    );
    return b17QxnDemoFileVza;
  }
}
