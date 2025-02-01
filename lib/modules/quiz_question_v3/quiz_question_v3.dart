import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/quiz_question/quiz_question_controller.dart';


class QuizPage extends StatelessWidget {
  final QuizQuestionController controller = Get.put(QuizQuestionController());

  QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showExitDialog();
        return false; // Prevent direct back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: _showExitDialog,
          ),
          title: Text(
            controller.quizName,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    if (controller.isTimer.value) buildTimer(),
                    Expanded(child: buildQuestion()),
                    buildNavigationButtons(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Time Remaining: ${controller.time.value}",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
      ),
    );
  }

  Widget buildQuestion() {
    var currentQuestion = controller.allQuestions[controller.questionCount.value];

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.lightBlue[50],
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              currentQuestion.question!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 16.0),
          ...List.generate(currentQuestion.options.length, (index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                tileColor: Colors.white,
                title: Text(
                  currentQuestion.options[index],
                  style: TextStyle(fontSize: 16),
                ),
                leading: Radio(
                  value: index,
                  groupValue: controller.optionSelectedIndex.value,
                  onChanged: (int? value) {
                    controller.optionSelectedIndex.value = value!;
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!controller.isTimer.value)
            ElevatedButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.orangeAccent),
              child: Text(
                "Previous",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                controller.prevQuestion();
              },
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.green),
            child: Text(
              "Next",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            onPressed: () {
              controller.nextQuestion(
                selectedOption: controller.optionSelectedIndex.value,
                prevQuestionId: controller.allQuestions[controller.questionCount.value].id,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showExitDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.yellow[100],
        title: Text('Exit Quiz'),
        content: Text(
          'If you exit, your quiz will be submitted. Are you sure?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(closeOverlays: true);
              // controller.endQuiz(); // Submit the quiz
            },
            child: Text(
              'Submit & Exit',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}