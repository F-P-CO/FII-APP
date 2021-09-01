class ComparatorFilter {
  String? search;

  ComparatorFilter({
    this.search,
  });

  bool isSearchEnabled() => search != null;

  ComparatorFilter copyWith({
    String? search,
  }) {
    return ComparatorFilter(
      search: search ?? this.search,
    );
  }
}
