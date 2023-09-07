import 'info.dart';
import 'result.dart';

class Character {
 final Info? info;
 final List<Result>? results;

 const Character({this.info, this.results});

  @override
  String toString() => 'Character(info: $info, results: $results)';

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        info: json['info'] == null
            ? null
            : Info.fromJson(json['info'] as Map<String, dynamic>),
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'info': info?.toJson(),
        'results': results?.map((e) => e.toJson()).toList(),
      };

  Character copyWith({
    Info? info,
    List<Result>? results,
  }) {
    return Character(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }
}
