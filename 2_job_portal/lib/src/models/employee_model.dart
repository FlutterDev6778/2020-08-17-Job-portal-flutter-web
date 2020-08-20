import 'base_model.dart';
import 'package:date_format/date_format.dart';

class EmployeeModel extends BaseModel {
  String id;
  String uid;
  int userType; //// 0: employer, 1: employee
  String name;
  String address;
  double lat;
  double long;
  String email;
  String phoneNumber;
  String avatarUrl;
  String currencyType;
  String currencySymbol;
  List<int> workDays;
  int fromHour;
  int toHour;
  int salaryAmount;
  int hourlyAmount;
  String companyOverView;
  int ts;

  EmployeeModel({
    this.id = "",
    this.uid = "",
    this.name = "",
    this.address = "",
    this.lat = 0.0,
    this.long = 0.0,
    this.email = "",
    this.phoneNumber = "",
    this.avatarUrl = "",
    this.currencyType = "USD",
    this.currencySymbol = "\$",
    this.workDays = const [1, 2, 3, 4, 5],
    this.fromHour = 0,
    this.toHour = 0,
    this.salaryAmount = 0,
    this.hourlyAmount = 0,
    this.companyOverView = "",
    this.ts = 0,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json)
      : id = (json['id'] != null) ? json['id'] : "",
        uid = (json['uid'] != null) ? json['uid'] : "",
        name = (json['name'] != null) ? json['name'] : "",
        address = (json['address'] != null) ? json['address'] : "",
        lat = (json['lat'] != null) ? json['lat'] : 0.0,
        long = (json['long'] != null) ? json['long'] : 0.0,
        email = (json['email'] != null) ? json['email'] : "",
        phoneNumber = (json['phoneNumber'] != null) ? json['phoneNumber'] : "",
        avatarUrl = (json['avatarUrl'] != null) ? json['avatarUrl'] : "",
        currencyType = (json['currencyType'] != null) ? json['currencyType'] : "USD",
        currencySymbol = (json['currencySymbol'] != null) ? json['currencySymbol'] : "\$",
        workDays = (json['workDays'] != null) ? json['workDays'].map((item) => int.parse(item.toString())).toList() : [1, 2, 3, 4, 5],
        fromHour = (json['fromHour'] != null) ? json['fromHour'] : 0,
        toHour = (json['toHour'] != null) ? json['toHour'] : 0,
        salaryAmount = (json['salaryAmount'] != null) ? json['salaryAmount'] : 0,
        hourlyAmount = (json['hourlyAmount'] != null) ? json['hourlyAmount'] : 0,
        companyOverView = (json['companyOverView'] != null) ? json['companyOverView'] : "",
        ts = (json['ts'] != null) ? json['ts'] : DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toJson() {
    return {
      "id": (id != null) ? id : "",
      "uid": (uid != null) ? uid : "",
      "name": (name != null) ? name : "",
      "address": (address != null) ? address : "",
      "lat": (lat != null) ? lat : 0.0,
      "long": (long != null) ? long : 0.0,
      "email": (email != null) ? email : "",
      "phoneNumber": (phoneNumber != null) ? phoneNumber : "",
      "avatarUrl": (avatarUrl != null) ? avatarUrl : "",
      "currencyType": (currencyType != null) ? currencyType : "USD",
      "currencySymbol": (currencySymbol != null) ? currencySymbol : "\$",
      "workDays": (workDays != null) ? workDays : [1, 2, 3, 4, 5],
      "fromHour": (fromHour != null) ? fromHour : 0,
      "toHour": (toHour != null) ? toHour : 0,
      "companyOverView": (companyOverView != null) ? companyOverView : "",
      "ts": (ts != null) ? ts : DateTime.now().millisecondsSinceEpoch,
    };
  }
}
