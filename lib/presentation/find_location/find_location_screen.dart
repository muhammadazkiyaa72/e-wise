import 'package:ewise/presentation/find_location/find_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class FindLocationScreen extends StatefulWidget {
  const FindLocationScreen({super.key});

  @override
  State<FindLocationScreen> createState() => _FindLocationScreenState();
}

class _FindLocationScreenState extends State<FindLocationScreen> {
  final FindLocationController controller = Get.put(FindLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
