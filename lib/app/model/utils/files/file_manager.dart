import 'dart:io';

abstract class FileManager {
  Future<String> uploadFile({required String path, required File file});
  Future<void> deleteFile({required String path});
}
