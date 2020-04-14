import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_perfect_weight/pages/BMIModel.dart';
import 'package:my_perfect_weight/pages/Result.dart';

class BMICal extends StatefulWidget {
  @override
  _BMICalState createState() => _BMICalState();
}

class _BMICalState extends State<BMICal> {
  double _height=90.0;
  double _weight=70.0;
  double _bmi=0.0;
  BMIModel _bmiCal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(

            width: double.infinity,
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 60,),
                Container(
                  width: 200,
                  height: 200,
                  child: SvgPicture.asset("assets/images/weight-loss.svg",fit: BoxFit.contain,),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("BMI Calculator - حساب الوزن المثالي",style: TextStyle(color: Colors.red[600],fontSize: 22,fontWeight: FontWeight.w800),),
                Text("keep watching your weight",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400),),
                Text(" حافظ على مراقبة وزنك",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400),),
                SizedBox(
                  height: 32,
                ),
                Text("Height (cm) - الطول",style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.w400),),
             Container(padding: EdgeInsets.only(left: 16,right: 16),
             child: Slider(
                 min: 70,
                 max: 230,
                 onChanged: (height){
                   setState(() {
                   _height=height;
                       });},
                 value: _height,
               divisions: 320,
               activeColor: Colors.pink,
               label: "$_height",
              ),
             ),
                Text("$_height cm",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w900),),
                SizedBox(
                  height: 24,
                ),

                Text("Height (kg) - الوزن",style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.w400),),

                Container(padding: EdgeInsets.only(left: 16,right: 16),
                  child: Slider(
                    min: 30,
                    max: 150,
                    onChanged: (height){
                      setState(() {
                        _weight=height;
                      });},
                    value: _weight,
                    divisions: 240,
                    activeColor: Colors.pink,
                    label: "$_weight",
                  ),
                ),
                Text("$_weight kg",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w900),),
                SizedBox(
                  height: 16,
                ),

                Container(
               width: double.infinity,
               padding:EdgeInsets.only(left: 16,right: 16) ,
               child: FlatButton.icon(
                onPressed: (){
                  setState(() {
                    _bmi=_weight/((_height/100)*(_height/100));
                  if(_bmi>=18.5 && _bmi<=25){
                    _bmiCal=BMIModel(bmi: _bmi,isNormal: true,comments: "Your weight is normal _ وزنك طبيعي");
                  }
                  else if(_bmi<18.5){
                    _bmiCal=BMIModel(bmi: _bmi,isNormal: false,comments: "Underweighted _ وزنك اقل من الطبيعي");
                  }else if(_bmi>25 && _bmi<=30){
                    _bmiCal=BMIModel(bmi: _bmi,isNormal: false,comments: "Overweighted _ وزنك اعلى من الطبيعي");
                  }
                  else{
                    _bmiCal=BMIModel(bmi: _bmi,isNormal: false,comments: "Obese _ انت بدين");
                  }
                  });
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>Result(bmiModel: _bmiCal)
                  ));
                },
                icon: Icon(Icons.favorite,color: Colors.white,),
                label: Text("CALCULATE - أحسب",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                textColor: Colors.white,

               ),
               color:Colors.pink ,
             ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
