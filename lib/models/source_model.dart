class SourceModel {
  final String id;
  final String name;

  SourceModel(this.id, this.name);

  factory SourceModel.fromMap(Map<String, dynamic> data) {
    return SourceModel(data['id'], data['name']);
  }
}
