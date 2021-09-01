

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],

      // Define the default font family.
      fontFamily: 'Georgia',
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Titanic Surival Prediction',
            style: TextStyle(color: Color(0xffff5252,
            ),
            ),
            ),
          centerTitle: true,
          textTheme: TextTheme(),
          backgroundColor: Colors.yellowAccent,

        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Check Your Survival',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.greenAccent,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApps()),
                        );
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    // ignore: deprecated_member_use
                    FlatButton(
                      textColor: Colors.greenAccent,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}

late String nm;
late String gn;
late String age;
late String pclass;
late String parch;
late String emb;
var result ;
class MyApps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

 
class _MyAppState extends State<MyApps>
 {
  web() async {
         var r = await http.get(Uri.http("192.168.0.111", "/cgi-bin/app.py", {
      "nm": nm,
      "gn": gn,
      "age": age,
      "pclass": pclass,
      "parch": parch,
      "emb": emb
    }),);
    

    setState(( ) {
result = r.body;
});
  }
TextEditingController nameController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController embarkController = TextEditingController();
TextEditingController pclassController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController parchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',
        ),
        home: Scaffold(
          appBar: AppBar(
              title: Text('Titanic prediction using ML/DL '),
              backgroundColor:Colors.red ,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: web,
                  icon: Icon(Icons.email),
                ),
              ]),
         body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
            children:<Widget> [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pinimg.com/originals/8a/17/ba/8a17baa38518709469915741d11cea1a.gif'),
                  radius:80
                ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                  onChanged: (value) {
                    nm = value;
                  },
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter user Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                  onChanged: (value) {
                    gn = value;
                  },
                    controller: genderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Gender in M/F/O Format" ,                   ),
                  ),
                ),
             
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                  onChanged: (value) {
                    age = value;
                  },
                    controller: ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Age" ,                   ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                  onChanged: (value) {
                    pclass = value;
                  },
                    controller: pclassController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your P class" ,                   ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                  onChanged: (value) {
                    emb= value;
                  },
                    controller: embarkController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your Embarkment Number" ,                   ),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                  onChanged: (value) {
                    parch= value;
                  },
                    controller: parchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Child arents Aboard" ,                   ),
                  ),
                ),
               
              
              ElevatedButton(
                onPressed: web,
                child: Text("Check Survival"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                )
                
                ),

              Text(
                "Result: $result",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontFamily: "courier new",
                  fontSize: 30.0,
                ),
              )
            ],
          ),
        ),
        ),
        );
  }
}
