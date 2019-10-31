import 'dart:typed_data';

import 'package:mlkit/mlkit.dart';

class LcdModel {
  static const _modelName = "LCDModel";
  static const _options = FirebaseModelInputOutputOptions(
      [FirebaseModelIOOption(FirebaseModelDataType.BYTE, [64, 64, 1])],
      [FirebaseModelIOOption(FirebaseModelDataType.BYTE, [1, 10])]);
  final FirebaseModelInterpreter _interpreter = FirebaseModelInterpreter.instance;
  final FirebaseModelManager _manager = FirebaseModelManager.instance;
  LcdModel() {
    _manager.registerRemoteModelSource(FirebaseRemoteModelSource(modelName: _modelName));
    _manager.registerLocalModelSource(
        FirebaseLocalModelSource(modelName: _modelName, assetFilePath: "assets/train.tflite"));
  }

  Future<List<dynamic>> run(Uint8List inputBytes) async {
    return _interpreter.run(localModelName: _modelName, inputOutputOptions: _options, inputBytes: inputBytes);
  }
}
