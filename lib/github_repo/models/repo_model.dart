import 'dart:convert';

class RepoModel {
  final int id;
  final String name;
  final String fullName;
  final String htmlUrl;
  RepoModel({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
  });

  RepoModel copyWith({
    int? id,
    String? name,
    String? fullName,
    String? htmlUrl,
  }) {
    return RepoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      htmlUrl: htmlUrl ?? this.htmlUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'fullName': fullName,
      'htmlUrl': htmlUrl,
    };
  }

  factory RepoModel.fromMap(Map<String, dynamic> map) {
    return RepoModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      fullName: map['fullName'] ?? '',
      htmlUrl: map['htmlUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RepoModel.fromJson(String source) =>
      RepoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RepoModel(id: $id, name: $name, fullName: $fullName, htmlUrl: $htmlUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RepoModel &&
        other.id == id &&
        other.name == name &&
        other.fullName == fullName &&
        other.htmlUrl == htmlUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ fullName.hashCode ^ htmlUrl.hashCode;
  }
}
