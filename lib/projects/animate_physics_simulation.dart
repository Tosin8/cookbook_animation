// Physics simulations, making the app interactions to feel realistic and interactive. Eg animating a widget to act as if it were attached to a spring or falling with gravity.

// USING THE STEPS BELOW TO DEMOSTRATES HOW TO MOVE A WIDGET FROM A DRAGGED POINT BACK TO THE CENTER USING A SPRING SIMULATION.
//1. Set up an animation controller  2. Move the widget using gestures  3. Animate the widet   4. Calculate the velocity to simulate a sprining motion.

// 1. Setting Up an animation controller

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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
  const DraggableCard({super.key, required this.child});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // STEP 3: Animate the widget
  late Animation<Alignment> _animation;

  // CALCUATE AND RNS A SPRING SIMULATION,
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;
    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  // STEP 2:  Move the widget using gestures

  Alignment _dragAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
        onPanDown: (details) {},
        onPanUpdate: (details) {
          setState(
            () {
              _dragAlignment += Alignment(
                details.delta.dx / (size.width / 2),
                details.delta.dy / (size.height / 2),
              );
            },
          );
        },
        onPanEnd: (details) {
          _runAnimation(details.velocity.pixelsPerSecond, size);
        },
        child: Align(
          alignment: _dragAlignment,
          child: Card(
            child: widget.child,
          ),
        ));
  }
}
