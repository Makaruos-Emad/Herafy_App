import 'package:herafy/core/utils/app_images.dart';
import '../model/navigation_item_model.dart';

const List<NavigationItemModel> navigationItems = [
  NavigationItemModel(
    icon: Assets.imagesBottomNavigatoinBarIconsHome,
    activeIcon: Assets.imagesBottomNavigatoinBarIconsHomeBlue,
    label: 'الرئيسية',
  ),
  NavigationItemModel(
    icon: Assets.imagesBottomNavigatoinBarIconsList,
    activeIcon: Assets.imagesBottomNavigatoinBarIconsListBlue,
    label: 'طلباتي',
  ),
  NavigationItemModel(
    icon: Assets.imagesBottomNavigatoinBarIconsChat,
    activeIcon: Assets.imagesBottomNavigatoinBarIconsChatBlue,
    label: 'المحادثات',
  ),
  NavigationItemModel(
    icon: Assets.imagesBottomNavigatoinBarIconsUser,
    activeIcon: Assets.imagesBottomNavigatoinBarIconsUserBlue,
    label: 'حسابي',
  ),
];
