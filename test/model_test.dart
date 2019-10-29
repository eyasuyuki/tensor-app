import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tensor_app/model.dart';

void main() async {
  testWidgets('LcdModel test', (WidgetTester tester) async {
    LcdModel model = LcdModel();
    assert(model != null);

    ByteData data = await rootBundle.load('assets/n0.png');
    assert(data != null);

    List<int> bytes = Uint8List.view(data.buffer);
    assert(bytes != null);

    Uint8List inputBytes = Uint8List.fromList(bytes);
    assert(inputBytes != null);

    var result = await model.run(inputBytes);
//    assert(result != null);
//
//    print("result="+result.toString());
  });
}