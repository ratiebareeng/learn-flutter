import 'dart:convert';

import 'package:flutter/widgets.dart';

// navigate to json specified route
extension NavigatorJsonX on Navigator {
  static Future<T?> pushNamedRouteFromJson<T extends Object?>(
      BuildContext context, String json) {
    // Parse the JSON string and extract the necessary information
    Map<String, dynamic> data = jsonDecode(json);
    String routeName = data['route'];
    Object? arguments = data['arguments'];

    // Use the extracted information to push a new route
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
