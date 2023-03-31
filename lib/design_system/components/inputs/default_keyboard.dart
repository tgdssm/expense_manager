import 'package:expense_manager/design_system/design_system_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DefaultKeyboard extends StatelessWidget {
  const DefaultKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> income = ValueNotifier("");
    return Column(
      children: [
        const Divider(),
        const VerticalSpace(
          height: 40,
        ),
        ValueListenableBuilder<String>(
          valueListenable: income,
          builder: (context, value, child) {
            if (value.isEmpty) {
              return const Text("");
            } else if (",".allMatches(value).length > 1) {
              int countAppear = 0;
              value = value.split('').where((e) {
                if (e == ",") {
                  countAppear++;
                  if (countAppear == 1) {
                    return true;
                  } else {
                    return false;
                  }
                }
                return true;
              }).join();
            } else if (value.split('').last != ",") {
              value = NumberFormat.decimalPattern('pt_BR').format(
                double.parse(value.replaceFirst(',', '.')),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("R\$"),
                const HorizontalSpace(width: 8),
                Text(
                  value,
                ),
              ],
            );
          },
        ),
        const VerticalSpace(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              "1",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "2",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "3",
              (value) => income.value += value,
            ),
          ],
        ),
        const VerticalSpace(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              "4",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "5",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "6",
              (value) => income.value += value,
            ),
          ],
        ),
        const VerticalSpace(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              "7",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "8",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "9",
              (value) => income.value += value,
            ),
          ],
        ),
        const VerticalSpace(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              ",",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "0",
              (value) => income.value += value,
            ),
            const HorizontalSpace(width: 18),
            Container(
              height: 57,
              width: 87,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  if (income.value.isNotEmpty) {
                    final value = income.value.split('');
                    value.removeLast();
                    income.value = value.join();
                  }
                },
                icon: SvgPicture.asset(AssetsPath.delete),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildNumberButton(String number, ValueChanged<String> onTap) {
    return GestureDetector(
      onTap: () {
        onTap(number);
      },
      child: Container(
        height: 57,
        width: 87,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey3),
          borderRadius: BorderRadius.circular(33),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyles.body1.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
