import 'package:quizzie_thunder/models/gallery_data_response_model.dart';
import '../utils/dio_client.dart';

class DatepairApi {
  Future<GalleryDatesResponseModel> getDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/dates");
      return GalleryDatesResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
