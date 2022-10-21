import 'package:flutter/material.dart';

// to creating a custom page route transition, using the following five steps
// 1. set up a PageRouteBuilder  2. Create a Tween 3. Add an AnimatedWidget  4. Use a CurveTween  5. Combine the two tweens.

// 1. SETTING UP A PAGEROUTEBUILDER : PageRouteBuilder has two callbacks - one to build the content of the route ( pageBuilder) and one to build the route's transition ( transitionBuilder). And the child parameter in transitionBuilder is teh widget returned from pageBuilder.

class CustomPageRoute extends StatefulWidget {
  const CustomPageRoute({super.key});

  @override
  State<CustomPageRoute> createState() => _CustomPageRouteState();
}

class _CustomPageRouteState extends State<CustomPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              child: const Text('Animate Page')),
        ));
  }
}
