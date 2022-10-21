import 'package:flutter/material.dart';

import '../widgets/custom_page_route_2.dart';

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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CustomPageRoute2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      //2. CREATING A TWEEN: To making the new page animate in from the bottom, it should animate from Offset(0,1) to Offset(0,0) - usually defined using the Offset.zero constructor.  The dy argument to 1 represent a vertical translation one full height of the page. The transitionBuilder callback has an animation parameter - it's an Animation<double> producing values between 0 and 1. then convert the animation into an animation using a Tween. 

      const begin = Offset(0.0, 1.0); 
      const end = Offset.zero; 
      final tween = Tween (begin: begin, end: end); 
      final offsetAnimation = animation.drive(tween); 

      //4. USING A CURVETWEEN - Providing selection of easing curves that adjust the rate of the animation over time. The Curves class provides a predefined set of commonly used curves. Eg. Curves.easeOut - makes the animation start quickly and end slowly. 

      var curve = Curves.ease; 
      var curveTween = CurveTween(curve:curve); 

      //5. COMBINE THE TWO TWEENS - then using the tween by passing it to animation.drive(), creating a new Animation<Offset> that can be given to the SlideTransition wiidet. 

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve:curve)); 

      //3. USING AN ANIMATEDWIDGET: Extending AnimatedWidget that rebuild themselves when the value of the animation changes. Eg SlideTranition taking an Animation<Offset> and translates its child - using a FractionalTranslation Widget whenever the value of the animation changes. 

      return  SlideTransition(
       // BEFORE COMBINING THE TWEEN. 
       // position: offsetAnimation, 

       // AFTER COMBINING THE TWEEN 
       position: animation.drive(tween), 
        child: child;
    },
  );
}
