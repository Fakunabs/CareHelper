import 'package:flutter/material.dart';
import 'package:flutter_template/common/theme/custom_color.dart';

class DiagnosticBodyWidget extends StatelessWidget {
  const DiagnosticBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomColor customColor = Theme.of(context).extension<CustomColor>()!;
    return Card(
      color: customColor.primaryW100,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              color: customColor.accent,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conclusion',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Text(
                        'Viêm đại tràng cấp tính do nhiễm khuẩn',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Trong trường hợp này, chẩn đoán bệnh mẫu được đưa ra là viêm đại tràng cấp do nhiễm khuẩn. Chẩn đoán này được dựa trên các yếu tố sau: \n \n - Tiền sử ăn hải sản\n - Đau bụng, tiêu chảy đột ngột\n - Đau bụng vùng thượng vị\n - Xét nghiệm tìm máu ẩn trong phân (+)',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
