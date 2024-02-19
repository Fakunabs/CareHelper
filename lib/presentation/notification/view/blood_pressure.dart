import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/common/theme/color_styles.dart';
import 'package:flutter_template/presentation/notification/bloc/medical_history_bloc.dart';
import 'package:flutter_template/presentation/widgets/common_app_bar.dart';
import 'package:flutter_template/router/app_router.dart';

class BloodPressurePage extends StatelessWidget {
  const BloodPressurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicalHistoryBloc(),
      child: _BloodPressurePage(),
    );
  }
}

class _BloodPressurePage extends StatefulWidget {
  @override
  __BloodPressurePageState createState() => __BloodPressurePageState();
}

class __BloodPressurePageState extends State<_BloodPressurePage> {
  int _groupValue = 0; // Mặc định hiển thị view _overRallView

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalHistoryBloc, MedicalHistoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CommonAppBar(
            title: '12/01/2024',
            hasBoxDecoration: false,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
            child: Column(
              children: [
                _buildTitle('Huyết áp ổn định'),
                _buildDoctorInfo(
                  doctorName: 'Bác sĩ Lê Văn Liêm',
                  hospital: 'Bệnh viện Đà Nẵng',
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: _buildSegmentedControl(),
                ),
                const SizedBox(height: 20),
                _buildView(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildDoctorInfo({
    required String doctorName,
    required String hospital,
  }) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hospital,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentedControl() {
    return CupertinoSlidingSegmentedControl<int>(
      groupValue: _groupValue,
      backgroundColor: ColorStyles.silver2,
      thumbColor: ColorStyles.dodgerBlue,
      children: {
        0: _buildSegment('Tổng quan', isSelected: _groupValue == 0),
        1: _buildSegment('Xét nghiệm', isSelected: _groupValue == 1),
        2: _buildSegment('Ghi chú', isSelected: _groupValue == 2),
      },
      onValueChanged: (groupValue) {
        setState(() => _groupValue = groupValue!);
      },
    );
  }

  Widget _buildSegment(String text, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildView() {
    switch (_groupValue) {
      case 0:
        return _overRallView();
      case 1:
        return _testingView();
      case 2:
        return _noteView();
      default:
        return Container(); // Default case to satisfy Flutter's requirements
    }
  }

  Widget _overRallView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSectionTitle('Sinh hiệu'),
          _buildMetric('Huyết áp', '80 - 110 mmHg'),
          _buildDualMetric('Nhịp tim', '90 BPM', 'Đường huyết', '140 mg/dL'),
          const SizedBox(height: 15),
          _buildDiagnosis(),
        ],
      ),
    );
  }

  Widget _buildMetric(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: ColorStyles.silver,
        borderRadius: BorderRadius.circular(9.68),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDualMetric(
    String title1,
    String value1,
    String title2,
    String value2,
  ) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: ColorStyles.silver,
              borderRadius: BorderRadius.circular(9.68),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value1,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: ColorStyles.silver,
              borderRadius: BorderRadius.circular(9.68),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value2,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiagnosis() {
    return Column(
      children: [
        _buildSectionTitle('Chuẩn đoán từ bác sĩ'),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: ColorStyles.silver,
            borderRadius: BorderRadius.circular(9.68),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulletText(text: 'Huyết áp ổn định'),
              BulletText(text: 'Nhịp tim ổn định'),
              BulletText(text: 'Đường huyết ổn định'),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            _buildSectionTitle('Đơn thuốc'),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorStyles.silver,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                    size: 23,
                  ),
                  SizedBox(width: 4), // Khoảng cách giữa biểu tượng và văn bản
                  Text(
                    'Đơn gần đây nhất',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildMedicineInfo(
          name: 'Thuốc viên nén',
          description: 'Paracetamol',
          dosage: '1 viên x 3 lần/ngày',
          instructions: 'Dùng với nước',
        ),
        const SizedBox(height: 15), // Khoảng cách giữa các container],
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildMedicineInfo({
    required String name,
    required String description,
    required String dosage,
    required String instructions,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: ColorStyles.darkGrey,
        borderRadius: BorderRadius.circular(9.68),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorStyles.grey,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dosage,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    instructions,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _testingView() {
    return Column(
      children: [
        _buildSectionTitle('Xét nghiệm máu'),
        _resultInformationTesting(),
        const SizedBox(height: 15),
        _buildSectionTitle('Xét nghiệm mỡ máu'),
        _resultInformationCustomTesting(
          'Triglyceride', '150 mg/dL', // Thay đổi giá trị kết quả
        ),
      ],
    );
  }

  Widget _noteView() {
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildSectionTitle('Ghi chú lần khám'),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: ColorStyles.grey3,
            borderRadius: BorderRadius.circular(9.68),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 10),
              BulletText(text: 'Huyết áp ổn định'),
              SizedBox(height: 5),
              BulletText(text: 'Nhịp tim ổn định'),
              SizedBox(height: 5),
              BulletText(text: 'Đường huyết ổn định'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _resultInformationTesting() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: BoxDecoration(
        color: ColorStyles.grey2,
        borderRadius: BorderRadius.circular(9.68),
      ),
      child: Column(
        children: [
          _buildResultRow('Ure Máu', '80 mg/Dl'),
          const SizedBox(height: 14),
          _buildResultRow('Acid uric máu', '80 mg/Dl'),
          const SizedBox(height: 14),
          _buildResultRow('Creatinin máu', '80 mg/Dl'),
          const SizedBox(height: 14),
          _seeMoreButton(),
        ],
      ),
    );
  }

  Widget _resultInformationCustomTesting(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: ColorStyles.grey2,
        borderRadius: BorderRadius.circular(9.68),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildResultRow(title, value),
                  const SizedBox(height: 14),
                  _seeMoreButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _seeMoreButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouter.testDetails,
                (route) => true,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorStyles.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Xem chi tiết',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons
                      .arrow_forward_ios, // Chọn biểu tượng mũi tên phải tương ứng
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '\u2022 ',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
