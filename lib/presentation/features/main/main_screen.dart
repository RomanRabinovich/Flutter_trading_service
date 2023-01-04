import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tplatfom/presentation/common/extensions/build_context_extensions.dart';
import 'package:tplatfom/presentation/common/resources/assets/app_assets.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/common/ui/bottom_sheets/app_bottom_sheet_drag_anchor.dart';
import 'package:tplatfom/presentation/features/chart/chart_screen.dart';
import 'package:tplatfom/presentation/features/profile/profile_screen.dart';
import 'package:tplatfom/providers/user_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _selectedTabIndex = 0;

  bool _isMoreSheetOpened = false;
  late final AnimationController _moreSheetAnimationController;
  late final Animation<double> _moreSheetAnimation;

  @override
  void initState() {
    _moreSheetAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _moreSheetAnimation = CurvedAnimation(
      parent: _moreSheetAnimationController,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          [
            const ChartScreen(),
            const Center(child: Text("Watchlist screen")),
            const Center(child: Text("Orders screen")),
            const Center(child: Text("Positions screen")),
            const ProfileScreen(),
          ].elementAt(_selectedTabIndex),
          _MoreNavigationBottomSheet(
            animation: _moreSheetAnimation,
            children: [
              _MoreNavigationBottomSheetItem(onTap: _openProfileScreen),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _onTabItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.icMainChart)),
            label: context.strings.mainChartTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.icMainWatchlist)),
            label: context.strings.mainWatchlistTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.icMainOrders)),
            label: context.strings.mainOrdersTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage(AppAssets.icMainPositions)),
            label: context.strings.mainPositionsTabLabel,
          ),
          BottomNavigationBarItem(
            icon: !_isMoreSheetOpened ? const ImageIcon(AssetImage(AppAssets.icMainMore)) : const Icon(Icons.close),
            label: context.strings.mainMoreTabLabel,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _moreSheetAnimationController.dispose();
    super.dispose();
  }

  void _onTabItemTapped(int index) {
    if (index == 4) {
      if (!_isMoreSheetOpened) {
        _moreSheetAnimationController.forward();
        setState(() => _isMoreSheetOpened = true);
      } else {
        _moreSheetAnimationController.reverse();
        setState(() => _isMoreSheetOpened = false);
      }
      return;
    }
    setState(() => _selectedTabIndex = index);
  }

  void _openProfileScreen() {
    _moreSheetAnimationController.reverse();
    setState(() {
      _isMoreSheetOpened = false;
      _selectedTabIndex = 4;
    });
    // todo: when making Profile: add navigation to profile screen
    // todo: when making Profile: highlight selected icon
  }
}

class _MoreNavigationBottomSheetItem extends StatelessWidget {
  final VoidCallback onTap;

  const _MoreNavigationBottomSheetItem({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Column(
        children: [
          const ImageIcon(
            AssetImage(AppAssets.icMainProfile),
            color: AppColors.greyLight,
          ),
          Text(
            context.strings.mainProfileLabel,
            style: const TextStyle(color: AppColors.greyLight),
          ),
        ],
      ),
    );
  }
}

// todo: specify if "Reorder" and "CloseButton" are needed
class _MoreNavigationBottomSheet extends StatelessWidget {
  final List<Widget> children;
  final Animation<double> animation;

  const _MoreNavigationBottomSheet({
    required this.children,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Material(
            elevation: 1,
            color: AppColors.greyBackground,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Column(
              children: [
                const AppBottomSheetDragAnchor(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
