import 'package:asrooshop/view/screens/category_screen.dart';
import 'package:asrooshop/view/screens/favorites_screen.dart';
import 'package:asrooshop/view/screens/home_screen.dart';
import 'package:asrooshop/view/screens/settings_screen.dart';
import 'package:get/get.dart';
//we will use obs
class MainController extends GetxController{
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;


  final title = [
    "Asroo Shop",
    "Categories",
    "Favorites",
    "Settings",
  ].obs;
}