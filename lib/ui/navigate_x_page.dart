import 'package:flutter/material.dart';
import 'package:test_bloc_flutter/extensions/navigator_extension.dart';

class TestX extends StatelessWidget {
  const TestX({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final String year = args['year'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test NavigatorX'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: (() {
                NavigatorJsonX.pushNamedRouteFromJson(
                    context, '{"route":"/basic-anim"}');
              }),
              child: const Text('Basic Animation'),
            ),
            TextButton(
              onPressed: (() {
                NavigatorJsonX.pushNamedRouteFromJson(
                    context, '{"route":"/adv-anim"}');
              }),
              child: const Text('Advanced Animation'),
            ),
            // const AdvancedAnimationPage(),
          ],
        ));
  }
}
