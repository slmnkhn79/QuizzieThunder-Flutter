import 'dart:convert';

import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';

class QuestionText extends StatelessWidget {
  final String question;
  final String? imageUrl;

  const QuestionText({
    Key? key,
    required this.question,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Decode base64 question text
    final decodedQuestion = _decodeBase64(question);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imageUrl != null)
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl!,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          ),
        Text(
          decodedQuestion,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Helper function to decode base64 text
  String _decodeBase64(String encodedText) {
    try {
      return utf8.decode(base64.decode(encodedText));
    } catch (e) {
      return encodedText; // Return the original text if decoding fails
    }
  }
}