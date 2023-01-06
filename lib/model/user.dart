class User {
  User({
    required this.id,
    required this.username,
    required this.pasword,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String? id;
  String? username;
  String? pasword;
  String? image;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        pasword: json["pasword"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "pasword": pasword,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
