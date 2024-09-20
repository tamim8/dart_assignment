class Product {
  final String? id;
  final String name;
  final String code;
  final String image;
  final String unitPrice;
  final String qty;
  final String totalPrice;
  final DateTime? createdDate;

  Product({
    this.id,
    required this.name,
    required this.code,
    required this.image,
    required this.unitPrice,
    required this.qty,
    required this.totalPrice,
    this.createdDate,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"] ?? '',
        name: json["ProductName"] ?? '',
        code: json["ProductCode"] ?? '',
        image: json["Img"] ?? '',
        unitPrice: json["UnitPrice"] ?? '',
        qty: json["Qty"] ?? '',
        totalPrice: json["TotalPrice"] ?? '',
        createdDate: DateTime.parse(json["CreatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "ProductName": name,
        "ProductCode": code,
        "Img": image,
        "UnitPrice": unitPrice,
        "Qty": qty,
        "TotalPrice": totalPrice,
      };
}
