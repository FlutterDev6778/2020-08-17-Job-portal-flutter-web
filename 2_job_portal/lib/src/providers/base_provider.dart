import 'package:universal_html/html.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';

abstract class BaseProvider {
  void dispose();
}

abstract class BaseFirebaseProvider extends BaseProvider {
  Future getDocumentData({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  });

  Stream<List<Map<String, dynamic>>> getDocumentsStream({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  });

  Future getDocumentDataWithChilCollection({
    @required String parentCollectionName,
    @required String childCollectionName,
    List<Map<String, dynamic>> parentWheres,
    List<Map<String, dynamic>> parentOrderby,
    int parentLimit,
    List<Map<String, dynamic>> childWheres,
    List<Map<String, dynamic>> childOrderby,
    int childLimit,
  });

  Stream<List<Stream<List<Map<String, dynamic>>>>> getDocumentsStreamWithChildCollection({
    @required String parentCollectionName,
    @required String childCollectionName,
    List<Map<String, dynamic>> parentWheres,
    List<Map<String, dynamic>> parentOrderby,
    int parentLimit,
    List<Map<String, dynamic>> childWheres,
    List<Map<String, dynamic>> childOrderby,
    int childLimit,
  });

  Future addDocument({
    @required String collectionName,
    @required Map<String, dynamic> data,
  });
  Future updateDocument({
    @required String collectionName,
    @required String id,
    @required Map<String, dynamic> data,
  });
  Future deleteDocument({
    @required String collectionName,
    @required String id,
  });
}

abstract class BaseStorageProvider extends BaseProvider {
  Future<String> uploadFileObject({@required String path, @required String fileName, @required File file});
  Future<String> uploadByteData({@required String path, @required String fileName, @required Uint8List byteData});
}
