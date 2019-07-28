class ShopeInfo {
  final int has_suppliers;
  final String id;
  final String name;
  final String offical_name;
  final String pic;
  final num price;
  final List<num> size;

  ShopeInfo({this.has_suppliers, this.id, this.name, this.offical_name, this.pic,
      this.price, this.size});

  factory ShopeInfo.fromJson(Map<String, dynamic> json) {
    var size = json['size'];
    List<num> sizenum = new List<num>.from(size);
    return ShopeInfo(
        has_suppliers: json['has_suppliers'],
        id: json['id'],
        name: json['name'],
        offical_name: json['offical_name'],
        pic: json['pic'],
        price: json['price'],
        size: sizenum,
    );
  }
}
