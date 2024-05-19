class Space {
  String name;
  String dateUtc; 
  bool success; 
  String imageUrl;

  Space({required this.name, required this.dateUtc, required this.success, required this.imageUrl});

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      name: json['name'] ?? '',
      dateUtc: json['date_utc'] ?? '',
      success: json['success'] ?? false,
      imageUrl: json['links']?['patch']?['small'] ?? 'Sin Imagen',
    );
  }
}
