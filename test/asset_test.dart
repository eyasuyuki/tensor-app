import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tensor_app/main.dart';
import 'package:image/image.dart' as img;

void main() {
  testWidgets('Image test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());//TEST

    var imageBytes = (await rootBundle.load('assets/n0.png')).buffer;
    assert(imageBytes != null);

    print(imageBytes.asUint8List().fold('', (prev, byte) { return "${prev} ${byte.toRadixString(16)}"; }));

    var image = img.decodePng(imageBytes.asUint8List());
    assert(image != null);

    print(image.getBytes().fold('', (prev, byte) { return "${prev} ${byte.toRadixString(16)}"; }));

    var imageList = imageToByteList(image);
    assert(imageList != null);

    print(imageList.fold('', (prev, byte) { return "${prev} ${byte.toRadixString(16)}"; }));

  });
}