class MerkList {
  MerkList({
    required this.id,
    required this.merkProduct,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String merkProduct; 
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory MerkList.fromJson(Map<String, dynamic> json) => MerkList(
        id: json["id"],
        merkProduct: json["merk_product"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merk_product": merkProduct,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
