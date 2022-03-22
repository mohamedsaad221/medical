import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class SlidableWidget<T> extends StatelessWidget {
  final Widget? child;
  final SlidableActionCallback? onLeftTap;
  final SlidableActionCallback? onRightTap;


  const SlidableWidget({
    Key? key,
    required this.child,
    required this.onLeftTap,
    required this.onRightTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(

    key: const ValueKey(0),

    // The start action pane is the one at the left or the top side.
    startActionPane: ActionPane(
      // A motion is a widget used to control how the pane animates.
      motion: const ScrollMotion(),

      // A pane can dismiss the Slidable.
      // dismissible: DismissiblePane(onDismissed: () {}),

      // All actions are defined in the children parameter.
      children: [
        // A SlidableAction can have an icon and/or a label.
        SlidableAction(
          onPressed: onLeftTap,
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          icon: Icons.star,
        ),
      ],
    ),

    // The end action pane is the one at the right or the bottom side.
    endActionPane:  ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: onRightTap,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
        ),
      ],
    ),

    child: child!,

  );



}

