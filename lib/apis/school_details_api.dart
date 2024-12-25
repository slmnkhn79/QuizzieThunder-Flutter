import 'dart:typed_data';
import 'package:get_storage/get_storage.dart';
// import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:quizzie_thunder/models/school_details_model.dart';
import 'package:quizzie_thunder/utils/constants.dart';

import '../utils/dio_client.dart';
import 'package:dio/dio.dart' as dio;

class SchoolDetailsApi {
  // Future<EventDetailsResponseModel> getEventDetails(
  //     {required String eventId}) async {
  //   try {
  //     // final response = await DioClient.getDioInstance().get("api/home");
  //     final response = await DioClient.getDioInstance()
  //         .post("/eventDetails", data: {'eventId': eventId});

  //     return EventDetailsResponseModel.fromJson(response.data['result']);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<String> postEventDetails(Uint8List fileData, String fileName) async {
    try {
      // String fileName = p.basename(file.path);
      final localStorage = GetStorage();
      print(localStorage.read(KEY_USER_DATA)['result']['token']);
      dio.FormData formData = dio.FormData.fromMap({
        'file': dio.MultipartFile.fromBytes(
          fileData,
          filename: fileName,
          contentType: MediaType.parse('application/octet-stream'),
        ),
      });
      final response =
          await DioClient.getDioInstanceFile().post("/files/first.jpg"
          , data: formData
          ,options: dio.Options(headers: {"X-Parse-Session-Token": localStorage.read(KEY_USER_DATA)['result']['token'] })
          );
          return response.toString();
    } catch (e) {
      print('Error uploading file: $e');
      rethrow;
      
    }
  }

  Future<String> postSchoolDetails(SchoolDetailsModel school) async {
    try {
      // String fileName = p.basename(file.path);
      
      final response =
          await DioClient.getDioInstanceFile().post("/postSchool"
          , data: {}
          );
          return response.toString();
    } catch (e) {
      print('Error uploading file: $e');
      rethrow;
      
    }
  }

  Future<SchoolDetailsModel> getSchoolDetails(String schoolId) async {
    try {
      // String fileName = p.basename(file.path);
      print("api school id $schoolId");
      final response =
          await DioClient.getDioInstance().post("/getSchool"
          , data: {'schoolId':schoolId}
          );
          return SchoolDetailsModel.fromJson(response.data['result']);
    } catch (e) {
      print('Error getting details : $e');
      rethrow;
      
    }
  }
}
