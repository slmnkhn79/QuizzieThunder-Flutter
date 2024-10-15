import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/event_details/event_detail_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class EventDetailsPage extends StatelessWidget {
  final String eventId;
  const EventDetailsPage({super.key, required this.eventId});


  
  @override
  Widget build(BuildContext context) {
    EventDetailsController eventDetailsController =
        Get.find<EventDetailsController>();
    eventDetailsController.eventId.value = eventId;
    return Scaffold(
      backgroundColor: ThemeColor.primary,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ThemeColor.white,
            )),
        title: Text(

          "Details", //add the event name here

          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColor.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(()=>eventDetailsController.isLoading.value 
      ? const Center(
                child: CircularProgressIndicator(
                color: ThemeColor.white,
              ))
      : Placeholder()
      )
    );
  }
}
