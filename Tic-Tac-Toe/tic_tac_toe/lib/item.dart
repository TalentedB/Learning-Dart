import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Tic {
  empty,
  x,
  circle,
}

class ItemTile extends StatelessWidget {
  const ItemTile(
      {super.key,
      required this.tic,
      required this.i,
      required this.j,
      required this.onTap});

  final Tic tic;
  final int i;
  final int j;
  final Function(int i, int j) onTap;

  IconData get icon {
    switch (tic) {
      case Tic.empty:
        return CupertinoIcons.flame_fill;
      case Tic.x:
        return CupertinoIcons.xmark;
      case Tic.circle:
        return CupertinoIcons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(i, j),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              color: Colors.black12,
            ),
            child: Center(
                child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Icon(
                icon,
              ),
            ))),
      ),
    );
  }
}
