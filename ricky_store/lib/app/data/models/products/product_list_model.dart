import '../../../shared/config/config.dart';

class ProductList {
  ProductList({
    required this.id,
    required this.merkId,
    required this.namaProduct,
    required this.harga,
    required this.gambar,
    required this.spesifikasi,
    required this.rating,
    required this.status,
    required this.rekomendasi,
    required this.createdAt,
    required this.updatedAt,
    required this.merk,
  });

  int id;
  int merkId;
  String namaProduct;
  int harga;
  String gambar;
  String spesifikasi;
  num rating;
  String status;
  String rekomendasi;
  DateTime createdAt;
  DateTime updatedAt;
  Merk merk;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["id"] ?? 0,
        merkId: json["merk_id"] ?? 0,
        namaProduct: json["nama_product"] ?? "",
        harga: json["harga"] ?? 0,
        gambar: json["gambar"] ??
            "${Config.urlMain}storage/product-images/5puVDfAAeLtiESGhHbFW5sjZoVW1ts27sp5fjg3K.webp",
        spesifikasi: json["spesifikasi"] ?? "",
        rating: json["rating"] ?? 0.0,
        status: json["status"] ?? "",
        rekomendasi: json["rekomendasi"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        merk: Merk.fromJson(json["merk"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merk_id": merkId,
        "nama_product": namaProduct,
        "harga": harga,
        "gambar": gambar,
        "spesifikasi": spesifikasi,
        "rating": rating,
        "status": status,
        "rekomendasi": rekomendasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "merk": merk.toJson(),
      };
}

class Merk {
  Merk({
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

  factory Merk.fromJson(Map<String, dynamic> json) => Merk(
        id: json["id"] ?? 0,
        merkProduct: json["merk_product"] ?? "",
        status: json["status"] ?? "",
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
