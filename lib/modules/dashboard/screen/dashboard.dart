import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rocketzapi_adm/modules/dashboard/controllers/index_page_controller.dart';
import 'package:rocketzapi_adm/shared/models/user_model.dart';
import 'package:rocketzapi_adm/shared/themes/app_colors.dart';
import 'package:rocketzapi_adm/shared/themes/app_text_style.dart';

class DashboardPage extends StatefulWidget {
  final String? arguments;

  const DashboardPage({Key? key, this.arguments}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final pageController = PageIndexController();
  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final params =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                      text: "Olá, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: params['name'],
                            style: TextStyles.titleBoldBackground)
                      ]),
                ),
                subtitle: Text(
                  'Conciliações C6',
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
        ),
        body: pages[pageController.currentPage],
        bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    pageController.setPage(0);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.home,
                    color: AppColors.primary,
                  )),
              GestureDetector(
                onTap: () {
                  print('Clicou');
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_box_outlined,
                        color: AppColors.background,
                      )),
                ),
              ),
              IconButton(
                  onPressed: () {
                    pageController.setPage(1);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.description_outlined,
                    color: AppColors.body,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
