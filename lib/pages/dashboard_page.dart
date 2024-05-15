import 'package:coffee_shop_ui/pages/dashboard_fragments/home_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int indexMenu = 0;
  final menu = [
    {
      'icon': 'assets/ic_home_border.png',
      'icon_active': 'assets/ic_home_filled.png',
      'fragment': const HomeFragment(),
    },
    {
      'icon': 'assets/ic_heart_border.png',
      'icon_active': 'assets/ic_heart_border.png',
      'fragment': const Center(child: Text('Favorite')),
    },
    {
      'icon': 'assets/ic_bag_border.png',
      'icon_active': 'assets/ic_bag_border.png',
      'fragment': const Center(child: Text('Bag')),
    },
    {
      'icon': 'assets/ic_notification_border.png',
      'icon_active': 'assets/ic_notification_border.png',
      'fragment': const Center(child: Text('Notification')),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[indexMenu]['fragment'] as Widget,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: List.generate(menu.length, (index) {
            Map item = menu[index];
            bool isActive = indexMenu == index;
            return Expanded(
              child: InkWell(
                onTap: () {
                  indexMenu = index;
                  setState(() {});
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(20),
                      ImageIcon(
                        AssetImage(
                          item[isActive ? 'icon_active' : 'icon'],
                        ),
                        size: 24,
                        color: Color(isActive ? 0xffC67C4E : 0xffA2A2A2),
                      ),
                      if (isActive) const Gap(6),
                      if (isActive)
                        Container(
                          height: 5,
                          width: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xffC67C4E),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
