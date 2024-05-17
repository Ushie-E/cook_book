import 'package:cook_book/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:cook_book/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cook_book/ui/views/cook_page/cook_page_view.dart';
import 'package:cook_book/ui/views/painter/painter_view.dart';
import 'package:cook_book/ui/dialogs/opacity/opacity_dialog.dart';
import 'package:cook_book/ui/dialogs/pick_stroke/pick_stroke_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CookPageView),
    MaterialRoute(page: PainterView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: OpacityDialog),
    StackedDialog(classType: PickStrokeDialog),
// @stacked-dialog
  ],
)
class App {}