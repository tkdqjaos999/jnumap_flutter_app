
class Building{
  Building(this.name, this.latitude, this.longitude, this.group, this.path);

  String name;
  String latitude;
  String longitude;
  String group;
  String path;

  factory Building.fromJson(Map<String, dynamic> json){
    return Building(
      json['name'],
      json['latitude'],
      json['longitude'],
      json['group'],
      json['path']
    );
  }

}