class CategoryModel {
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;

  CategoryModel({this.name, this.nameAr, this.image, this.createdAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
