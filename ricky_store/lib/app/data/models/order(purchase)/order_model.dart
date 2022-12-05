import 'package:ricky_store/app/shared/config/config.dart';

class OrderModel {
  OrderModel({
    required this.id,
    required this.kodeTransaksi,
    required this.userId,
    required this.nama,
    required this.nohp,
    required this.kotaKecamatan,
    required this.alamat,
    required this.catatan,
    required this.jenisPembayaran,
    required this.jenisPengiriman,
    required this.ongkir,
    required this.grandTotal,
    required this.buktiBayar,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.item,
  });

  int id;
  String kodeTransaksi;
  int userId;
  String nama;
  String nohp;
  String kotaKecamatan;
  String alamat;
  String catatan;
  String jenisPembayaran;
  String jenisPengiriman;
  int ongkir;
  int grandTotal;
  String buktiBayar;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Item item;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"] ?? 0,
        kodeTransaksi: json["kode_transaksi"] ?? "",
        userId: json["user_id"] ?? 0,
        nama: json["nama"] ?? "",
        nohp: json["nohp"] ?? "",
        kotaKecamatan: json["kota_kecamatan"] ?? "",
        alamat: json["alamat"] ?? "",
        catatan: json["catatan"] ?? "",
        jenisPembayaran: json["jenis_pembayaran"] ?? "",
        jenisPengiriman: json["jenis_pengiriman"] ?? "",
        ongkir: json["ongkir"] ?? 0,
        grandTotal: json["grand_total"] ?? 0,
        buktiBayar: json["buktibayar"] ?? "",
        status: json["status"] ?? "",
        createdAt: DateTime.parse(
            json["created_at"] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(
            json["updated_at"] ?? DateTime.now().toIso8601String()),
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode_transaksi": kodeTransaksi,
        "user_id": userId,
        "nama": nama,
        "nohp": nohp,
        "kota_kecamatan": kotaKecamatan,
        "alamat": alamat,
        "catatan": catatan,
        "jenis_pembayaran": jenisPembayaran,
        "jenis_pengiriman": jenisPengiriman,
        "ongkir": ongkir,
        "grand_total": grandTotal,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Item {
  Item({
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
  int checkoutId;
  int jumlah;
  int totalharga;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String namaProduct;
  String gambar;
  int hargaSatuan;
  String merkProduct;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        checkoutId: json["checkout_id"],
        jumlah: json["jumlah"],
        totalharga: json["totalharga"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        namaProduct: json["nama_product"],
        // ignore: prefer_interpolation_to_compose_strings
        gambar: "${Config.urlMain}storage/" + json["gambar"],
        hargaSatuan: json["harga_satuan"],
        merkProduct: json["merk_product"],
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
