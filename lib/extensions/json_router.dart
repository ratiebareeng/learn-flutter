/* import 'dart:convert';

import 'package:flutter/material.dart';

sampleJson() => {
      "route": "/testX",
      "class": "TestX",
      "arguments": {"year": "2023"}
    };

MaterialPageRoute generateRouteFromJson(String json) {
  // Parse the JSON string and extract the necessary information
  Map<String, dynamic> data = jsonDecode(json);
  String routeName = data['route'];
  Object arguments = data['arguments'];

  // Use the extracted information to generate a route
  switch (routeName) {
    case 'MyRoute':
      return MaterialPageRoute(
        builder: (_) => MyRoute(arguments: arguments),
      );
    case 'AnotherRoute':
      return MaterialPageRoute(
        builder: (_) => AnotherRoute(arguments: arguments),
      );
    // Add additional case statements for each route you want to support
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Unknown Route')),
        ),
      );
  }
}
 */