import 'package:flutter/material.dart';

import '../../design_system_export.dart';

class DefaultAppBar extends StatelessWidget {
  final String title;
  final bool showTitle;
  const DefaultAppBar({
    Key? key,
    this.title = "",
    this.showTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const VerticalSpace(height: 40),
        Container(
          width: 325,
          alignment: Alignment.centerLeft,
          child: const DefaultBackButton(),
        ),
        const VerticalSpace(height: 40),
        if (showTitle)
          Container(
            width: 325,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyles.heading1,
            ),
          ),
        if (showTitle) const VerticalSpace(height: 40),
      ],
    );
  }
}
