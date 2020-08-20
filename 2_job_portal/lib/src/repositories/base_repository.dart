import 'package:flutter/material.dart';

abstract class BaseRepository {
  void dispose();

  Future<dynamic> addDocument({@required String collectionName, @required Map<String, dynamic> data});

  Future<dynamic> updateDocument({@required String collectionName, @required String id, @required Map<String, dynamic> data});

  Future<dynamic> deleteDocument({@required String collectionName, @required String id});

  Stream<List<Map<String, dynamic>>> getDocumentsStream({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  });

  Future getDocumentData({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  });
}
