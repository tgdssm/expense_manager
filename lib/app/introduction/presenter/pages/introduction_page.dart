import 'package:expense_manager/app/core/app_colors.dart';
import 'package:expense_manager/app/core/assets_path.dart';
import 'package:expense_manager/app/core/injection_dependencies.dart';
import 'package:expense_manager/app/core/routes.dart';
import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:expense_manager/app/core/widgets/helpers/horizontal_space.dart';
import 'package:expense_manager/app/introduction/presenter/controllers/introduction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';
import '../../../core/widgets/buttons/default_button.dart';
import '../../../core/widgets/buttons/outline_button.dart';
import '../../../core/widgets/helpers/vertical_space.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>
    with SingleTickerProviderStateMixin {
  final _controller = injection<IntroductionController>();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabController.addListener(() {});
    _controller.skipPage(_tabController);
    super.initState();
  }

  @override
  void dispose() {
    _controller.timerToSkipPage!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPageView(),
            VerticalSpace(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                isScrollable: true,
                onTap: (index) {
                  _controller.indexCurrentPage.value = index;
                  _controller.timerToSkipPage!.cancel();
                  _controller.skipPage(_tabController);
                },
                tabs: [
                  _buildPageIndicator(0),
                  _buildPageIndicator(1),
                  _buildPageIndicator(2),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  text: Strings.createAccount.i18n(),
                  onTap: () => Modular.to.pushNamed(Routes.createAccount.name),
                ),
                HorizontalSpace(21),
                OutlineButton(
                  text: Strings.login.i18n(),
                  onTap: () => Modular.to.pushNamed(Routes.signin.name),
                ),
              ],
            ),
            VerticalSpace(height: 50),
          ],
        ),
      ),
    );
  }

  _buildPageIndicator(int indexPage) {
    return Obx(
      () => Container(
        height: 8,
        width: indexPage == _controller.indexCurrentPage.value ? 25 : 8,
        margin: const EdgeInsets.only(right: 8),
        decoration: indexPage == _controller.indexCurrentPage.value
            ? BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(37),
              )
            : const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey3,
              ),
      ),
    );
  }

  _buildPageView() {
    return Container(
      padding: const EdgeInsets.only(
        top: 75,
      ),
      constraints: const BoxConstraints(maxHeight: 500),
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildPage(
            image: AssetsPath.standing,
            title: Strings.welcome.i18n(),
            subtitle: Strings.inThisApp.i18n(),
            heightImage: 247,
            widthImage: 167,
          ),
          _buildPage(
            image: AssetsPath.businessAnalytics,
            title: Strings.easyToUse.i18n(),
            subtitle: Strings.justEnterYourExpense.i18n(),
            heightImage: 197,
            widthImage: 295,
          ),
          _buildPage(
            image: AssetsPath.calendar,
            title: Strings.longTerm.i18n(),
            subtitle: Strings.planHowMuch.i18n(),
            heightImage: 192,
            widthImage: 199,
            isCalendar: true,
          ),
        ],
      ),
    );
  }

  _buildPage({
    required String image,
    required String title,
    required String subtitle,
    required double widthImage,
    required double heightImage,
    bool isCalendar = false,
  }) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 247,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                left: isCalendar ? 40 : 0,
                top: isCalendar ? 40 : 0,
              ),
              width: widthImage,
              height: heightImage,
              child: SizedBox(
                child: Image.asset(
                  image,
                ),
              ),
            ),
          ),
          VerticalSpace(height: 63),
          Text(
            title,
            style: TextStyles.heading4,
          ),
          VerticalSpace(height: 17),
          SizedBox(
            height: 50,
            width: 264,
            child: Text(
              subtitle,
              style: TextStyles.body4,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
