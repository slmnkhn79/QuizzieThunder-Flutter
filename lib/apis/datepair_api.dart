import 'package:quizzie_thunder/models/gallery_date_response_model.dart';
import 'package:quizzie_thunder/models/gallery_response_model.dart';
import '../utils/dio_client.dart';

class DatepairApi {
  Future<GalleryDatesResponseModel> getEventDatesDetail() async {
    try {
      final response = await DioClient.getDioInstance().post("/eventDates");
      return GalleryDatesResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
  Future<GalleryResponseModel> getEventsByDate(DateTime? selectedDay,String schoolId) async {
    try {
      final response = await DioClient.getDioInstance().post("/eventByDates",
      data: {
        "eventDate":selectedDay.toString(), "schoolId":schoolId
      });
      return GalleryResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
