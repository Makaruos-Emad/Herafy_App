class Country {
  final String title;
  final String? code;
  final String? flag;
  final List<String>? centers;

  Country({required this.title,  this.code,  this.flag , this.centers});
}


class Governorate {
  final String name;
  final List<String> centers;

  Governorate({
    required this.name,
    required this.centers,
  });
}
