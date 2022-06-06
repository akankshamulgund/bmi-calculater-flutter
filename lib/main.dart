
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Homepage(),

    );
  }
}




class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  double? bmi;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _currentValue=0;
  double counter=50;
  double bmi=0.0;

  double age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Row(
            children: [
              Text("                                                                                                        "),
              ElevatedButton(
                child: (Icon(Icons.boy_outlined,size: 100,)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.0,150.0),
                  shape:new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)
                  ) ,

                  primary: Colors.blueGrey,
                ),
                onPressed: (){

                },
              ),
              Text("   "),
              ElevatedButton(
                child: (Icon(Icons.girl_outlined,size: 100,)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.0,150.0),
                  shape:new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)
                  ) ,

                  primary: Colors.blueGrey,
                ),
                onPressed: (){

                },
              ),

            ],
          ),


          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border(),
                color: Colors.amberAccent,
              ),
              height: 180,
              width: 300,
              //color: Colors.blueGrey,
              child: Column(
                  children:[



                    Center(child: Text("Height",style: TextStyle(fontSize: 40,color: Colors.black),)),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_currentValue.toString(),style: TextStyle(fontSize: 40,color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        value: _currentValue,
                        min: 0,
                        max: 250,
                        divisions: 250,
                        activeColor: Colors.black12,
                        inactiveColor: Colors.white,
                        label: _currentValue.toString(),
                        onChanged: (value){
                          setState((){
                            _currentValue = value;
                          });
                        },
                      ),
                    )

                  ]//children
              ),



            ),
          ),



          Row(
            children:[
              Text("                                                                                                        "),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.yellowAccent,
                ),

                height: 150,
                width: 150,



                child: Column(
                  children: [


                    Column(
                      children:[
                        Text("Weight",style: TextStyle(fontSize: 20,color: Colors.black),),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(counter.toString(),style: TextStyle(fontSize: 20,color: Colors.black),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Column(
                              children: [
                                FloatingActionButton(
                                    child:
                                    Center(child: Icon(Icons.add)),
                                    backgroundColor: Colors.blueGrey,
                                    foregroundColor:Colors.white,

                                    onPressed: (){
                                      setState(() {

                                      });
                                      counter++;

                                    }
                                ),
                              ],
                            ),
                            FloatingActionButton(
                                child: Center(child: Icon(Icons.remove)),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor:Colors.white ,
                                onPressed:(){
                                  setState(() {

                                  });
                                  counter--;
                                }
                            ),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              Text("   "),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.yellowAccent,
                ),

                height: 150,
                width: 150,



                child: Column(
                  children: [


                    Center(child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text("Age",style: TextStyle(fontSize: 20,color: Colors.black),),
                    )),

                    Column(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(age.toString(),style: TextStyle(fontSize: 20,color: Colors.black),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Column(
                              children: [
                                FloatingActionButton(
                                    child:
                                    Center(child: Icon(Icons.add)),
                                    backgroundColor: Colors.blueGrey,
                                    foregroundColor:Colors.white,

                                    onPressed: (){
                                      setState(() {

                                      });
                                      age++;

                                    }
                                ),
                              ],
                            ),
                            FloatingActionButton(
                                child: Center(child: Icon(Icons.remove)),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor:Colors.white ,
                                onPressed:(){
                                  setState(() {

                                  });
                                  counter--;
                                }
                            ),
                          ],
                        ),




                      ],
                    ),



                  ],
                ),
              ),

            ],
          ),
          Column(
            children: [
              FloatingActionButton.extended(
                  label: Text("               Calculate             ",style: TextStyle(fontSize: 20,color: Colors.white),),
                  backgroundColor: Colors.blueGrey,
                  onPressed: (){
                    setState(() {

                    });

                    bmi=(counter*10000)/(_currentValue*_currentValue);

                    Navigator.push(
                      context,MaterialPageRoute(builder: (context)=>  Result(bmi: bmi,)),
                    );

                  }),



            ],
          ),

        ],

      ),


    );
  }
}


class Result extends StatefulWidget {
  Result({Key? key,required this.bmi}) : super(key: key);
  double? bmi;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children:[
          Center(child: Text("Your Result",style: TextStyle(fontSize: 40,color: Colors.black),)),

          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.vertical(),
                color: Colors.amber,
              ),
              height:300,
              width: 300,
              child: Column(
                children: [
                  Text(" "),
                  Text(" "),
                  Text(" "),
                  Center(child: Text(widget.bmi.toString(),style: TextStyle(fontSize: 40,color: Colors.black),))
                ],
              ),

            ),

          ),
          Text(" "),
          FloatingActionButton.extended(
              label: Text("          Re-Calculate          ",style: TextStyle(fontSize: 20,color: Colors.white),),
              backgroundColor: Colors.redAccent,
              onPressed: (){
                Navigator.pop(context);

              }),

        ],

      ),




    );
  }
}


