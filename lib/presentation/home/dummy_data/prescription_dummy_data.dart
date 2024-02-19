import 'package:flutter_template/data/models/prescription_model.dart';
import 'package:flutter_template/data/models/prescription_detail_model.dart';

PrescriptionModel dummyData = PrescriptionModel(
  note: 'Lorem ipsum dolor sit amet',
  details: [
    PrescriptionDetailModel(
      medicineName: 'Medicine 1',
      medicineType: 'Type 1',
      quantity: 2,
      amount: '10mg',
      usage: 'Twice daily',
    ),
    PrescriptionDetailModel(
      medicineName: 'Medicine 2',
      medicineType: 'Type 2',
      quantity: 1,
      amount: '5mg',
      usage: 'Once daily',
    ),
  ],
  startDate: DateTime.now(),
  endDate: DateTime.now().add(const Duration(days: 7)),
  prescriptionFilename: 'prescription.pdf',
  examinationId: 12345,
);
