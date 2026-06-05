class OrderDetailsModel {
  final int id;
  final String serviceName;
  final DateTime scheduledDate;
  final String scheduledTime;
  final String city;
  final String government;
  final String placeDetails;
  final String problemDetails;
  final double inspectedPrice;
  final double finalPrice;
  final double afterPrice;
  final String imageTecURL;
  final String nameTechnician;
  final double ratingAvg;
  final String state;

  OrderDetailsModel({
    required this.id,
    required this.serviceName,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.city,
    required this.government,
    required this.placeDetails,
    required this.problemDetails,
    required this.inspectedPrice,
    required this.finalPrice,
    required this.afterPrice,
    required this.imageTecURL,
    required this.nameTechnician,
    required this.ratingAvg,
    required this.state,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      serviceName: json['serviceName'],
      scheduledDate: DateTime.parse(json['scheduledDate']),
      scheduledTime: json['scheduledTime'],
      city: json['city'],
      government: json['government'],
      placeDetails: json['placeDetails'],
      problemDetails: json['problemDetails'],
      inspectedPrice: (json['inspectedPrice'] as num).toDouble(),
      finalPrice: (json['finalPrice'] as num).toDouble(),
      afterPrice: (json['afterPrice'] as num).toDouble(),
      imageTecURL: json['imageTecURL'],
      nameTechnician: json['nameTechnician'],
      ratingAvg: (json['ratingAvg'] as num).toDouble(),
      state: json['state'],
    );
  }
}
