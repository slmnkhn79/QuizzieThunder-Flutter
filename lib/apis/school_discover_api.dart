import 'package:quizzie_thunder/models/school_discover_screen_response_model.dart';

import '../utils/dio_client.dart';

class SchoolDiscoverApi {
  Future<SchoolDiscoverScreenResponseModel> getSchoolDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/schooldiscover");
      return SchoolDiscoverScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
