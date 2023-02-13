import 'dart:async';
import 'dart:io';

import 'package:dietx/app/firebase/references/reference_getter.dart';
import 'package:dietx/app/model/utils/files/file_manager.dart';
import 'package:uuid/uuid.dart';

class FileManagerImpl implements FileManager {
  final AppStorageGetter _ref;

  FileManagerImpl(this._ref);

  @override
  Future<String> uploadFile({
    required String path,
    required File file,
  }) async {
    final String fileExtension = file.path.split('.').last;
    final String id = const Uuid().v1();
    return _ref().child('$path/$id.$fileExtension').putFile(file).then<String>(
          (snapshot) => snapshot.ref.getDownloadURL(),
        );
  }

  @override
  Future<void> deleteFile({required String path}) {
    return _ref().child(path).delete().then<void>((_) => null);
  }
}
