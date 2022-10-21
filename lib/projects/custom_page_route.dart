import 'package:flutter/material.dart';

// to creating a custom page route transition, using the following five steps
// 1. set up a PageRouteBuilder  2. Create a Tween 3. Add an AnimatedWidget  4. Use a CurveTween  5. Combine the two tweens.
class CustomPageRoute extends StatefulWidget {
  const CustomPageRoute({super.key});

  @override
  State<CustomPageRoute> createState() => _CustomPageRouteState();
}

class _CustomPageRouteState extends State<CustomPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
