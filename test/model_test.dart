import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tensor_app/main.dart';
import 'package:tensor_app/model.dart';
import 'package:image/image.dart' as img;

void main() {
  testWidgets('Model test', (WidgetTester tester) async {
    var _model = LcdModel();
    assert(_model != null);

    var imageBytes = (await rootBundle.load('assets/n0.png')).buffer;
    assert(imageBytes != null);

    var image = img.decodePng(imageBytes.asUint8List());
    assert(image != null);

    var result = await _model.run(imageToByteList(image));
    assert(result != null);

    print(result);

  });
}