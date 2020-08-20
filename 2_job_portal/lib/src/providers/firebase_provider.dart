import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'base_provider.dart';

class FirebaseProvider extends BaseFirebaseProvider {
  Firestore fireStoreDb = Firestore.instance;

  @override
  Future<dynamic> addDocument({@required String collectionName, @required Map<String, dynamic> data}) async {
    try {
      final ref = await fireStoreDb.collection(collectionName).add(data);
      if (ref != null) {
        data['id'] = ref.documentID;

        var res = await updateDocument(
          collectionName: collectionName,
          id: ref.documentID,
          data: {'id': ref.documentID},
        );
        if (res) {
          return data;
        } else {
          return '-1';
        }
      }
    } catch (e) {
      print("firebaseProvider addDocument error");
      print(e);
      return '-1';
    }
  }

  @override
  Future<bool> updateDocument({
    @required String collectionName,
    @required String id,
    @required Map<String, dynamic> data,
  }) async {
    try {
      await fireStoreDb.collection(collectionName).document(id).updateData(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteDocument({
    @required String collectionName,
    @required String id,
  }) async {
    try {
      await Firestore.instance.collection(collectionName).document(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future getDocumentData({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) async {
    CollectionReference ref;
    Query query;
    try {
      ref = Firestore.instance.collection(collectionName);
      query = ref;
      if (wheres != null) query = _getQuery(query, wheres);
      if (orderby != null) query = _getOrderby(query, orderby);
      if (limit != null) query = query.limit(limit);
      QuerySnapshot snapshot = await query.getDocuments();
      List<Map<String, dynamic>> data = [];
      for (var i = 0; i < snapshot.documents.length; i++) {
        var tmp = snapshot.documents.elementAt(i).data;
        tmp["id"] = snapshot.documents.elementAt(i).documentID;
        data.add(tmp);
      }
      return data;
    } catch (e) {
      print("getDocument Error : $e");
      return '-1';
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getDocumentsStream({
    @required String collectionName,
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) {
    try {
      CollectionReference ref;
      Query query;
      ref = fireStoreDb.collection(collectionName);
      query = ref;
      if (wheres != null) query = _getQuery(query, wheres);
      if (orderby != null) query = _getOrderby(query, orderby);
      if (limit != null) query = query.limit(limit);
      return query.snapshots().map((snapshot) {
        return snapshot.documents.map((document) {
          Map<String, dynamic> data = document.data;
          data["id"] = document.documentID;
          return data;
        }).toList();
      });
    } catch (e) {
      print("____getDocumentsStream____error_______");
      print(e);
      return null;
    }
  }

  @override
  Future getDocumentDataWithChilCollection({
    @required String parentCollectionName,
    @required String childCollectionName,
    List<Map<String, dynamic>> parentWheres,
    List<Map<String, dynamic>> parentOrderby,
    int parentLimit,
    List<Map<String, dynamic>> childWheres,
    List<Map<String, dynamic>> childOrderby,
    int childLimit,
  }) async {
    CollectionReference parentRef;
    Query parentQuery;
    QuerySnapshot parentSnapshot;
    CollectionReference childRef;
    Query childQuery;
    QuerySnapshot childSnapshot;
    List<Map<String, dynamic>> data = [];
    try {
      parentRef = Firestore.instance.collection(parentCollectionName);
      parentQuery = parentRef;
      if (parentWheres != null) parentQuery = _getQuery(parentQuery, parentWheres);
      if (parentOrderby != null) parentQuery = _getOrderby(parentQuery, parentOrderby);
      if (parentLimit != null) parentQuery = parentQuery.limit(parentLimit);
      parentSnapshot = await parentQuery.getDocuments();
      for (var i = 0; i < parentSnapshot.documents.length; i++) {
        Map<String, dynamic> parentData = parentSnapshot.documents.elementAt(i).data;
        parentData["id"] = parentSnapshot.documents.elementAt(i).documentID;

        childRef = parentSnapshot.documents.elementAt(i).reference.collection(childCollectionName);
        childQuery = childRef;
        if (childWheres != null) childQuery = _getQuery(childQuery, childWheres);
        if (childOrderby != null) childQuery = _getOrderby(childQuery, childOrderby);
        if (childLimit != null) childQuery = childQuery.limit(childLimit);
        childSnapshot = await childQuery.getDocuments();
        for (var j = 0; j < childSnapshot.documents.length; j++) {
          Map<String, dynamic> childData = childSnapshot.documents.elementAt(j).data;
          childData["id"] = childSnapshot.documents.elementAt(j).documentID;
          data.add({"parent": parentData, "child": childData});
        }
      }
    } catch (e) {
      print("getDocument Error : $e");
      return '-1';
    }
  }

  @override
  Stream<List<Stream<List<Map<String, dynamic>>>>> getDocumentsStreamWithChildCollection({
    @required String parentCollectionName,
    @required String childCollectionName,
    List<Map<String, dynamic>> parentWheres,
    List<Map<String, dynamic>> parentOrderby,
    int parentLimit,
    List<Map<String, dynamic>> childWheres,
    List<Map<String, dynamic>> childOrderby,
    int childLimit,
  }) {
    CollectionReference parentRef;
    Query parentQuery;
    CollectionReference childRef;
    Query childQuery;
    try {
      parentRef = Firestore.instance.collection(parentCollectionName);
      parentQuery = parentRef;
      if (parentWheres != null) parentQuery = _getQuery(parentQuery, parentWheres);
      if (parentOrderby != null) parentQuery = _getOrderby(parentQuery, parentOrderby);
      if (parentLimit != null) parentQuery = parentQuery.limit(parentLimit);
      return parentQuery.snapshots().map((snapshot) {
        return snapshot.documents.map((document) {
          Map<String, dynamic> parentData = document.data;
          parentData["id"] = document.documentID;
          childRef = document.reference.collection(childCollectionName);
          childQuery = childRef;
          if (childWheres != null) childQuery = _getQuery(childQuery, childWheres);
          if (childOrderby != null) childQuery = _getOrderby(childQuery, childOrderby);
          if (childLimit != null) childQuery = childQuery.limit(childLimit);
          return childQuery.snapshots().map((snapshot) {
            return snapshot.documents.map((document) {
              Map<String, dynamic> childData = document.data;
              childData["id"] = document.documentID;
              return {
                "parent": parentData,
                "child": childData,
              };
            }).toList();
          });
        }).toList();
      });
    } catch (e) {
      print("____getDocumentsStreamWithChildCollection_____error______");
      print(e);
      return null;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

Query _getQuery(Query query, List<Map<String, dynamic>> wheres) {
  for (var i = 0; i < wheres.length; i++) {
    var key = wheres[i]["key"];
    var cond = wheres[i]["cond"];
    var val = wheres[i]["val"];

    switch (cond.toString()) {
      case "":
        query = query.where(key, isEqualTo: val);
        break;
      case "null":
        query = query.where(key, isEqualTo: val);
        break;
      case "=":
        query = query.where(key, isEqualTo: val);
        break;
      case "<":
        query = query.where(key, isLessThan: val);
        break;
      case "<=":
        query = query.where(key, isLessThanOrEqualTo: val);
        break;
      case ">":
        query = query.where(key, isGreaterThan: val);
        break;
      case ">=":
        query = query.where(key, isGreaterThanOrEqualTo: val);
        break;
      case "arrayContains":
        query = query.where(key, arrayContains: val);
        break;
      case "whereIn":
        query = query.where(key, whereIn: val);
        break;
      case "arrayContainsAny":
        query = query.where(key, arrayContainsAny: val);
        break;
      default:
        query = query.where(key, isEqualTo: val);
        break;
    }
  }
  return query;
}

Query _getOrderby(Query query, List<Map<String, dynamic>> orderby) {
  for (var i = 0; i < orderby.length; i++) {
    query = query.orderBy(orderby[i]["key"], descending: (orderby[i]["desc"] == null) ? false : true);
  }
  return query;
}
