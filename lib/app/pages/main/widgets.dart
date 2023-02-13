part of 'main_page.dart';

class _AppTabData {
  final String name;
  final IconData icon;
  final PageRouteInfo route;

  _AppTabData({
    required this.name,
    required this.icon,
    required this.route,
  });
}

class _BottomNavigationBar extends StatelessWidget {
  final List<_AppTabData> tabs;

  const _BottomNavigationBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    final bottomNavigationBarWidth = MediaQuery.of(context).size.width - (Dimens.normal * 2);
    final singleTabWidth = (bottomNavigationBarWidth / 4) - 2;
    return Stack(
      children: [
        Container(
          height: 56,
          width: bottomNavigationBarWidth,
          margin: const EdgeInsets.only(bottom: Dimens.normal),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.black,
                Color(0xFF282A3A),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
            border: Border.all(
              color: const Color(0xFF282A3A),
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              tabs.length,
              (index) => _TabItem(
                tab: tabs[index],
                index: index,
                width: singleTabWidth,
                activeIndex: tabsRouter.activeIndex,
                onTabSelected: ((value) {
                  tabsRouter.setActiveIndex(value);
                  tabsRouter.notifyAll();
                }),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: Dimens.normal - 5,
          left: (singleTabWidth * (tabsRouter.activeIndex)) + (singleTabWidth / 2 - 10),
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
          child: Column(
            children: [
              Container(
                width: 20,
                height: 56,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.0, 0.2],
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 3,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final _AppTabData tab;
  final double width;
  final int index;
  final int activeIndex;
  final ValueChanged<int> onTabSelected;

  const _TabItem({
    required this.tab,
    required this.width,
    required this.index,
    required this.activeIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              tab.icon,
              color: _color(context),
            ),
            Text(
              tab.name,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: _color(context),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Color _color(BuildContext context) {
    if (index == activeIndex) {
      return Theme.of(context).iconTheme.color!;
    }
    return Theme.of(context).iconTheme.color!.withOpacity(0.5);
  }
}
