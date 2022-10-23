import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight = TextEditingController();
  var heightft = TextEditingController();
  var heightin = TextEditingController();
  var result = "";
  // var bgColor = [ Image.asset('assets/images/yoga.wep'),
  //               Image.asset('assets/images/motu.wep'),
  //               Image.asset('assets/images/patlu.webp'),
  //               Image.asset('assets/images/fit.jpeg'),
  //
  // ];
  var image = AssetImage('assets/images/yoga.webp');








  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('YOURBMI'),
      ),
      body:  Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,

            ),
          ),







          child: Center(
            child: Container(
              width: 300,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI' , style: TextStyle(fontSize: 34
                      , fontWeight:FontWeight.bold , color: Colors.white),),
                  TextField(
                    controller: weight ,
                    decoration: InputDecoration(
                      label: Text('Enter your weight in kgs' , style: TextStyle(color: Colors.white)),
                      prefixIcon: Icon(Icons.line_weight , color: Colors.white,)
                    ),
                    keyboardType: TextInputType.number,
                  ),


                  SizedBox(height: 21,),


                  TextField(
                    controller: heightft,
                    decoration: InputDecoration(
                      label: Text('Enter your height in feet' , style: TextStyle(color: Colors.white),),
                      prefixIcon: Icon(Icons.numbers, color: Colors.white,),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    autofocus: true,
                    controller: heightin,
                    decoration: InputDecoration(
                      label: Text('Enter your height in inch', style: TextStyle(color: Colors.white),),
                      prefixIcon: Icon(Icons.numbers, color: Colors.white,),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){

                    var wt = weight.text.toString();
                    var ht = heightft.text.toString();
                    var htin = heightin.text.toString();

                    if(wt!="" &&  ht!=""  && htin!= ""){

                      var iWt = int.parse(wt);
                      var ihtFt = int.parse(ht);
                      var iHtin = int.parse(htin);

                      var tinch = (ihtFt*12) + iHtin;
                      var tcm = (tinch*2.54);
                      var tM = tcm/100;

                      var bmi = iWt/(tM*tM);

                      var msg = "";
                      if(bmi>25){
                        msg = "You're overweight!!";
                        image = new AssetImage('assets/images/motu.webp');

                        setState(() {

                        });

                      } else if(bmi<18){
                        msg = "You're underweight!!";
                        image = new AssetImage('assets/images/patlu.webp');

                        setState(() {

                        });

                      }else{
                        msg = "You're Healthy!!";
                        image = new AssetImage('assets/images/fit.jpeg');

                        setState(() {

                        });



                      }

                      setState(() {
                        result = ' $msg \n Your Bmi is: ${bmi.toStringAsFixed(2)}';
                      });

                      //BMI CALCULATION
                    }else{

                      result="Please fill all details";
                      setState(() {

                      });
                    }


                  }, child: Text('Calculate'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                  )),

                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 50),
                    child: Text(result , style: TextStyle(fontSize: 21, color: Colors.green),),
                  )
                ],
              ),
            ),
          ),
        ),
      );







    }
}
