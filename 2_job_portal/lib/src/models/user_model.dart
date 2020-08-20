import 'base_model.dart';

class UserModel extends BaseModel {
  String id;
  String uid;
  String name;
  String email;
  String avatarUrl;
  String currencyType;
  String currencySymbol;
  int ts;

  UserModel({
    this.id = "",
    this.uid = "",
    this.name = "",
    this.email = "",
    this.avatarUrl = "",
    this.currencyType = "USD",
    this.currencySymbol = "\$",
    this.ts = 0,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = (json['id'] != null) ? json['id'] : "",
        uid = (json['uid'] != null) ? json['uid'] : "",
        name = (json['name'] != null) ? json['name'] : "",
        email = (json['email'] != null) ? json['email'] : "",
        avatarUrl = (json['avatarUrl'] != null) ? json['avatarUrl'] : "",
        currencyType = (json['currencyType'] != null) ? json['currencyType'] : "USD",
        currencySymbol = (json['currencySymbol'] != null) ? json['currencySymbol'] : "\$",
        ts = (json['ts'] != null) ? json['ts'] : DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toJson() {
    return {
      "id": (id != null) ? id : "",
      "uid": (uid != null) ? uid : "",
      "name": (name != null) ? name : "",
      "email": (email != null) ? email : "",
      "avatarUrl": (avatarUrl != null) ? avatarUrl : "",
      "currencyType": (currencyType != null) ? currencyType : "USD",
      "currencySymbol": (currencySymbol != null) ? currencySymbol : "\$",
      "ts": (ts != null) ? ts : DateTime.now().millisecondsSinceEpoch,
    };
  }
}
