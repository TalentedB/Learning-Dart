import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<List<Tic>> tic = [
    [Tic.empty, Tic.empty, Tic.empty],
    [Tic.empty, Tic.empty, Tic.empty],
    [Tic.empty, Tic.empty, Tic.empty]
  ];
  Tic currentPlayer = Tic.x;
  List<Tic> playerStates = [Tic.x, Tic.circle];

  void updateMatrix(int i, int j) {
    if (tic[i][j] != Tic.empty) {
      return;
    }
    setState(() => tic[i][j] = currentPlayer);
    if (checkIfWon(currentPlayer, 1, 0) || checkIfWon(currentPlayer, 0, 1)) {
      return;
    }
    currentPlayer = currentPlayer == Tic.x ? Tic.circle : Tic.x;
  }

  bool checkIfWon(Tic currentPlayer, int horizontal, int vertical) {
    for (int i = 0; i < 3; i++) {
      if (tic[i * horizontal + 0 * vertical]
                  [i * vertical + 0 * horizontal] ==
              currentPlayer &&
          tic[i * horizontal + 1 * vertical][i * vertical + 1 * horizontal] ==
              currentPlayer &&
          tic[i * horizontal + 2 * vertical][i * vertical + 2 * horizontal] ==
              currentPlayer) {
        setState(() {
          tic = [
            [Tic.empty, Tic.empty, Tic.empty],
            [Tic.empty, Tic.empty, Tic.empty],
            [Tic.empty, Tic.empty, Tic.empty]
          ];
          currentPlayer = Tic.x;
        });
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Tic Tac Toe';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Column(children: [
                    Expanded(
                      child: Row(children: [
                        ItemTile(
                          tic: tic[0][0],
                          i: 0,
                          j: 0,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                        ItemTile(
                          tic: tic[0][1],
                          i: 0,
                          j: 1,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                        ItemTile(
                          tic: tic[0][2],
                          i: 0,
                          j: 2,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Row(children: [
                        ItemTile(
                          tic: tic[1][0],
                          i: 1,
                          j: 0,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                        ItemTile(
                          tic: tic[1][1],
                          i: 1,
                          j: 1,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                        ItemTile(
                          tic: tic[1][2],
                          i: 1,
                          j: 2,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Row(children: [
                        ItemTile(
                          tic: tic[2][0],
                          i: 2,
                          j: 0,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                        ItemTile(
                          tic: tic[2][1],
                          i: 2,
                          j: 1,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                        ItemTile(
                          tic: tic[2][2],
                          i: 2,
                          j: 2,
                          onTap: (i, j) => updateMatrix(i, j),
                        ),
                      ]),
                    ),
                  ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
