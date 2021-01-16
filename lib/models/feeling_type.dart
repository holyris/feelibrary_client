class FeelingType {
  final int id;
  final String name;

  FeelingType(this.id, this.name);

  FeelingType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
