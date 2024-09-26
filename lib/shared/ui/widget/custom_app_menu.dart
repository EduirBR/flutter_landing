import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_page/landing/provider/page_provider.dart';
import 'package:vertical_page/shared/ui/widget/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin sirve para las animaciones
  bool isOpen = false;
  late AnimationController aController;

  @override
  void initState() {
    super.initState();
    aController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen ? aController.reverse() : aController.forward();
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius:
                BorderRadius.circular(10), // Radio de los bordes redondeados
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 200,
          height: isOpen ? 250 : 42,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, aController: aController),
              if (isOpen) ...menuItems(pageProvider)
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    super.key,
    required this.isOpen,
    required this.aController,
  });

  final bool isOpen;
  final AnimationController aController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: isOpen ? 50 : 0,
        ),
        Text(
          'Menu',
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 28),
        ),
        const Spacer(),
        AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: aController,
          color: Colors.white,
        )
      ],
    );
  }
}

List<Widget> menuItems(PageProvider pageProvider) {
  return [
    CustomMenuItem(text: 'Home', onPressed: () => pageProvider.goTo(0)),
    CustomMenuItem(text: 'About', onPressed: () => pageProvider.goTo(1)),
    CustomMenuItem(text: 'Pricing', onPressed: () => pageProvider.goTo(2)),
    CustomMenuItem(text: 'Contact', onPressed: () => pageProvider.goTo(3)),
  ];
}

class SideScroll extends StatelessWidget {
  const SideScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      height: 100,
      width: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(menuItems(pageProvider).length, (index) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => pageProvider.goTo(index),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: index == pageProvider.currentIndex
                          ? Colors.white
                          : Colors.black,
                      borderRadius: BorderRadius.circular(50)),
                  width: 8,
                  height: 8,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
