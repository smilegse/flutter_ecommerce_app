import 'package:ecommerce_app/data/models/product.dart';

class WishListModel {
  String? msg;
  List<WishData>? wishes;

  WishListModel({this.msg, this.wishes});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishes = <WishData>[];
      json['data'].forEach((v) {
        wishes!.add(WishData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (wishes != null) {
      data['data'] = wishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishData {
  int? id;
  String? email;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Product? product;

  WishData(
      {this.id,
        this.email,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.product});

  WishData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

