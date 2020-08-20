import 'package:flutter/material.dart';
import 'package:job_portal/src/providers/index.dart';

import './index.dart';

class FirebaseRepository extends BaseRepository {
  BaseFirebaseProvider firebaseProvider = FirebaseProvider();

  Future<dynamic> addDocument({@required String collectionName, @required Map<String, dynamic> data}) =>
      firebaseProvider.addDocument(collectionName: collectionName, data: data);

  Future<dynamic> updateDocument({@required String collectionName, @required String id, @required Map<String, dynamic> data}) =>
      firebaseProvider.updateDocument(collectionName: collectionName, id: id, data: data);

  Future<dynamic> deleteDocument({@required String collectionName, @required String id}) =>
      firebaseProvider.deleteDocument(collectionName: collectionName, id: id);

  Stream<List<Map<String, dynamic>>> getDocumentsStream({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) =>
      firebaseProvider.getDocumentsStream(collectionName: collectionName, wheres: wheres, orderby: orderby, limit: limit);

  Future getDocumentData({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) =>
      firebaseProvider.getDocumentData(collectionName: collectionName, wheres: wheres, orderby: orderby, limit: limit);

  @override
  void dispose() {
    firebaseProvider.dispose();
  }
}
