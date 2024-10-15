import 'package:quizzie_thunder/models/event_detail_response_model.dart';

import '../utils/dio_client.dart';

class EventDetailsApi {
  Future<EventDetailsResponseModel> getEventDetails({required String eventId}) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/eventDetails", data: {'eventId':eventId});

      return EventDetailsResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
  Future<EventDetailsResponseModel> postEventDetails() async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance().post("/postEventDetails");

      return EventDetailsResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
