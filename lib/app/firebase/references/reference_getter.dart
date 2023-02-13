import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

typedef AppCollectionGetter<T> = CollectionReference<T> Function();
typedef AppDocumentGetter<T> = DocumentReference<T> Function();
typedef AppStorageGetter<T> = Reference Function();
