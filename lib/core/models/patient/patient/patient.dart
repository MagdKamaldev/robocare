import 'attributes.dart';

class Patient {
  int? id;
  Attributes? attributes;

  Patient({this.id, this.attributes});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'] as int?,
        attributes: json['attributes'] == null
            ? null
            : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'attributes': attributes?.toJson(),
      };
}
