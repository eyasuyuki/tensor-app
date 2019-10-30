import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


void main() {
  group('Model test group', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Model test', () async {
      final health = await driver.checkHealth();
      print(health.status);
    });
  });
}
