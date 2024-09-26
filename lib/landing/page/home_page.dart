import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_page/landing/provider/page_provider.dart';
import 'package:vertical_page/landing/view/about_view.dart';
import 'package:vertical_page/landing/view/contact_view.dart';
import 'package:vertical_page/landing/view/home_view.dart';
import 'package:vertical_page/landing/view/pricing_view.dart';
import 'package:vertical_page/shared/ui/widget/custom_app_menu.dart';

class HomePage extends StatefulWidget {
  final String routeName;
  const HomePage({super.key, this.routeName = ''});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageProvider pageProvider;
  @override
  void initState() {
    super.initState();
    pageProvider = Provider.of<PageProvider>(context, listen: false);
    pageProvider.createScrollController(widget.routeName);
  }

  @override
  void dispose() {
    pageProvider.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          //Permite Colocar elementos en el eje Z
          children: [
            const _HomeBody(),
            const Positioned(right: 20, top: 20, child: CustomAppMenu()),
            Positioned(
                right: 20,
                top: MediaQuery.of(context).size.height / 2,
                child: const SideScroll()),
          ],
        ),
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody({super.key});

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: const [HomeView(), AboutView(), PricingView(), ContactView()],
    );
  }
}
