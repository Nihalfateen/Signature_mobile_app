import 'dart:io';

// import 'package:background_downloader/background_downloader.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class SystemFileManager {
  static Future convertResponseToFile(response,
      [dynamic fileName]) async {
    try {
      final Directory? appDir = Platform.isAndroid
          ? await getDownloadsDirectory()
          : await getApplicationDocumentsDirectory();
      String tempPath = appDir!.path;
      final String s = '${DateTime.now().microsecondsSinceEpoch}/$fileName';
      File file =  File('$tempPath/$s');
      if (!await file.exists()) {
        await file.create(recursive: true);
      }
      await file.writeAsBytes(response);
      Logger().i(file.path);
      await OpenFile.open(file.path);
    } on Exception {
      return null;
    }
  }

  static Future<void> openFile(File? file) async {
    await OpenFile.open(file!.path);
  }

}
