import 'dart:io';

enum Status { none, circle, cross }

int playerTime = 0;
bool isWon = false;
Status verifyTurn = Status.cross;
bool isGameFinished = false;

List<Status> board = [
  Status.none,
  Status.none,
  Status.none,
  Status.none,
  Status.none,
  Status.none,
  Status.none,
  Status.none,
  Status.none,
];

// All the winning sequences
List<List> winningMatches = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

void main(List<String> arguments) {
  while (!isGameFinished) {
    game();
  }
}

// Game flux
void game() {
  showBoard();
  getInput();
  verifyIfPlayerWon();
  clearScreen();
}

// Get user input
void getInput() {
  print('Jogador ${convertStatusToString(verifyTurn)}, faça sua jogada');
  var userInput = stdin.readLineSync();

  var inputNumber = int.tryParse(userInput.toString());

  if (inputNumber != null) {
    var updatedTile = verifyTurn;
    board[inputNumber] = updatedTile;
  }

  // Switch turns
  changeTurn();
}

void checkInputDisponibility() {}

// Check if there's a winner
void verifyIfPlayerWon() {
  // Check if it's a draw
  if (playerTime == 9) {
    finishGame(Status.none);
  }

  for (var i = 0; i < 8; i++) {
    // Contador
    var counter = 0;

    // Iterating each array
    // Ex: [0, 1, 2]
    // Add +1 for X ou -1 for circle in the counter
    winningMatches[i].forEach((element) {
      if (board[element] == Status.cross) {
        counter++;
      } else if (board[element] == Status.circle) {
        counter--;
      }
    });

    if (counter == 3) {
      finishGame(Status.cross);
    } else if (counter == -3) {
      finishGame(Status.circle);
    }
  }
}

// Switch players
void changeTurn() {
  playerTime++;

  if (verifyTurn == Status.cross) {
    verifyTurn = Status.circle;
  } else {
    verifyTurn = Status.cross;
  }
}

// Finish game
// Ask if the user wants to keep playing
void finishGame(Status winner) {
  showBoard();

  if (winner == Status.none) {
    print('Empate! Ninguém ganhou o jogo!');
  } else {
    print('Parabéns! ${winner == Status.cross ? "X" : "O"} ganhou o jogo!');
  }

  isGameFinished = true;
  print('Quer jogar novamente? S / N');
  var availableAnswers = ['S', 's', 'N', 'n'];
  var userChoice = stdin.readLineSync();
  if (availableAnswers.contains(userChoice)) {
    if (userChoice == 'S' || userChoice == 's') {
      resetGame();
    }
    if (userChoice == 'N' || userChoice == 'n') {
      clearScreen();
    }
  }
}

// Reset game to initial values
void resetGame() {
  playerTime = 1;
  isWon = false;
  verifyTurn = Status.cross;
  isGameFinished = false;

  board = [
    Status.none,
    Status.none,
    Status.none,
    Status.none,
    Status.none,
    Status.none,
    Status.none,
    Status.none,
    Status.none,
  ];
}

// Clear terminal
void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync('cls', [], runInShell: true).stdout);
  } else {
    print(Process.runSync('clear', [], runInShell: true).stdout);
  }
}

String createBoardCharacters(int position) {
  switch (board[position]) {
    case Status.none:
      return '$position';
    case Status.circle:
      return 'O';
    case Status.cross:
      return 'X';
    default:
      return 'Por favor, digite um valor válido:';
  }
}

String convertStatusToString(Status status) {
  switch (status) {
    case Status.none:
      return 'none';
    case Status.cross:
      return 'X';
    case Status.circle:
      return 'O';
  }


  return null;
}

void showBoard() {
  print(
      '  ${createBoardCharacters(0)}  |  ${createBoardCharacters(1)}  |  ${createBoardCharacters(2)}  ');
  print('-----|-----|-----');
  print(
      '  ${createBoardCharacters(3)}  |  ${createBoardCharacters(4)}  |  ${createBoardCharacters(5)}  ');
  print('-----|-----|-----');
  print(
      '  ${createBoardCharacters(6)}  |  ${createBoardCharacters(7)}  |  ${createBoardCharacters(8)}  ');
}