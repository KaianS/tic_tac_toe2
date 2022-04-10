import 'dart:io';

enum Status {none, circle, cross}

int playerTime = 1;
bool isWon = false;

Status verifyTurn = Status.cross;

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

void main(List<String> arguments){
  showBoard();
  changeTurn();
  getInput();
}

String convertStatusToString(int position){
  switch(board[position]){
    case Status.none:
      return '$position';
    case Status.circle:
      return 'O';
    case Status.cross:
      return 'X';
  }

  return null;
}

void changeTurn(){
  playerTime++;

  if(playerTime % 2 == 0){
    print('Jogador X, escolha um espaço.');
  } else if(playerTime % 2 == 1) {
    print('Jogador O, escolha um espaço.');
  }

  getInput();
  showBoard();
  changeTurn();
}

String getInput(){
  var userInput = stdin.readLineSync();
  //print('$userInput');

  var inputNumber = int.tryParse(userInput.toString());

  verifyTurn = verifyTurn == Status.cross ? Status.circle : Status.cross;

  if (inputNumber != null) {
    var updatedTile = verifyTurn == Status.circle ? Status.cross : Status.circle;
    board[inputNumber] = updatedTile;
  }


  return userInput;
}

void checkInputDisponibility(){
  
}

void updateBoardPlayer(){

}

void verifyIfPlayerWon(){

}

void showBoard() {
  print(
      '  ${convertStatusToString(0)}  |  ${convertStatusToString(1)}  |  ${convertStatusToString(2)}  ');
  print('-----|-----|-----');
  print(
      '  ${convertStatusToString(3)}  |  ${convertStatusToString(4)}  |  ${convertStatusToString(5)}  ');
  print('-----|-----|-----');
  print(
      '  ${convertStatusToString(6)}  |  ${convertStatusToString(7)}  |  ${convertStatusToString(8)}  ');
}