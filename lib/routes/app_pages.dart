import 'package:get/get.dart';
import 'package:quizzie_thunder/models/discover_learning_model.dart';
import 'package:quizzie_thunder/modules/books/all_books_binding.dart';
import 'package:quizzie_thunder/modules/books/all_books_page.dart';
import 'package:quizzie_thunder/modules/books/books_view/book_binding.dart';
import 'package:quizzie_thunder/modules/books/books_view/book_page.dart';
import 'package:quizzie_thunder/modules/event_details/post_detail_binding.dart';
import 'package:quizzie_thunder/modules/event_details/post_details_page.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_binding.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_page.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_binding.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_page.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/learning_by_id_binding.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_by_id/learning_page_by_id.dart';
import 'package:quizzie_thunder/modules/learning_path/learning_path_controller.dart';
import 'package:quizzie_thunder/modules/school_details/school_details_binding.dart';
import 'package:quizzie_thunder/modules/school_details/school_details_page.dart';
import 'package:quizzie_thunder/modules/study_plans/all_study_plans_page.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plan_binding.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plans_by_id/study_paln_by_id_binding.dart';
import 'package:quizzie_thunder/modules/study_plans/study_plans_by_id/study_plan_by_id_page.dart';
import 'package:quizzie_thunder/modules/videos/all_videos_binding.dart';
import 'package:quizzie_thunder/modules/videos/all_videos_page.dart';
import 'package:quizzie_thunder/modules/videos/play_video/play_video_binding.dart';
import 'package:quizzie_thunder/modules/videos/play_video/play_video_page.dart';

import '../modules/create_new_password/create_new_password_binding.dart';
import '../modules/create_new_password/create_new_password_page.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_page.dart';
import '../modules/forgot_password/forgot_password_binding.dart';
import '../modules/forgot_password/forgot_password_page.dart';
import '../modules/udpate_password/udpate_password_binding.dart';
import '../modules/udpate_password/update_password_page.dart';
import '../modules/quiz_detail/quiz_detail_binding.dart';
import '../modules/quiz_detail/quiz_detail_page.dart';
import '../modules/quiz_question/quiz_question_binding.dart';
import '../modules/quiz_question/quiz_question_page.dart';
import '../modules/quiz_result/quiz_result_binding.dart';
import '../modules/quiz_result/quiz_result_page.dart';
import '../modules/quizzes/quizzes_binding.dart';
import '../modules/quizzes/quizzes_page.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_page.dart';
import '../modules/signin/signin_binding.dart';
import '../modules/signin/signin_page.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import '../modules/update_profile/update_profile_binding.dart';
import '../modules/update_profile/update_profile_page.dart';
import '../modules/verify_otp/verify_otp_binding.dart';
import '../modules/verify_otp/verify_otp_page.dart';
import '../modules/welcome/welcome_binding.dart';
import '../modules/welcome/welcome_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.welcomePage,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signInPage,
      page: () => SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordPage,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.createNewPasswordPage,
      page: () => CreateNewPasswordPage(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.updatePasswordPage,
      page: () => UpdatePasswordPage(),
      binding: UpdatePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpPage,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyOtpPage,
      page: () => VerifyOtpPage(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboardPage,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.settingsPage,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.quizzesPage,
      page: () => QuizzesPage(),
      binding: QuizzesBinding(),
    ),
    GetPage(
      name: AppRoutes.updateProfilePage,
      page: () => UpdateProfilePage(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.quizDetailPage,
      page: () => QuizDetailPage(),
      binding: QuizDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.quizResultPage,
      page: () => QuizResultPage(),
      binding: QuizResultBinding(),
    ),
    GetPage(
      name: AppRoutes.quizQuestionPage,
      page: () => QuizQuestionPage(),
      binding: QuizQuestionBinding(),
    ),
    GetPage(
      name: AppRoutes.postDetailsPage,
      page: () => PostDetailsPage(eventId: ''),
      binding: PostDetailsBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.addPostPage,
    //   page: () => AddSchoolDetails(),
    //   binding: AddSchoolBinding(),
    // ),
    GetPage(
      name: AppRoutes.schoolDetailsPage,
      page: () => SchoolDetails(),
      binding: SchoolBinding(),
    ),
    GetPage(
      name: AppRoutes.galleryDateView,
      page: () => GalleryHeader(),
      binding: GalleryHeaderBinding(),
    ),
    GetPage(
      name: AppRoutes.learningView,
      page: () => LearningPage(),
      binding: LearningBinding(),
    ),
    GetPage(
      name: AppRoutes.learningPathById,
      page: () => LearningPageById(),
      binding: LearningPathByIdBinding(),
    ),
    GetPage(
      name: AppRoutes.allStudyPlans,
      page: () => AllStudyPlans(),
      binding: StudyPlanBinding(),
    ),
    GetPage(
      name: AppRoutes.studyPlansById,
      page: () => StudyPlanByIdPage(),
      binding: StudyPlanByIdBinding(),
    ),
    GetPage(
      name: AppRoutes.allVideos,
      page: () => AllVideosPage(),
      binding: AllVideosBinding(),
    ),
    GetPage(
      name: AppRoutes.videoById,
      page: () => PlayVideoPage(),
      binding: PlayVideoBinding(),
    ),
    GetPage(
      name: AppRoutes.allBooks,
      page: () => AllBooksPage(),
      binding: AllBooksBinding(),
    ),
    GetPage(
      name: AppRoutes.bookById,
      page: () => BookPage(),
      binding: BookBinding(),
    ),
  ];
}
