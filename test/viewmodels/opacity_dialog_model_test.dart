import 'package:flutter_test/flutter_test.dart';
import 'package:cook_book/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('OpacityDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
