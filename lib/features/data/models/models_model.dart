class ModelsModel {
  String id;

  String object;

  String? ownedBy;

  ModelsModel({
    required this.id,
    required this.object,
    this.ownedBy,
  });

  factory ModelsModel.fromJson(Map<String, dynamic> json) {
    return ModelsModel(
      id: json['id'],
      object: json['object'],
      ownedBy: json['owned_by'] ?? '',
    );
  }
}
