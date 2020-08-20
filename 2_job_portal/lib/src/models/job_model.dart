import 'base_model.dart';

class JobModel extends BaseModel {
  String id;
  String userID;
  String title;
  String roleOverView;
  String responsibilities;
  String companyName;
  String location;
  double lat;
  double long;
  bool isSalary;
  int salaryAmount;
  bool isHourly;
  int hourlyAmount;
  List<String> jobTypeList;
  List<String> experiences;
  int createdTs;
  int ts;

  JobModel({
    this.id = "",
    this.userID = "",
    this.title = "",
    this.roleOverView = "",
    this.responsibilities = "",
    this.companyName = "",
    this.location = "USD",
    this.lat = 0.0,
    this.long = 0.0,
    this.isHourly = false,
    this.hourlyAmount = 0,
    this.isSalary = false,
    this.salaryAmount = 0,
    this.jobTypeList,
    this.experiences,
    this.createdTs = 0,
    this.ts = 0,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: (json['id'] != null) ? json['id'] as String : "",
      userID: (json['userID'] != null) ? json['userID'] as String : "",
      title: (json['title'] != null) ? json['title'] as String : "",
      roleOverView: (json['roleOverView'] != null) ? json['roleOverView'] as String : "",
      responsibilities: (json['responsibilities'] != null) ? json['responsibilities'] as String : "",
      companyName: (json['companyName'] != null) ? json['companyName'] as String : "",
      location: (json['location'] != null) ? json['location'] as String : "",
      lat: (json['lat'] != null) ? json['lat'] as double : 0.0,
      long: (json['long'] != null) ? json['long'] as double : 0.0,
      isHourly: (json['isHourly'] != null) ? json['isHourly'] as bool : false,
      hourlyAmount: (json['hourlyAmount'] != null) ? json['hourlyAmount'] as int : 0,
      isSalary: (json['isSalary'] != null) ? json['isSalary'] as bool : false,
      salaryAmount: (json['salaryAmount'] != null) ? json['salaryAmount'] as int : 0,
      jobTypeList: (json['jobTypeList'] != null) ? json['jobTypeList'].join(',').split(',') : [] as List<String>,
      experiences: (json['experiences'] != null) ? json['experiences'].join(',').split(',') : [] as List<String>,
      createdTs: (json['createdTs'] != null) ? json['createdTs'] : DateTime.now().millisecondsSinceEpoch,
      ts: (json['ts'] != null) ? json['ts'] : DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": (id != null) ? id : "",
      "userID": (userID != null) ? userID : "",
      "title": (title != null) ? title : "",
      "roleOverView": (roleOverView != null) ? roleOverView : "",
      "responsibilities": (responsibilities != null) ? responsibilities : "",
      "companyName": (companyName != null) ? companyName : "",
      "location": (location != null) ? location : "USD",
      "lat": (lat != null) ? lat : 0.0,
      "long": (long != null) ? long : 0.0,
      "isHourly": (isHourly != null) ? isHourly : false,
      "hourlyAmount": (hourlyAmount != null) ? hourlyAmount : 0,
      "isSalary": (isSalary != null) ? isSalary : false,
      "salaryAmount": (salaryAmount != null) ? salaryAmount : 0,
      "jobTypeList": (jobTypeList != null) ? jobTypeList : [],
      "experiences": (experiences != null) ? experiences : [] as List<String>,
      "createdTs": (createdTs != null) ? createdTs : DateTime.now().millisecondsSinceEpoch,
      "ts": (ts != null) ? ts : DateTime.now().millisecondsSinceEpoch,
    };
  }
}
