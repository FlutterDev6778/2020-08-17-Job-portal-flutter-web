import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
import 'package:job_portal/src/providers/index.dart';
import 'package:job_portal/src/utils/index.dart';

import 'index.dart';

class FilterDataRepository {
  Future<bool> saveFilterDataToLocal({@required FilterModel filterModel, @required String key}) async {
    return await LocalStorage.storeDataToLocal(
      key: key,
      value: json.encode(filterModel.toJson()),
      type: StorableDataType.STRINGLIST,
    );
  }

  FilterModel getFilterDataFromLocal({@required String key}) {
    String localString = LocalStorage.getDataInLocal(
      key: key,
      type: StorableDataType.String,
    );
    if (localString != null && localString != "") {
      return FilterModel.fromJson(json.decode(localString));
    } else {
      return FilterModel();
    }
  }

  Future<bool> clearSaveFilterDataToLocal({@required String key}) async {
    return await LocalStorage.storeDataToLocal(
      key: key,
      value: "",
      type: StorableDataType.STRINGLIST,
    );
  }
}
