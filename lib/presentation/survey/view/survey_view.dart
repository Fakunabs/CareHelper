import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/survey/widgets/survey_body_widget.dart';
import 'package:flutter_template/presentation/survey/widgets/survey_metadata_widget.dart';

class SurveyView extends StatelessWidget {
  const SurveyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('New Medical Survery'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SurveyMetadata(metadata: 'Date: 07/02/2024'),
                SizedBox(
                  height: 16,
                ),
                SurveyMetadata(metadata: 'Doctor: Dr. Lê Văn Liêm'),
                SizedBox(
                  height: 30,
                ),
                SurveyBodyWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
