import 'package:dio/dio.dart';
import 'package:quizzie_thunder/models/school_discover_screen_response_model.dart';

import '../models/discover_screen_response_model.dart';
import '../utils/dio_client.dart';

class SchoolDiscoverApi {
  Future<SchoolDiscoverScreenResponseModel> getSchoolDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/schooldiscover",options: Options(headers: {'X-Parse-Application-Id': 'myappID',}));
      return SchoolDiscoverScreenResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
