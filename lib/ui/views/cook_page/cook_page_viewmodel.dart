import 'package:cook_book/app/app.locator.dart';
import 'package:cook_book/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CookPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void select() {
    _navigationService.replaceWithPainterView();
  }
}
