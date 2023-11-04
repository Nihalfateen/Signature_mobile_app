import 'package:flutter/material.dart';


import '../../../../fileExport.dart';
import 'components/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen(this.navigationShell, {super.key});
  static const route = "/MainScreen";

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar:HomeBottomNavBar(navigationShell.currentIndex,navigationShell),
      // BottomNavigationBar(
      //   currentIndex: navigationShell.currentIndex,
      //   showUnselectedLabels: true,
      //   type:BottomNavigationBarType.fixed ,
      //   showSelectedLabels: true,
      //   selectedItemColor: AppColors.orange0,
      //   unselectedItemColor: AppColors.gery2,
      //
      //   items:  [
      //     BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.homeIcon),activeIcon: SvgPicture.asset(AppImages.homeIcon,color: AppColors.orange0) , label: 'Home',),
      //     BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.stockIcon), activeIcon: SvgPicture.asset(AppImages.stockIcon,color: AppColors.orange0,),label: 'Home'),
      //     BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.meetingsIcon),  activeIcon:SvgPicture.asset(AppImages.meetingsIcon,color: AppColors.orange0),label: 'Home'),
      //     BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.comitteesIcon), activeIcon:SvgPicture.asset(AppImages.comitteesIcon,color: AppColors.orange0), label: 'Home'),
      //     BottomNavigationBarItem(icon: SvgPicture.asset(AppImages.moreIcon),activeIcon:SvgPicture.asset(AppImages.moreIcon,color: AppColors.orange0,), label: 'Home'),
      //
      //   ],
      //   onTap: _onTap,
      // ),
    );
  }
}
