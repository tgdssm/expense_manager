import 'dart:async';
import 'package:flutter/material.dart';

abstract class IntroductionController {
  abstract Timer? timerToSkipPage;
  abstract ValueNotifier<int> indexCurrentPage;
  void skipPage(TabController tabController);
}

class IntroductionControllerImpl implements IntroductionController {
  @override
  Timer? timerToSkipPage;

  @override
  ValueNotifier<int> indexCurrentPage = ValueNotifier(0);

  @override
  void skipPage(TabController tabController) {
    timerToSkipPage = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (indexCurrentPage.value >= 2) {
        indexCurrentPage.value = 0;
      } else {
        indexCurrentPage.value++;
      }
      tabController.animateTo(
        indexCurrentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
