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
  verifyIfPlayerWon();
  changeTurn();
  getInput();
  clearScreen();
}

String convertStatusToString(int position){
  switch(board[position]){
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

void changeTurn(){
  playerTime++;

  if(playerTime.isEven == true){
    print('Jogador X, escolha um espaço.');
  } else if(playerTime.isEven == false) {
    print('Jogador O, escolha um espaço.');
  }

  verifyIfPlayerWon();
  getInput();
  showBoard();
  changeTurn();
}

String getInput(){
  var userInput = stdin.readLineSync();

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

  //all possibilities to X win
  if((board[0] == Status.cross) & (board[1] == Status.cross) & (board[2] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[3] == Status.cross) & (board[4] == Status.cross) & (board[5] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[3] == Status.cross) & (board[4] == Status.cross) & (board[5] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[6] == Status.cross) & (board[7] == Status.cross) & (board[8] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[0] == Status.cross) & (board[4] == Status.cross) & (board[8] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[2] == Status.cross) & (board[4] == Status.cross) & (board[6] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[0] == Status.cross) & (board[3] == Status.cross) & (board[6] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[1] == Status.cross) & (board[4] == Status.cross) & (board[7] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  } else if((board[2] == Status.cross) & (board[5] == Status.cross) & (board[8] == Status.cross)){
    print('Jogador [X] ganhou o jogo!');
  }

  //all possibilities to O win
  if((board[0] == Status.circle) & (board[1] == Status.circle) & (board[2] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[3] == Status.circle) & (board[4] == Status.circle) & (board[5] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[3] == Status.circle) & (board[4] == Status.circle) & (board[5] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[6] == Status.circle) & (board[7] == Status.circle) & (board[8] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[0] == Status.circle) & (board[4] == Status.circle) & (board[8] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[2] == Status.circle) & (board[4] == Status.circle) & (board[6] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[0] == Status.circle) & (board[3] == Status.circle) & (board[6] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[1] == Status.circle) & (board[4] == Status.circle) & (board[7] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } else if((board[2] == Status.circle) & (board[5] == Status.circle) & (board[8] == Status.circle)){
    print('Jogador [O] ganhou o jogo!');
  } 


}

void clearScreen() {
  if (Platform.isWindows) {
    print(Process.runSync('cls', [], runInShell: true).stdout);
  } else {
    print(Process.runSync('clear', [], runInShell: true).stdout);
  }
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