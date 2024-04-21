class Attributes {
  String? name;
  int? age;
  String? gender;
  String? dignosis;
  String? medicalProblem;
  DateTime? createdAt;
  DateTime? updatedAt;

  Attributes({
    this.name,
    this.age,
    this.gender,
    this.dignosis,
    this.medicalProblem,
    this.createdAt,
    this.updatedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json['Name'] as String?,
        age: json['Age'] as int?,
        gender: json['Gender'] as String?,
        dignosis: json['Dignosis'] as String?,
        medicalProblem: json['Medical_problem'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Age': age,
        'Gender': gender,
        'Dignosis': dignosis,
        'Medical_problem': medicalProblem,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
