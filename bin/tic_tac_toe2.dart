import 'dart:io';

enum Status {none, circle, cross}

bool isXtrue = true;
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
  var turn = isXtrue ? 'X' : 'O';
  print('Sua vez: $turn');
  

  getInput();
  showBoard();
  changeTurn();
}

String getInput(){
  var userInput = stdin.readLineSync();
  //print('$userInput');

  var inputNumber = int.tryParse(userInput.toString());

  if (inputNumber != null) {
    var updatedTile = verifyTurn == Status.circle ? Status.cross : Status.circle;
    board[inputNumber] = updatedTile;
  }

  verifyTurn = verifyTurn == Status.cross ? Status.circle : Status.cross;


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