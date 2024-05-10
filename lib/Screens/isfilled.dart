import 'package:flutter/material.dart';
import 'package:get/get.dart';

class isFilledController extends GetxController {
  RxInt oScore = 0.obs;
  RxInt xScore = 0.obs;
  RxList<String> isFilled = ['', '', '', '', '', '', '', '', ''].obs;
  RxList<String> played = ['', '', '', '', '', '', '', '', ''].obs;
  RxBool turn = true.obs;
  int counter = 0;
  bool isWin = false;
  RxString winner = "".obs;

  toadd(String value, int index) {
    isFilled[index] = "Filled";
    if (isFilled != "Filled") {
      played[index] = value;
    }

    counter++;
    if (counter > 4) {
      WhoIsWinner();
    }
  }

  WhoIsWinner() {
    if (played[0] == played[1] && played[1] == played[2] && played[0] != '') {
      isWin = !isWin;
      winner.value = played[0];
      clear();
    }
    if (played[3] == played[4] && played[4] == played[5] && played[3] != '') {
      isWin = !isWin;
      winner.value = played[3];
      clear();
    }
    if (played[6] == played[7] && played[7] == played[8] && played[6] != '') {
      isWin = !isWin;
      winner.value = played[6];
      clear();
    }
    if (played[0] == played[3] && played[3] == played[6] && played[0] != '') {
      isWin = !isWin;
      winner.value = played[0];
      clear();
    }
    if (played[1] == played[4] && played[4] == played[7] && played[1] != '') {
      isWin = !isWin;
      winner.value = played[1];
      clear();
    }
    if (played[2] == played[5] && played[5] == played[8] && played[2] != '') {
      isWin = !isWin;
      winner.value = played[2];
      clear();
    }
    if (played[0] == played[4] && played[4] == played[8] && played[0] != '') {
      isWin = !isWin;
      winner.value = played[0];
      clear();
    }
    if (played[2] == played[4] && played[4] == played[6] && played[2] != '') {
      isWin = !isWin;
      winner.value = played[2];
      clear();
    }
  }

  clear() {
    played = ['', '', '', '', '', '', '', '', ''].obs;
  }
}
