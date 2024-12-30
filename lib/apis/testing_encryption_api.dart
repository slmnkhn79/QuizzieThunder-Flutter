import 'dart:convert';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:quizzie_thunder/utils/dio_client.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:pointycastle/export.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

final publicKeyPem = '''-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmCFiFZyqgg13mrl2t9eOLaIGB
oFBBV6PvcIVv39/tmhdrm9hnWY7aZgcg1r7ppG+Wx49UKVPCB2Kjm143zras6oRd
rzQrK+BrQeFbNIfnxIQKuXupaZQqdgZFvO5Su2eiexGLgr/a6m/8LO5bKyS5ZGPd
N6BYLhZfasEb9qKg6wIDAQAB
-----END PUBLIC KEY-----''';

class TestingEncryptionApi {
Future<void> encryptAndSendData(String message) async {
  final publicKey = await parseKeyFromFile<RSAPublicKey>(publicKeyPem);
    final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: rsaParser));
    final encryptedPassword = encrypter.encrypt("Message").base64;
    sendEncryptData(encryptedPassword);
  }
  Future<void> sendEncryptData(String encodedData) async {
    try {
      final response = await DioClient.getDioInstance().post(
        "/decryptData", data: {'encryptedMessage': encodedData}
      );
      print("decryptedMessage: ${response.data['result']}");
    } catch (e) {
      print('encryption failed ${e.toString()}');
    }
  }
}
