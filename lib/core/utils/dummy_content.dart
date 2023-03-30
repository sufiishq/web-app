import '../app_export.dart';

class DummyContent {
  static List<SideMenuModel> arrOfSideMenu = [
    SideMenuModel(id: 1, title: "lbl_home".tr, image: ImageConstant.imgHome),
    SideMenuModel(
        id: 2, title: "lbl_tasbeeh_sarkar".tr, image: ImageConstant.imgTasbih),
    SideMenuModel(
        id: 3, title: "lbl_events".tr, image: ImageConstant.imgEvents),
    SideMenuModel(
        id: 4, title: "lbl_gallery".tr, image: ImageConstant.imgGallery),
    SideMenuModel(
        id: 5, title: "lbl_location".tr, image: ImageConstant.imgLocation),
    SideMenuModel(
        id: 6, title: "lbl_shijra".tr, image: ImageConstant.imgShijra),
    SideMenuModel(
        id: 7, title: "lbl_themes".tr, image: ImageConstant.imgThemes),
    SideMenuModel(id: 8, title: "lbl_help".tr, image: ImageConstant.imgHelp),
    SideMenuModel(
        id: 9, title: "lbl_admin_setting".tr, image: ImageConstant.imgSetting),
  ];
}

class SideMenuModel {
  int? id;
  String? title;
  String? image;
  SideMenuModel({this.id, this.title, this.image});
}