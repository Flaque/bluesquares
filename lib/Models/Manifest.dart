import 'package:json_annotation/json_annotation.dart';

part 'Manifest.g.dart';

@JsonSerializable()
class Manifest extends Object with _$ManifestSerializerMixin {
  Manifest(this.keys);

  List<String> keys;

  factory Manifest.fromJson(Map<String, dynamic> json) =>
      _$ManifestFromJson(json);
}
