import 'dart:typed_data';

import 'package:mlkit/mlkit.dart';

class LcdModel {
  final FirebaseModelInterpreter _interpreter = FirebaseModelInterpreter.instance;
  final FirebaseModelManager _manager = FirebaseModelManager.instance;
  final _modelName = "LCDModel";
  LcdModel() {
    _manager.registerLocalModelSource(
        FirebaseLocalModelSource(modelName: _modelName, assetFilePath: "assets/train.tflite"));
  }

  Future<List> run(Uint8List inputBytes) async {
    return _interpreter.run(localModelName: _modelName, inputBytes: inputBytes);
  }
}
