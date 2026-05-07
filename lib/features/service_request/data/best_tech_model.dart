class BestTechnicalModel {
  String id;
  String name;
  String description;
  String image;
  double rating;
  int distance;
  double workingPrice;
  bool isAvailable;

  BestTechnicalModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.distance,
    required this.workingPrice,
    required this.isAvailable,
  });

  factory BestTechnicalModel.fromJson(Map<String, dynamic> json) {
    return BestTechnicalModel(
      id: json["userId"] ?? "",
      name: json["fullname"] ?? "",
      description: json["bio"] ?? "",
      image: json["profileImageURL"] ?? "",

      // 👇 نخليها دايمًا double
      rating: (json["ratingAvg"] is int)
          ? (json["ratingAvg"] as int).toDouble()
          : (json["ratingAvg"] ?? 0.0),

      // 👇 نخليها int
      //لاحظ انه مش جاي المسافة 
      distance: json["distance"] ?? 0,

      workingPrice: json["inspectedPrice"] ?? 0,

      // 👇 نحول لأي حاجة bool
      isAvailable: json["availabilityStatus"] ?? true ,
    );
  }

}
