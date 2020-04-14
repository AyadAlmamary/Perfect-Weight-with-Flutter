import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Result extends StatelessWidget {
  final bmiModel;
Result({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Container(
                width: 200,
                height: 200,
                child: bmiModel.isNormal? SvgPicture.asset("assets/images/workout.svg",fit: BoxFit.contain,):SvgPicture.asset("assets/images/sad.svg",fit: BoxFit.contain,)
            ),
            SizedBox(
              height: 8,
            ),
            Text("Your BMI is ${bmiModel.bmi.round()}",style: TextStyle(color: Colors.red[600],fontSize: 20,fontWeight: FontWeight.w800),),
            SizedBox(height: 8,),
            Text("${bmiModel.comments}",style: TextStyle(color: Colors.grey[800],fontSize: 17,fontWeight: FontWeight.w800),),
            SizedBox(
              height: 16,
            ),

            bmiModel.isNormal?
            Text("رائع , وزنك مثالي",style: TextStyle(color: Colors.red[600],fontSize: 20,fontWeight: FontWeight.w800),)
                :
            Text("للأسف , وزنك غير صحي ",style: TextStyle(color: Colors.red[600],fontSize: 20,fontWeight: FontWeight.w800),),

            SizedBox(
              height: 16,
            ),

            Container(

              child: FlatButton.icon(
                onPressed: (){
                  Navigator.pop(context);
                  },
                icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                label: Text("BACK - رجوع",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                textColor: Colors.white,

              ),
              color:Colors.pink ,
            ),
            SizedBox(
              height: 70,
            ),
            Text("Developed by : AYAD SAADI",)

          ],
        ),
      ),
    );
  }
}
