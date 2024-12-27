import 'package:quizzie_thunder/models/discover_learning_model.dart';

import '../utils/dio_client.dart';

class LearningApi {
  Future<DiscoverLearningResponseModel>
      getLearningDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().post("/learnings");
      return DiscoverLearningResponseModel.fromJson(response.data['result']);
    } catch (e) {
      // rethrow;
      return DiscoverLearningResponseModel.fromJson({
        "code": "400",
        "status": true,
        "data": {
          "books": [],
          "learnings": [],
          "videos": [],
          "studyPlans": [],
        }
      });
    }
  }
}
