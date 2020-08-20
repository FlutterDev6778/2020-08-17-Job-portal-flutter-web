import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';

import 'base_model.dart';

class FilterModel extends BaseModel {
  int viewFilter;
  int sortFilter;
  int salaryFilter;
  int hourlyFilter;
  int distanceFilter;
  List<String> jobTypeFilterList;
  List<String> experienceFilterList;

  FilterModel({
    this.viewFilter = 0,
    this.sortFilter = 0,
    this.salaryFilter = 0,
    this.hourlyFilter = 0,
    this.distanceFilter = JobPortalPageConstants.toDistance,
    this.jobTypeFilterList = const [],
    this.experienceFilterList = const [],
  });

  FilterModel.fromJson(Map<String, dynamic> json)
      : viewFilter = (json['viewFilter'] != null) ? json['viewFilter'] : 0,
        sortFilter = (json['sortFilter'] != null) ? json['sortFilter'] : 0,
        salaryFilter = (json['salaryFilter'] != null) ? json['salaryFilter'] : 0,
        hourlyFilter = (json['hourlyFilter'] != null) ? json['hourlyFilter'] : 0,
        distanceFilter = (json['distanceFilter'] != null) ? json['distanceFilter'] : JobPortalPageConstants.toDistance,
        jobTypeFilterList = (json['jobTypeFilterList'] != null) ? json['jobTypeFilterList'].join(',').split(',') : [] as List<String>,
        experienceFilterList = (json['experienceFilterList'] != null) ? json['experienceFilterList'].join(',').split(',') : [] as List<String>;

  Map<String, dynamic> toJson() {
    return {
      "viewFilter": (viewFilter != null) ? viewFilter : 0,
      "sortFilter": (sortFilter != null) ? sortFilter : 0,
      "salaryFilter": (salaryFilter != null) ? salaryFilter : 0,
      "hourlyFilter": (hourlyFilter != null) ? hourlyFilter : 0,
      "distanceFilter": (distanceFilter != null) ? distanceFilter : JobPortalPageConstants.toDistance,
      "jobTypeFilterList": (jobTypeFilterList != null) ? jobTypeFilterList : [],
      "experienceFilterList": (experienceFilterList != null) ? experienceFilterList : [],
    };
  }
}
