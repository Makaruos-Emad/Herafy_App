import 'package:geolocator/geolocator.dart';
Future<void> getLocation() async {

  bool serviceEnabled;
  LocationPermission permission;

  // هل الـ GPS شغال؟
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print("Location services are disabled");
    return;
  }

  // حالة الإذن
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.denied) {
    print("Location permission denied");
    return;
  }

  if (permission == LocationPermission.deniedForever) {
    print("Location permission permanently denied");
    return;
  }

  // هنا نجيب الموقع
  Position position = await Geolocator.getCurrentPosition();

  print(position.latitude);
  print(position.longitude);
}