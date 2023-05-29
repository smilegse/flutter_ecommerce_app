import 'package:ecommerce_app/data/models/profile.dart';

class ProfileModel {
  String? msg;
  List<Profile>? profiles;

  ProfileModel({this.msg, this.profiles});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      profiles = <Profile>[];
      json['data'].forEach((v) {
        profiles!.add(Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (profiles != null) {
      data['data'] = profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
