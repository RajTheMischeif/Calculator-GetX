import 'package:get/get.dart';

class MainScreenController extends GetxController {
  Rx<String> disPlayTxt = Rx<String>('');
  Rx<String> numberHolder = Rx<String>('');
  Rx<String> opp = Rx<String>('');

  Rx<double> first = Rx<double>(0);
  Rx<double> second = Rx<double>(0);

  void addBtnVal(String btnVal) {
    print(opp.value);
    print(numberHolder.value);
    print(disPlayTxt.value.length);
    if (disPlayTxt.value.startsWith('0') && disPlayTxt.value.length >= 1) {
      disPlayTxt.value = disPlayTxt.value.substring(1);
    } else if (disPlayTxt.value.startsWith('+') ||
        // disPlayTxt.value.startsWith('-') ||
        disPlayTxt.value.startsWith('x') ||
        disPlayTxt.value.startsWith('/') && disPlayTxt.value.length >= 1) {
      disPlayTxt.value = '';

      numberHolder.value = '';
      opp.value = '';
    } else if (disPlayTxt.value.startsWith('-') &&
        disPlayTxt.value.length < 2) {
      // numberHolder.value = '';
      opp.value = '';
    }
    if (btnVal == 'AC') {
      disPlayTxt.value = '';
      numberHolder.value = '';
      btnVal = '';
      opp.value = '';
      first(0);
      second(0);
    } else if (btnVal == '/' ||
        btnVal == 'x' ||
        btnVal == '-' ||
        btnVal == '+') {
      if (first.value != 0) {
        if (opp.value == '+' ||
            // opp.value == '-' ||
            opp.value == 'x' ||
            opp.value == '/') {
          if (btnVal == '-') {
            if (numberHolder.value == '') {
              disPlayTxt.value += btnVal;
              numberHolder.value = btnVal;
            }
          }
        } else if (opp.value == '-') {
          if (btnVal == '-') {
            disPlayTxt.value =
                disPlayTxt.value.substring(0, disPlayTxt.value.length - 1);
            disPlayTxt.value += '+';
            numberHolder.value = btnVal;
          }
        }
      } else if (first.value == 0) {
        if (opp.value == '') {
          if (disPlayTxt.value.length >= 1) {
            first.value = double.parse(numberHolder.value);
            opp.value = btnVal;
            disPlayTxt.value += btnVal;
            numberHolder.value = '';
          } else if (btnVal == '-') {
            disPlayTxt.value += btnVal;
            numberHolder.value = btnVal;
          }
        }
      }
    } else if (btnVal == '=') {
      if (opp.value == '+') {
        second.value = double.parse(numberHolder.value);
        disPlayTxt.value = (first.value + second.value).toString();
        if (disPlayTxt.value.endsWith('.0')) {
          disPlayTxt.value =
              disPlayTxt.value.substring(0, disPlayTxt.value.length - 2);
          first(0);
          opp.value = '';
          numberHolder.value = disPlayTxt.value;
        } else {
          opp.value = '';
          first(0);
          numberHolder.value = disPlayTxt.value;
        }
      } else if (opp.value == '-') {
        second.value = double.parse(numberHolder.value);
        disPlayTxt.value = (first.value - second.value).toString();
        if (disPlayTxt.value.endsWith('.0')) {
          disPlayTxt.value =
              disPlayTxt.value.substring(0, disPlayTxt.value.length - 2);
          first(0);
          opp.value = '';
          numberHolder.value = disPlayTxt.value;
        } else {
          opp.value = '';
          first(0);
          numberHolder.value = disPlayTxt.value;
        }
      } else if (opp.value == 'x') {
        second.value = double.parse(numberHolder.value);
        disPlayTxt.value = (first.value * second.value).toString();
        if (disPlayTxt.value.endsWith('.0')) {
          disPlayTxt.value =
              disPlayTxt.value.substring(0, disPlayTxt.value.length - 2);
          first(0);
          opp.value = '';
          numberHolder.value = disPlayTxt.value;
        } else {
          opp.value = '';
          first(0);
          numberHolder.value = disPlayTxt.value;
        }
      } else if (opp.value == '') {
        disPlayTxt.value = '';
      } else {
        second.value = double.parse(numberHolder.value);
        disPlayTxt.value = (first.value / second.value).toString();
        if (disPlayTxt.value.endsWith('.0')) {
          disPlayTxt.value =
              disPlayTxt.value.substring(0, disPlayTxt.value.length - 2);
          first(0);
          opp.value = '';
          numberHolder.value = disPlayTxt.value;
        } else {
          opp.value = '';
          first(0);
          numberHolder.value = disPlayTxt.value;
        }
      }
    } else if (btnVal == '.') {
      if (numberHolder.value.contains('.')) {
        return;
      } else {
        disPlayTxt.value += btnVal;
        numberHolder.value += btnVal;
      }
    } else {
      numberHolder.value += btnVal;
      disPlayTxt.value += btnVal;
    }
  }
}
