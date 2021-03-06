
// import 'package:flutter_test/flutter_test.dart';

// import '../lib/utils/theme.dart';
// void main(){

//   test('sum', (){
//     int x = sum(5,3);
//     expect(x,8);
//   });

// }
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CouponAssistant/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';



void main()
{
  TestWidgetsFlutterBinding.ensureInitialized();
  String output="00:06 G zomato When is the right time to eat? Always! Hey, foodie! We are all set to delight you with an mmmazing offer.Use code ZOMATO and enjoy up to 50% off on your next order. Pick your favourites from our wide range of cuisines and satisfy all your cravings now! TCA. Begin the binge For the love of food, Team Zomato In case you wish to stop receiving emails from Zomato, please unsubscribe here O";
    var str = output;
    var sln = str.split(" ");
    int i = 0;
    var day, month;
    var percent = "0";
    var name = "unknown";
    var code;
    int totallen = sln.length;

    for (i; i < sln.length; i++) {
      //FOR NAME
      var lows = sln[i].toLowerCase();
      lows = lows.replaceAll(".", "");
      lows = lows.replaceAll(",", "");
      lows = lows.replaceAll(":", "");
      lows = lows.replaceAll(";", "");
      if (lows == "zomato")
        name = "ZOMATO";
      else if (lows == "swiggy")
        name = "SWIGGY";
      else if (lows == "uber")
        name = "UBER";
      else if (lows == "ola")
        name = "OLA";
      else if (lows == "bookmyshow")
        name = "BOOKMYSHOW";
      else if (lows == "paytm")
        name = "PAYTM";
      else if (lows == "faasos")
        name = "FAASOS";
      else if (lows == "myntra") name = "MYNTRA";

      //FOR CODE

      if (sln[i] == "code") {
        int length = sln[i + 1].length;
        if (length > 4) code = sln[i + 1];
      }

      //FOR PERCENTAGE
      int j = 0;
      for (j = 0; j < sln[i].length; j++) {
        if (sln[i][j] == '%' && sln[i].length <= 3) {
          percent = sln[i];
        }
      }

      //FOR CODE AGAIN
      if (code == null) {
        bool x;
        bool y;
        bool z = true;
        int j = 0;
        int length = sln[i].length;
        if (length > 4) {
          for (j; j < length; j++) {
            var temp = sln[i][j].toLowerCase();
            if (temp == "a" ||
                temp == "b" ||
                temp == "c" ||
                temp == "d" ||
                temp == "e" ||
                temp == 'f' ||
                temp == "g" ||
                temp == "h" ||
                temp == "i" ||
                temp == "j" ||
                temp == "k" ||
                temp == "l" ||
                temp == "m" ||
                temp == "n" ||
                temp == "o" ||
                temp == "p" ||
                temp == "q" ||
                temp == "r" ||
                temp == "s" ||
                temp == "t" ||
                temp == "u" ||
                temp == "v" ||
                temp == "w" ||
                temp == "x" ||
                temp == "y" ||
                temp == "z") {
              x = true;
            }
            if (temp == "0" ||
                temp == "1" ||
                temp == "2" ||
                temp == "3" ||
                temp == "4" ||
                temp == "5" ||
                temp == "6" ||
                temp == "7" ||
                temp == "8" ||
                temp == "9") {
              y = true;
            }
            if (temp == "/" || temp == ".") z = false;
            if (y == true && x == true && z == true) {
              code = sln[i];
            }
          }
        }
      }

      // FOR EXPIRY
      var x = sln[i].toLowerCase();
      if (x == "expiry" || x == "expires" || x == "valid" || x == "validity") {
        int temp = 1;
        for (temp; i + temp < totallen; temp++) {
          x = sln[i + temp].toLowerCase();
          x = x.replaceAll(".", "");
          x = x.replaceAll(",", "");

          if (x == 'january' || x == 'jan')
            month = "01";
          else if (x == 'febuary' || x == "feb")
            month = "02";
          else if (x == 'march')
            month = "03";
          else if (x == 'april')
            month = "04";
          else if (x == 'may')
            month = "05";
          else if (x == 'june')
            month = "06";
          else if (x == 'july')
            month = "07";
          else if (x == 'august')
            month = "08";
          else if (x == 'september')
            month = "09";
          else if (x == 'october')
            month = "10";
          else if (x == 'novmeber')
            month = "11";
          else if (x == 'december' || x == "dec") month = "12";

          if (x == "1" || x == "1st") {
            day = "01";
          } else if (x == "2" || x == "2nd") {
            day = "02";
          } else if (x == "3" || x == "3rd") {
            day = "03";
          } else if (x == "4" || x == "4th") {
            day = "04";
          } else if (x == "5" || x == "5th") {
            day = "05";
          } else if (x == "6" || x == "6th") {
            day = "06";
          } else if (x == "7" || x == "7th") {
            day = "07";
          } else if (x == "8" || x == "8th") {
            day = "08";
          } else if (x == "9" || x == "9th") {
            day = "09";
          } else if (x == "10" || x == "10th") {
            day = "10";
          } else if (x == "11" || x == "11th") {
            day = "11";
          } else if (x == "12" || x == "12th") {
            day = "12";
          } else if (x == "13" || x == "13th") {
            day = "13";
          } else if (x == "14" || x == "14th") {
            day = "14";
          } else if (x == "15" || x == "15th") {
            day = "15";
          } else if (x == "16" || x == "16th") {
            day = "16";
          } else if (x == "17" || x == "17th") {
            day = "17";
          } else if (x == "18" || x == "18th") {
            day = "18";
          } else if (x == "19" || x == "19th") {
            day = "19";
          } else if (x == "20" || x == "20th") {
            day = "20";
          } else if (x == "21" || x == "21st") {
            day = "21";
          } else if (x == "22" || x == "22nd") {
            day = "22";
          } else if (x == "23" || x == "23rd") {
            day = "23";
          } else if (x == "24" || x == "24th") {
            day = "24";
          } else if (x == "25" || x == "25th") {
            day = "25";
          } else if (x == "26" || x == "26th") {
            day = "26";
          } else if (x == "27" || x == "27th") {
            day = "27";
          } else if (x == "28" || x == "28th") {
            day = "28";
          } else if (x == "29" || x == "29th") {
            day = "29";
          } else if (x == "30" || x == "30th") {
            day = "30";
          } else if (x == "31" || x == "31st") {
            day = "31";
          }
        }
      }
    }
    if (month == null) {
      i = 0;
      int temp = 0;
      for (i; i < sln.length; i++) {
        for (temp; i + temp < totallen; temp++) {
          var x = sln[i + temp].toLowerCase();
          x = x.replaceAll(".", "");
          x = x.replaceAll(",", "");

          if (x == 'january' || x == 'jan')
            month = "01";
          else if (x == 'febuary' || x == "feb")
            month = "02";
          else if (x == 'march')
            month = "03";
          else if (x == 'april')
            month = "04";
          else if (x == 'may')
            month = "05";
          else if (x == 'june')
            month = "06";
          else if (x == 'july')
            month = "07";
          else if (x == 'august')
            month = "08";
          else if (x == 'september')
            month = "09";
          else if (x == 'october')
            month = "10";
          else if (x == 'novmeber')
            month = "11";
          else if (x == 'december' || x == "dec") month = "12";

          if (x == "1" || x == "1st") {
            day = "01";
          } else if (x == "2" || x == "2nd") {
            day = "02";
          } else if (x == "3" || x == "3rd") {
            day = "03";
          } else if (x == "4" || x == "4th") {
            day = "04";
          } else if (x == "5" || x == "5th") {
            day = "05";
          } else if (x == "6" || x == "6th") {
            day = "06";
          } else if (x == "7" || x == "7th") {
            day = "07";
          } else if (x == "8" || x == "8th") {
            day = "08";
          } else if (x == "9" || x == "9th") {
            day = "09";
          } else if (x == "10" || x == "10th") {
            day = "10";
          } else if (x == "11" || x == "11th") {
            day = "11";
          } else if (x == "12" || x == "12th") {
            day = "12";
          } else if (x == "13" || x == "13th") {
            day = "13";
          } else if (x == "14" || x == "14th") {
            day = "14";
          } else if (x == "15" || x == "15th") {
            day = "15";
          } else if (x == "16" || x == "16th") {
            day = "16";
          } else if (x == "17" || x == "17th") {
            day = "17";
          } else if (x == "18" || x == "18th") {
            day = "18";
          } else if (x == "19" || x == "19th") {
            day = "19";
          } else if (x == "20" || x == "20th") {
            day = "20";
          } else if (x == "21" || x == "21st") {
            day = "21";
          } else if (x == "22" || x == "22nd") {
            day = "22";
          } else if (x == "23" || x == "23rd") {
            day = "23";
          } else if (x == "24" || x == "24th") {
            day = "24";
          } else if (x == "25" || x == "25th") {
            day = "25";
          } else if (x == "26" || x == "26th") {
            day = "26";
          } else if (x == "27" || x == "27th") {
            day = "27";
          } else if (x == "28" || x == "28th") {
            day = "28";
          } else if (x == "29" || x == "29th") {
            day = "29";
          } else if (x == "30" || x == "30th") {
            day = "30";
          } else if (x == "31" || x == "31st") {
            day = "31";
          }
        }
      }
    }

  group("Testing for text recognition", (){
    test("Test for company name", () async{
    String name_actual="ZOMATO";    
    expect(name_actual, name);
    });
    test("Test for coupon code", () async{    
      String code_actual="ZOMATO";
      expect(code_actual, code);
    });
    test("Test for discount", () async{    
      String discount_actual="50%";
      expect(discount_actual, percent);
    });
    test("Test for day of expiry date", () async{    
      String day_actual=null;
      expect(day_actual, day);
    });
    test("Test for month of expiry date", () async{    
      String month_actual=null;
      expect(month_actual, month);
    });
  });
}