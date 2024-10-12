import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {
  bool toggleMenu = false;

  toggleMenuButton(bool toggle) {
    toggleMenu = toggle;
  }
}
