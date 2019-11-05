import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tensor_app/model.dart';
import 'package:image/image.dart' as img;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  LcdModel model;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureProvider<String>(
          builder: (_) async {
            LcdModel model = LcdModel();
            var imageBytes = (await rootBundle.load('assets/n0.png')).buffer;
            var image = img.decodePng(imageBytes.asUint8List());
            var start = DateTime.now();
            var result = await model.run(imageToByteList(image));
            var stop = DateTime.now();
            print('result='+result.toString());//DEBUG
            return result.toString();
          },
          initialData: 'Reading...',
          child: _FutureText(),
        ),
      ),
    );
  }
}

class _FutureText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final description = Provider.of<String>(context);
    return Center(
      child: Text(description),
    );
  }
}

// int model
Uint8List imageToByteList(img.Image image) {
  var _inputSize = 64;
  var convertedBytes = new Uint8List(1 * _inputSize * _inputSize * 1);
  var buffer = new ByteData.view(convertedBytes.buffer);
  int pixelIndex = 0;
  for (var i = 0; i < _inputSize; i++) {
    for (var j = 0; j < _inputSize; j++) {
      var pixel = image.getPixel(i, j);
//      buffer.setUint8(pixelIndex, (pixel >> 16) & 0xFF);
//      pixelIndex++;
//      buffer.setUint8(pixelIndex, (pixel >> 8) & 0xFF);
//      pixelIndex++;
      buffer.setUint8(pixelIndex, (pixel) & 0xFF);
      pixelIndex++;
    }
  }
  return convertedBytes;
}
