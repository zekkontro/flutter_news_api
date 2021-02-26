class Sources {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Sources(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  factory Sources.fromMap(Map<String, dynamic> data) {
    return Sources(
        category: data['category'],
        description: data['description'],
        country: data['country'],
        id: data['id'],
        language: data['language'],
        name: data['name'],
        url: data['url']);
  }
}
