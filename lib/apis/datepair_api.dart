import 'package:quizzie_thunder/models/gallery_date_response_model.dart';
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
}
