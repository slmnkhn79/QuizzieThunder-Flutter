import 'dart:convert';
import 'package:quizzie_thunder/utils/dio_client.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

final publicKeyPem = '''
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmCFiFZyqgg13mrl2t9eOLaIGB
oFBBV6PvcIVv39/tmhdrm9hnWY7aZgcg1r7ppG+Wx49UKVPCB2Kjm143zras6oRd
rzQrK+BrQeFbNIfnxIQKuXupaZQqdgZFvO5Su2eiexGLgr/a6m/8LO5bKyS5ZGPd
N6BYLhZfasEb9qKg6wIDAQAB
-----END PUBLIC KEY-----
''';

class TestingEncryptionApi {
Future<void> encryptAndSendData(String message) async{
    final publicKey = RsaKeyHelper().parsePublicKeyFromPem(publicKeyPem);

    // Convert message to bytes

    // Encrypt the message bytes
    final encryptedMessageBytes = encrypt(message, publicKey);
    final messageBytes = utf8.encode(encryptedMessageBytes);

    final encryptedMessageBase64 = base64Encode(messageBytes);
    print('encryptedMessageBase64: $encryptedMessageBase64');
    await sendEncryptData(encryptedMessageBase64);
    // return encryptedMessageBase64;

    // Send `encryptedMessageBase64` to Parse Server
  }

  // List<int> encrypt(List<int> data, RSAPublicKey publicKey) {
  //   final cipherText = RSAP (data, publicKey);
  //   print('ciphertext:- $cipherText');
  //   return cipherText;
  // }

  Future<void> sendEncryptData(String encodedDate) async {
    try {
      final response = await DioClient.getDioInstance().post(
        "/decryptData", data:{'encryptedMessage': encodedDate}
      );
      print("decryptedMesage: ${response.data['result']}");
    } catch (e) {
      print('encrytion failed ${e.toString()}');
    }
  }
}
