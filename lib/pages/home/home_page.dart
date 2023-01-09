import 'package:device_preview/device_preview.dart';
import 'package:exercicio_responsiovidade/breakpoints.dart';
import 'package:exercicio_responsiovidade/pages/home/widgets/app_bar/mobile_app_bar.dart';
import 'package:exercicio_responsiovidade/pages/home/widgets/app_bar/web_app_bar.dart';
import 'package:exercicio_responsiovidade/pages/home/widgets/sections/advantages_section.dart';
import 'package:exercicio_responsiovidade/pages/home/widgets/sections/courses_section.dart';
import 'package:exercicio_responsiovidade/pages/home/widgets/sections/top_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            backgroundColor:  Colors.black,
            appBar: constraints.maxWidth < mobileBreakpoint
                ? const PreferredSize(
              preferredSize: Size(
                double.infinity,
                56,
              ),
              child: MobileAppBar(),
            )
                : const PreferredSize(
              preferredSize: Size(
                double.infinity,
                72,
              ),
              child: WebAppBar(),
            ),
            drawer: constraints.maxWidth < mobileBreakpoint
                ? const Drawer()
                : null,
            body: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1400,
                ),
                child: ListView(
                  children: const [
                    TopSection(),
                    AdvantagesSection(),
                    CoursesSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
