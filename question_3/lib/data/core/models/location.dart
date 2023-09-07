class Location {
  final String? name;
 final String? url;

 const Location({this.name, this.url});

  @override
  String toString() => 'Location(name: $name, url: $url)';

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Location copyWith({
    String? name,
    String? url,
  }) {
    return Location(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
