import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

abstract class IntroductionController {
  abstract Timer? timerToSkipPage;
  abstract Rx<int> indexCurrentPage;
  void skipPage(TabController tabController);
}

class IntroductionControllerImpl implements IntroductionController {
  @override
  Timer? timerToSkipPage;

  @override
  Rx<int> indexCurrentPage = 0.obs;

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
