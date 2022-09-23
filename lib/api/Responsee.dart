

class Places{
  String? name;
  int? id;
  String? image;
  String? images;
  String? description;

  Places(this.id,this.name,this.image,this.images,this.description);

  Places.fromjson(Map<String,dynamic>map){
    this.id =map['data']['data'] ['id'];
    this.name =map['data']['data'] ['name'];
    this.description =map['data']['data'] ['description'];
    this.image =map['data']['data'] ['image'];
    this.images =map['data'] ['data']['images'];
  }
}