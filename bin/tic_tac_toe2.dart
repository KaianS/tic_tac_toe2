import 'dart:io';

enum Status {none, circle, cross}
bool isXtrue = true;
bool isWon = false;

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
}

String getInput(){
  var turn = isXtrue ? 'X' : 'O';

  print('Sua vez: $turn');

  var userInput = stdin.readLineSync();

  print('$userInput');

  return userInput;
}

void checkInputDisponibility(){
  

}

void updateBoardPlayer(){

}

void verifyIfPlayerWon(){

}

void changeTurn(){

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