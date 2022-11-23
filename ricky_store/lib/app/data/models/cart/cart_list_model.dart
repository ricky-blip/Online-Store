import 'package:ricky_store/app/shared/config/config.dart';

class CartModel {
  CartModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.checkoutId,
    required this.jumlah,
    required this.totalharga,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.namaProduct,
    required this.gambar,
    required this.hargaSatuan,
    required this.merkProduct,
  });

  int id;
  int userId;
  int productId;
  dynamic checkoutId;
  int jumlah;
  int totalharga;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String namaProduct;
  String gambar;
  int hargaSatuan;
  String merkProduct;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        productId: json["product_id"] ?? 0,
        checkoutId: json["checkout_id"] ?? "",
        jumlah: json["jumlah"] ?? 0,
        totalharga: json["totalharga"] ?? 0,
        status: json["status"] ?? "",
        createdAt: DateTime.parse(
          json["created_at"] ?? DateTime.now().toIso8601String(),
        ),
        updatedAt: DateTime.parse(
          json["updated_at"] ?? DateTime.now().toIso8601String(),
        ),
        namaProduct: json["nama_product"] ?? "",
        gambar: json["gambar"] ?? "no image",
        // gambar: json["gambar"] ??
        //     "${Config.urlMain}storage/product-images/5puVDfAAeLtiESGhHbFW5sjZoVW1ts27sp5fjg3K.webp",
        hargaSatuan: json["harga_satuan"] ?? 0,
        merkProduct: json["merk_product"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "checkout_id": checkoutId,
        "jumlah": jumlah,
        "totalharga": totalharga,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nama_product": namaProduct,
        "gambar": gambar,
        "harga_satuan": hargaSatuan,
        "merk_product": merkProduct,
      };
}
