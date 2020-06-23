import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import '../../lib/home.dart';
void main(){
  test("delete expire coupon from data base", 
  
  () async {
    
    final instance = MockFirestoreInstance();
     //print(instance.dump());
 
 
    final snap= await instance.collection("general_coupons").getDocuments();
    int before = snap.documents.length;
      //print(before);
     /* a expire coupon.....*/ await instance.collection("general_coupons").document().setData({
                        'company': "test",
                        'coupon_code': "test123",
                        'exp_date': "2020-03-24",
                        'discount': "100",
                        'other_details': "",
                        't_c': ""
                      });
   /************************* function logic ************ */
  QuerySnapshot querySnapshot = await instance.collection("general_coupons").getDocuments();
    var list = querySnapshot.documents;

    for(var coupon in list)
    {
DateTime dateTimeCreatedAt = DateTime.parse(coupon['exp_date']); 
DateTime dateTimeNow = DateTime.now();
final differenceInDays = dateTimeCreatedAt.difference(dateTimeNow).inDays;

  //print("day  $differenceInDays");
  if(differenceInDays < 1)
  {
    instance.collection("general_coupons").document(coupon.documentID).delete(); 
  }

    }
/****************************************************************** */
     final snap2= await instance.collection("general_coupons").getDocuments();
    int after = snap2.documents.length;
    //print(after);
  expect(before,after);
  
  
  });
}