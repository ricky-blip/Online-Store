import '../../config/config.dart';

class ProductNew {
  //NOTE Contractor
  ProductNew({
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
  });

  //NOTE Atribute
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

  //SECTION Product
  factory ProductNew.fromJson(Map<String, dynamic> json) => ProductNew(
        //NOTE gunakan kondisi untuk ketika ada kondisi NULL = tidakNUll ?? NULL
        id: json["id"] ?? 0,
        merkId: json["merk_id"] ?? 0,
        namaProduct: json["nama_product"] ?? "",
        harga: json["harga"] ?? 0,
        // gambar: json["gambar"] ??
        //     "https://syntop.sydemy.com/storage/product-images/5puVDfAAeLtiESGhHbFW5sjZoVW1ts27sp5fjg3K.webp",
        gambar: json["gambar"] ??
            Config.urlMain +
                "storage/product-images/5puVDfAAeLtiESGhHbFW5sjZoVW1ts27sp5fjg3K.webp",
        spesifikasi: json["spesifikasi"] ?? "",
        rating: json["rating"] ?? 0.0,
        status: json["status"] ?? "",
        rekomendasi: json["rekomendasi"] ?? "",
        createdAt: DateTime.parse(
          json["created_at"] ?? DateTime.now().toIso8601String(),
        ),
        updatedAt: DateTime.parse(
          json["updated_at"] ?? DateTime.now().toIso8601String(),
        ),
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
      };
}
