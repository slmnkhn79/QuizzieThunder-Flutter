import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
// import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';
import 'package:quizzie_thunder/models/event_detail_response_model.dart';

import '../utils/dio_client.dart';
import 'package:dio/dio.dart' as dio;

class EventDetailsApi {
  Future<EventDetailsResponseModel> getEventDetails(
      {required String eventId}) async {
    try {
      // final response = await DioClient.getDioInstance().get("api/home");
      final response = await DioClient.getDioInstance()
          .post("/eventDetails", data: {'eventId': eventId});

      return EventDetailsResponseModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> postEventDetails(Uint8List fileData, String fileName) async {
    try {
      // String fileName = p.basename(file.path);

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
          );
          return response.toString();
    } catch (e) {
      print('Error uploading file: $e');
      rethrow;
      
    }
  }
}
