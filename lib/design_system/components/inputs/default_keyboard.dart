import 'package:expense_manager/design_system/design_system_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DefaultKeyboard extends StatefulWidget {
  final ValueChanged<double> value;
  final Color valueColor;
  const DefaultKeyboard({
    Key? key,
    required this.value,
    this.valueColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  State<DefaultKeyboard> createState() => _DefaultKeyboardState();
}

class _DefaultKeyboardState extends State<DefaultKeyboard> {
  final ValueNotifier<String> income = ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const VerticalSpace(
          height: 25,
        ),
        ValueListenableBuilder<String>(
          valueListenable: income,
          builder: (context, value, child) {
            if (value.isEmpty) {
              widget.value(0);
              return _buildShowIncome(
                "0,00",
                AppColors.lightGrey,
              );
            } else {
              widget.value(double.parse(
                  income.value.replaceAll('.', '').replaceFirst(',', '.')));
              return _buildShowIncome(
                value,
                widget.valueColor,
              );
            }
          },
        ),
        const VerticalSpace(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              "1",
              (value) => _buildFormattedIncome(value),
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "2",
              (value) => _buildFormattedIncome(value),
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "3",
              (value) => _buildFormattedIncome(value),
            ),
          ],
        ),
        const VerticalSpace(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              "4",
              (value) => _buildFormattedIncome(value),
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "5",
              (value) => _buildFormattedIncome(value),
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "6",
              (value) => _buildFormattedIncome(value),
            ),
          ],
        ),
        const VerticalSpace(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              "7",
              (value) => _buildFormattedIncome(value),
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "8",
              (value) => _buildFormattedIncome(value),
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "9",
              (value) => _buildFormattedIncome(value),
            ),
          ],
        ),
        const VerticalSpace(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberButton(
              ",",
              (value) => _buildFormattedIncome(value),
            ),
            const HorizontalSpace(width: 18),
            _buildNumberButton(
              "0",
              (value) => _buildFormattedIncome(value),
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

  Row _buildShowIncome(String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "R\$",
          style: TextStyles.body1.copyWith(
            color: valueColor,
          ),
        ),
        const HorizontalSpace(width: 8),
        Text(
          value,
          style: TextStyles.heading2.copyWith(
            color: valueColor,
          ),
        ),
      ],
    );
  }

  _buildFormattedIncome(String value) {
    if (income.value.isEmpty && value == ",") {
      return;
    }
    if (income.value.length > 12) {
      return;
    }
    if (income.value.contains(',') && income.value.split(',').last.length > 1) {
      return;
    }
    if (income.value.contains(',') && value == ',') {
      return;
    }
    income.value += value;
    if (income.value.length >= 2 &&
        income.value.split('').reversed.toList()[1] == ",") {
      return;
    } else if (income.value.split('').last != ",") {
      income.value = NumberFormat.decimalPattern('pt_BR').format(
        double.parse(income.value.replaceAll('.', '').replaceFirst(',', '.')),
      );
      if (income.value.contains(',') &&
          income.value.split(',').last.length == 1) {
        income.value += '0';
      }
    }
  }

  _buildNumberButton(String number, ValueChanged<String> onTap) {
    return GestureDetector(
      onTap: () => onTap(number),
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
