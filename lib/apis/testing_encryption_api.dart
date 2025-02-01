import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import "package:pointycastle/export.dart";
import 'package:quizzie_thunder/utils/dio_client.dart';

final class TestingEncryptionApi {
  Future<void> encryptAndSendData(String message) async {
    // final key = encrypt.Key.fromBase64('RfJJcxVaW9gKLWu4aBDcyw==');
    // final iv = encrypt.IV.fromBase64("F5502320F8429032");

    // final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // final plainText = "Hello world";
    // final encrypted = encrypter.encrypt(plainText, iv: iv);
    // print(encrypted.base64);

    final encrytedData = "username:password";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(encrytedData);

    final response = await DioClient.getDioInstance().post(
      "/decryptData",
      data: {
        "message": encoded,
      },
    );

    print(response.data);
  }
}
