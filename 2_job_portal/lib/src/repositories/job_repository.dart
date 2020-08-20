import 'dart:math';

import 'package:flutter/material.dart';
import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Components/JobFilterPanel/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
import 'package:job_portal/src/providers/index.dart';

import 'index.dart';

class JobRepository {
  JobProvider jobProvider = JobProvider();

  Future<JobModel> addJob({@required JobModel jobModel}) async {
    return await jobProvider.addJob(jobModel: jobModel);
  }

  Future<bool> updateJob({@required JobModel jobModel}) async {
    return await jobProvider.updateJob(jobModel: jobModel);
  }

  Future<dynamic> deleteJob({@required JobModel jobModel}) async {
    return await jobProvider.deleteJob(jobModel: jobModel);
  }

  Future<List<JobModel>> getJobList({
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) async {
    try {
      List<JobModel> list = await jobProvider.getJobList(wheres: wheres, orderby: orderby, limit: limit);
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<List<JobModel>> getJobListStream({
    List<Map<String, dynamic>> wheres,
    List<Map<String, dynamic>> orderby,
    int limit,
  }) {
    return jobProvider.getJobListStream(wheres: wheres, orderby: orderby, limit: limit);
  }

  Future<bool> makeSampleJob() async {
    try {
      /// test data
      JobModel _jobModel;
      for (var i = 0; i < 50; i++) {
        _jobModel = JobModel.fromJson(JobPortalPageConstants.jobDataSample);
        _jobModel.userID = _jobModel.userID + (i + 1).toString();
        _jobModel.title = _jobModel.title + (i + 1).toString();
        _jobModel.companyName = _jobModel.companyName + (i + 1).toString();
        _jobModel.location = _jobModel.location + (i + 1).toString();
        _jobModel.location = _jobModel.location + (i + 1).toString();
        if (i % 2 == 0) {
          _jobModel.isHourly = true;
          _jobModel.hourlyAmount = Random.secure().nextInt(100).toInt();
          _jobModel.isSalary = false;
          _jobModel.salaryAmount = 0;
        } else {
          _jobModel.isSalary = true;
          _jobModel.salaryAmount = Random.secure().nextInt(5000).toInt();
          _jobModel.isHourly = false;
          _jobModel.hourlyAmount = 0;
        }
        List<String> list = [];
        list.add(JobFilterPanelString.jobTypeFilterList.elementAt(
          Random.secure().nextInt(234) % JobFilterPanelString.jobTypeFilterList.length,
        ));
        if (i % 3 == 0) {
          list.add(JobFilterPanelString.jobTypeFilterList.elementAt(
            Random.secure().nextInt(234) % JobFilterPanelString.jobTypeFilterList.length,
          ));
        }

        _jobModel.jobTypeList = list;

        list = [];
        list.add(JobFilterPanelString.experienceFilterList.elementAt(
          Random.secure().nextInt(567) % JobFilterPanelString.experienceFilterList.length,
        ));
        if (i % 4 == 0) {
          list.add(JobFilterPanelString.experienceFilterList.elementAt(
            Random.secure().nextInt(234) % JobFilterPanelString.experienceFilterList.length,
          ));
        }

        _jobModel.experiences = list;

        await addJob(jobModel: _jobModel);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
