import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../fileExport.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int index;
  final StatefulNavigationShell navigationShell;


  HomeBottomNavBar(this.index, this.navigationShell);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        navBarItem(
          context: context,
          naviIndex: index,
          itemIndex: 0,
          activeLabel: "Home",
          icon: Icon(Icons.home),
          activeIcon:
          Icon(Icons.home, color: AppColors.red1,),
        ),
        navBarItem(
          context: context,
          itemIndex: 1,
          naviIndex: index,
          activeLabel: "Meetings",
          icon: Icon(Icons.group),
          activeIcon: Icon(Icons.group, color: AppColors.red1,),
        ),
        navBarItem(
          context: context,
          itemIndex: 2,
          naviIndex: index,
          activeLabel: "Notifications",
          icon: Icon(Icons.notifications_active_outlined),
          activeIcon:  Icon(Icons.notifications_active_outlined, color: AppColors.red1,),
        ),
        navBarItem(
          context: context,
          itemIndex: 3,
          naviIndex: index,
          activeLabel: "Profile",
          icon: Icon(Icons.person),
          activeIcon:  Icon(Icons.person, color: AppColors.red1,),
        ),

      ],
    );
  }

  Widget navBarItem({
    required BuildContext context,
    required int itemIndex,
    required int naviIndex,
    required Widget activeIcon,
    required String activeLabel,
    required Widget icon,
    final VoidCallback? onTap,
  }) {
    final selected = itemIndex == naviIndex;
    return Expanded(
      flex: 1,
      child: InkResponse(
        onTap: (){
          navigationShell.goBranch(
            itemIndex,
            // A common pattern when using bottom navigation bars is to support
            // navigating to the initial location when tapping the item that is
            // already active. This example demonstrates how to support this behavior,
            // using the initialLocation parameter of goBranch.
            initialLocation: itemIndex == navigationShell.currentIndex,
          );
        },

        child: AnimatedContainer(
          key: Key(activeLabel),
          height: ScreenUtil().screenHeight/10,
          // color: AppColors.dividerColor.withOpacity(.1),
          duration: const Duration(milliseconds: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 55.79999923706055,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: selected ?AppColors.red1:Colors.transparent)
              ),
              SizedBox(height: 10.h,),
              selected ? activeIcon : icon,
              SizedBox(
                height: 10.h,
              ),
              Text(
                tr(activeLabel),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: selected ? AppColors.red1 : AppColors.black1,fontWeight:selected ? FontWeight.w700:FontWeight.w300 ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
