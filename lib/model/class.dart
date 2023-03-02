// model
import 'dart:ffi';

class Fruit {
  String? id;
  String? name;
  String? image;
  String? detail;
 String? price;
  Fruit({this.id, this.name, this.image, this.price, this.detail});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'detail': detail
      };
}
