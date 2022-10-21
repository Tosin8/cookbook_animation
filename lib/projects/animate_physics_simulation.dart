// Physics simulations, making the app interactions to feel realistic and interactive. Eg animating a widget to act as if it were attached to a spring or falling with gravity.

// USING THE STEPS BELOW TO DEMOSTRATES HOW TO MOVE A WIDGET FROM A DRAGGED POINT BACK TO THE CENTER USING A SPRING SIMULATION.
//1. Set up an animation controller  2. Move the widget using gestures  3. Animate the widet   4. Calculate the velocity to simulate a sprining motion.

// 1. Setting Up an animation controller

import 'package:flutter/material.dart';

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const DraggableCard(
            child: FlutterLogo(
          size: 128,
        )));
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({super.key, required FlutterLogo child});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
