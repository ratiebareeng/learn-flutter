import 'package:flutter/material.dart';
import 'package:test_bloc_flutter/ui/widgets/basic_animation_page.dart';

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
        body: const AnimationPage());
  }
}
