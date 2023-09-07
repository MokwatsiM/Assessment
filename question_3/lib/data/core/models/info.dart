class Info {
  final int? count;
  final int? pages;
 final String? next;
 final dynamic prev;

 const Info({this.count, this.pages, this.next, this.prev});

  @override
  String toString() {
    return 'Info(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json['count'] as int?,
        pages: json['pages'] as int?,
        next: json['next'] as String?,
        prev: json['prev'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'pages': pages,
        'next': next,
        'prev': prev,
      };

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    dynamic prev,
  }) {
    return Info(
      count: count ?? this.count,
      pages: pages ?? this.pages,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }
}
