import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/bottom_bar.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/pages/login/login_page_widget.dart';
import 'package:nyaya_tech/pages/login_page/Profile/profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/description/description_widget.dart';
import 'package:nyaya_tech/pages/login_page/description/other_issue/other_issue_widget.dart';
import 'package:nyaya_tech/pages/login_page/edit_profile/edit_profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/otp_page/otp_page_widget.dart';

class Routes {
  static const String login = '/login';
  static const String bottombar = '/bottombar';
  static const String casepage = '/casepage';
  static const String addnotes = '/addnotes';
  static const String addhearing = '/addhearing';
  static const String viewcase = '/viewcase';
  static const String files = '/files';
  static const String addNotes = '/addNotes';
  static const String addHearingNotes = '/addHearingNotes';
  static const String viewNotes = '/viewNotes';
  static const String viewHearingNotes = '/ViewHearingNotes';
  static const String step1 = '/step1';
  static const String step2 = '/step2';
  static const String step3 = '/step3';
  static const String assigneScreen = '/assinge';
  static const String otpPage = '/otpPage';
  static const String description = '/description';
  static const String notes = '/notes';
  static const String summary = '/summary';
  static const String otherissue = '/otherissue';
  static const String editprofile = '/editProfile';
  static const String profile = '/profile';
}

final getPages = [
  GetPage(
      name: Routes.login,
      page: () => MobileLoginWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300)),
  GetPage(
      name: Routes.bottombar,
      page: () => SalomonBottom(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.casepage,
      page: () => CasesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addnotes,
      page: () => AddNotesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addhearing,
      page: () => AddHearingSummaryWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.viewcase,
      page: () => ViewCaseWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.files,
      page: () => FilesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addNotes,
      page: () => AddNotesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addHearingNotes,
      page: () => AddHearingSummaryWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.viewNotes,
      page: () => ViewNotesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.viewHearingNotes,
      page: () => ViewHearingSummaryWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.step1,
      page: () => Step1ScreenWidget(),
      transition: Transition.fade),
  GetPage(
      name: Routes.step2,
      page: () => Step2ScreenWidget(),
      transition: Transition.rightToLeft),
  GetPage(
      name: Routes.step3,
      page: () => Step3ScreenWidget(),
      transition: Transition.rightToLeft),
  GetPage(
      name: Routes.assigneScreen,
      page: () => AssignScreenWidget(),
      transition: Transition.fade),
  GetPage(
      name: Routes.otpPage,
      page: () => MobileLoginOtpWidget(),
      transition: Transition.fade),
  GetPage(
      name: Routes.description,
      page: () => DescriptionWidget(),
      transition: Transition.fade),
  GetPage(
      name: Routes.notes,
      page: () => NotesScreenWidget(),
      transition: Transition.fade),
  GetPage(
      name: Routes.summary,
      page: () => HearingSummaryWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.otherissue,
      page: () => OtherIssues(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.editprofile,
      page: () => AddUserWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.profile,
      page: () => UserProfileWidget(),
      transition: Transition.fadeIn)
];
