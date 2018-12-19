import 'dart:async';

import 'package:flutter/services.dart';

class Growingio {
  static const MethodChannel _channel =
      const MethodChannel('growingio');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void track(String eventId, {double number, Map<String, dynamic> variable}) async {
    Map<String, dynamic> arguments = {
      'eventId': eventId
    };
    if (number != null) {
      arguments['number'] = number;
    }
    if (variable != null) {
      arguments['variable'] = variable;
    }

    var result = await _channel.invokeMethod(
      'track',
      arguments
    );
    return result;
  }
  
  static Future<Null> setEvar(Map<String, dynamic> variable) async {
    return await _channel.invokeMethod("setEvar", variable);
  }

  static Future<Null> setPeopleVariable(Map<String, dynamic> variable) async {
    return await _channel.invokeMethod("setPeopleVariable", variable);
  }

  static Future<Null> setUserId(String userId) async {
    return await _channel.invokeMethod("setUserId", {"userId": userId});
  }

  static Future<Null> clearUserId() async {
    return await _channel.invokeMethod("clearUserId");
  }

  static Future<Null> setVisitor(Map<String, dynamic> variable) async {
    return await _channel.invokeMethod("setVisitor", variable);
  }
}
