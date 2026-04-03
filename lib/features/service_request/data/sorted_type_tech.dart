enum SortType {
  topRated,
  nearest,
  lowestPrice,
  availableNow,
}

class SortItem {
  final String title;
  final SortType type;

  SortItem({required this.title, required this.type});
}
