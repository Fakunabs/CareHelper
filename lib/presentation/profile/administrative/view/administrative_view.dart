import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/theme/color_styles.dart';
import 'package:flutter_template/generated/locale_keys.g.dart';

class AdministrativeView extends StatelessWidget {
  const AdministrativeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyView();
  }
}

class MyView extends StatelessWidget {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Form(
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(
                color: ColorStyles.textFormFieldColor,
              ),
              decoration: const InputDecoration(
                labelText: 'dábhkdsabkdhsabdkhjsa',
                hintText: 'Enter your name',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: ColorStyles.textFormFieldColor,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'dábdsabdhjsahdasdbhaks',
                      hintText: 'Enter your date of birth',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: ColorStyles.textFormFieldColor,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'đấnkdsadas',
                      hintText: 'Enter your sex',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              style: const TextStyle(
                color: ColorStyles.textFormFieldColor,
              ),
              decoration: const InputDecoration(
                labelText: 'sua cho nay',
                hintText: 'Enter your citizen id',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextFormField(
              style: const TextStyle(
                color: ColorStyles.textFormFieldColor,
              ),
              decoration: const InputDecoration(
                labelText: 'adsadbhjsadas',
                hintText: 'Enter your insurance id',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextFormField(
              style: const TextStyle(
                color: ColorStyles.textFormFieldColor,
              ),
              decoration: const InputDecoration(
                labelText: 'dsadasdsadsadas',
                hintText: 'Enter your address',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextFormField(
              style: const TextStyle(
                color: ColorStyles.textFormFieldColor,
              ),
              decoration: const InputDecoration(
                labelText: 'sdsdsadasdas',
                hintText: 'Enter your occupation',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: ColorStyles.textFormFieldColor,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'dsadasdas',
                      hintText: 'Enter your height',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: ColorStyles.textFormFieldColor,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'sadasdasdas',
                      hintText: 'Enter your weight',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              style: const TextStyle(
                color: ColorStyles.textFormFieldColor,
              ),
              decoration: const InputDecoration(
                labelText: 'ádsadsasa',
                hintText: 'Enter your recent check up',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
