import 'package:flutter_test/flutter_test.dart';
import 'package:tfk_loading/tfk_loading.dart';

void main() {
  test('LoadingOverlay should show and hide correctly', () {
    final overlay = TfkLoading();
    expect(overlay.isVisible, isFalse);

    overlay.show(
      lottie: 'assets/loading.json');
    expect(overlay.isVisible, isTrue);

    overlay.hide();
    expect(overlay.isVisible, isFalse);
  });
}
