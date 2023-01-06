import 'user.dart';

class Topic {
  Topic({
    required this.id,
    required this.title,
    required this.descript,
    required this.images,
    required this.idUser,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  String id;
  String title;
  String descript;
  String images;
  String idUser;
  String createdAt;
  String updatedAt;
  User? user;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        title: json["title"],
        descript: json["descript"],
        images: json["images"],
        idUser: json["id_user"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "descript": descript,
        "images": images,
        "id_user": idUser,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
