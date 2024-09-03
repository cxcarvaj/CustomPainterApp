import 'package:custom_paint/ui/widgets/widgets.dart';
import 'package:custom_paint/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Custom Paint'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: _HomePageBody(),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final pageModel = pages[index];
        return NavigatorBtnCard(
          icon: pageModel.icon,
          page: pageModel.page,
          label: pageModel.label,
          iconColor: pageModel.iconColor,
        );
      },
    );
  }
}
