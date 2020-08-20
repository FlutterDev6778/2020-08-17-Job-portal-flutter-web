import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_portal/src/models/index.dart';

import 'index.dart';

class JobProvider extends FirebaseProvider {
  final String collectionName = "/Jobs";
  FirebaseProvider firebaseProvider = FirebaseProvider();

  Future<JobModel> addJob({@required JobModel jobModel}) async {
    try {
      var result = await firebaseProvider.addDocument(collectionName: collectionName, data: jobModel.toJson());
      if (result != "-1")
        return JobModel.fromJson(result);
      else
        return null;
    } catch (e) {
      print("addJob error");
      print(e);
      return null;
    }
  }

  Future<bool> updateJob({@required JobModel jobModel}) async {
    return await firebaseProvider.updateDocument(collectionName: collectionName, id: jobModel.id, data: jobModel.toJson());
  }

  Future<bool> deleteJob({@required JobModel jobModel}) async {
    return await firebaseProvider.deleteDocument(collectionName: collectionName, id: jobModel.id);
  }

  Stream<List<JobModel>> getJobListStream({
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) {
    try {
      Stream<List<Map<String, dynamic>>> stream =
          firebaseProvider.getDocumentsStream(collectionName: collectionName, wheres: wheres, orderby: orderby, limit: limit);
      firebaseProvider.getDocumentData(collectionName: collectionName, wheres: wheres, orderby: orderby, limit: limit).then((data) {});
      return stream.map((dataList) {
        return dataList.map((data) {
          return JobModel.fromJson(data);
        }).toList();
      });
    } catch (e) {
      return null;
    }
  }

  Future<List<JobModel>> getJobList({
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) async {
    List<JobModel> jobModelList = [];
    var result = await firebaseProvider.getDocumentData(collectionName: collectionName, wheres: wheres, orderby: orderby, limit: limit);
    if (result != "-1") {
      result.forEach((data) {
        jobModelList.add(JobModel.fromJson(data));
      });
      return jobModelList;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
