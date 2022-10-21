import 'package:flutter/material.dart';

import '../widgets/custom_page_route_2.dart';

// to creating a custom page route transition, using the following five steps
// 1. set up a PageRouteBuilder  2. Create a Tween 3. Add an AnimatedWidget  4. Use a CurveTween  5. Combine the two tweens.

// 1. SETTING UP A PAGEROUTEBUILDER : PageRouteBuilder has two callbacks - one to build the content of the route ( pageBuilder) and one to build the route's transition ( transitionBuilder). And the child parameter in transitionBuilder is teh widget returned from pageBuilder.

//2. CREATING A TWEEN: To making the new page animate in from the bottom, it should animate from Offset(0,1) to Offset(0,0) - usually defined using the Offset.zero constructor.  The dy argument to 1 represent a vertical translation one full height of the page. 

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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CustomPageRoute2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); 
      const end = Offset.zero; 
      final tween = Tween (begin: begin, end: end); 
      final offsetAnimation = animation.drive(tween); 
      return child;
    },
  );
}
