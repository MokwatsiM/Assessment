class Origin {
  final String? name;
 final String? url;

 const Origin({this.name, this.url});

  @override
  String toString() => 'Origin(name: $name, url: $url)';

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  Origin copyWith({
    String? name,
    String? url,
  }) {
    return Origin(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
