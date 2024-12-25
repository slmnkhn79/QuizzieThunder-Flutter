import 'package:quizzie_thunder/models/discover_screen_response_model.dart';

import '../utils/dio_client.dart';

class SchoolDiscoverApi {
  Future<DiscoverScreenResponseModel> getSchoolDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/discover");
      return DiscoverScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
