class ProductsHub {
  int? status;
  String? message;
  List<Product>? data;

  ProductsHub({this.status, this.message, this.data});

  ProductsHub.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  bool isFavorite = false ;
  int? id;
  int? categoryId;
  String? name;
  int? price;
  int? qty;
  String? image;
  int? offer;
  int? tax;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.categoryId,
        this.name,
        this.price,
        this.qty,
        this.image,
        this.offer,
        this.tax,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isFavorite = false ;
    categoryId = json['category_id'];
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
    image = json['image'];
    offer = json['offer'];
    tax = json['tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['image'] = this.image;
    data['offer'] = this.offer;
    data['tax'] = this.tax;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}