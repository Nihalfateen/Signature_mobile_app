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

//   static Future<void>downloadFile(String url,String fileName)async{
//
//     final task = DownloadTask(
//         url: url.replaceAll(" ", ""),
//         // urlQueryParameters: {'q': 'pizza'},
//         filename: fileName,
//         // headers: {'myHeader': 'value'},
//         directory: 'my_sub_directory',
//         updates: Updates.statusAndProgress, // request status and progress updates
//         requiresWiFi: true,
//         retries: 5,
//         allowPause: true,
//         // metaData: 'data for me'
//     );
//
// // Start download, and wait for result. Show progress and status changes
// // while downloading
//     final result = await FileDownloader().download(task,
//         onProgress: (progress) => print('Progress: ${progress * 100}%'),
//         onStatus: (status) => print('Status: $status')
//     );
//     FileDownloader().configureNotification(
//         running: const TaskNotification('Downloading', 'file: {filename}'),
//         progressBar: true);
//
//     FileDownloader().registerCallbacks(
//         taskNotificationTapCallback: (task, notificationType) {
//           print(notificationType.name);
//         },);
//
//     await FileDownloader().openFile(task: task);
//
// // Act on the result
//     switch (result) {
//       case TaskStatus.complete:
//         print('Success!');
//
//       case TaskStatus.canceled:
//         print('Download was canceled');
//
//       case TaskStatus.paused:
//         print('Download was paused');
//
//       default:
//         print('Download not successful');
//     }
//   }
}
