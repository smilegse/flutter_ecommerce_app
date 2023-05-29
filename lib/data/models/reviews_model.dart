import 'profile.dart';

class ReviewsModel {
  String? msg;
  List<ReviewsData>? reviews;

  ReviewsModel({this.msg, this.reviews});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviews = <ReviewsData>[];
      json['data'].forEach((v) {
        reviews!.add(ReviewsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (reviews != null) {
      data['data'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewsData {
  int? id;
  String? description;
  String? email;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  ReviewsData(
      {this.id,
      this.description,
      this.email,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.profile});

  ReviewsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}
