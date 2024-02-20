import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/survey/widgets/survey_question.widget.dart';

class SurveyBodyWidget extends StatelessWidget {
  const SurveyBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFBDDDFD),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SurveyQuestionWidget(
              question: 'Mức huyết áp của bệnh nhân là bao nhiêu?',
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 8,
            ),
            SurveyQuestionWidget(
              question: 'Bệnh nhân đang sử dụng những loại thuốc nào?',
            ),
            SizedBox(
              height: 8,
            ),
            SurveyQuestionWidget(
              question: 'Cảm giác và tâm trạng của bệnh nhân như thế nào?',
            ),
            SizedBox(
              height: 8,
            ),
            SurveyQuestionWidget(
              question:
                  'Bệnh nhân có ngủ đủ 8 tiếng 1 ngày hay không, có làm việc quá sức không?',
            ),
          ],
        ),
      ),
    );
  }
}
