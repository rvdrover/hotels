class Hotels {
  Hotels({
    this.data,
  });

  final List<HotelData>? data;

  factory Hotels.fromMap(Map<String, dynamic> json) => Hotels(
        data: List<HotelData>.from(json["data"].map((x) => HotelData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class HotelData {
  final int? id;
  final String? title;
  final String? address;
  final String? description;
  final String? latitude;
  final String? longitude;
  final HotelImage? image;
  HotelData({
    this.id,
    this.title,
    this.address,
    this.description,
    this.latitude,
    this.longitude,
    this.image,
  });

  factory HotelData.fromMap(Map<String, dynamic> json) => HotelData(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        image: HotelImage.fromMap(json["image"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "address": address,
        "description":description,
        "latitude": latitude,
        "longitude": longitude,
        "image": image!.toMap(),
      };
}

class HotelImage {
  final String? medium;
  HotelImage({
    this.medium,
  });

  factory HotelImage.fromMap(Map<String, dynamic> json) => HotelImage(
        medium: json["medium"],
      );

  Map<String, dynamic> toMap() => {
        "medium": medium,
      };
}
