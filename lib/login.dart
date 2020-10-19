import 'package:cookies/Cookie.dart';
import 'package:flutter/material.dart';
import 'database/form.dart';
import 'database/database.dart';
import 'package:sqflite/sqflite.dart';

class Login extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<Login> {
  List<FormInput> formList ;
  FormInput formInput = FormInput('','');
  int count ;
  DbHelper login = DbHelper();
  bool selected = false ;
  bool isTapped = false ;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController usernameS = TextEditingController();
  TextEditingController passwordS = TextEditingController();
  @override
  Widget build(BuildContext context) {

    if (formList == null ){
      formList = List<FormInput>();
      updateFormInputList();
    }
    return MaterialApp(
        theme: ThemeData(primaryColor: Color(0xFFF17532)),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Delicious choice' , style: TextStyle(fontFamily: 'Varela'),),
              elevation: 0.0,
              backgroundColor: Color(0xFFF17532).withOpacity(0.5),
              bottom: TabBar(
                indicatorColor: Color(0xFFF17532),
                tabs: <Widget>[
                  Tab(
                      child: Text('SignIn',
                          style: TextStyle(
                            fontSize: 20,
                          ))),
                  Tab(
                      child: Text('SignUp',
                          style: TextStyle(
                            fontSize: 20,
                          ))),
                ],
              ),
            ),
            body: Form(
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/cookieclassic.jpg',
                            fit: BoxFit.contain,
                          )),
                      Container(
                        color: Color(0xFFF17532).withOpacity(0.5),
                      )
                    ],
                  ),
                  TabBarView(
                    children: <Widget>[
                      ListView(
                        padding: EdgeInsets.all(10.0),
                        children: <Widget>[
                          SizedBox(
                            height: 40.0,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Varela',
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(text: 'Welcome To the '),
                                  TextSpan(
                                      text: 'COOKIES',
                                      style: TextStyle(color: Color(0xFFF17532))),
                                  TextSpan(text: ' World'),
                                ]),
                          ),
                          SizedBox(
                            height: 80.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 300,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.person,
                                      color: Color(0xFFF17532),
                                    ),
                                    SizedBox(width: 5.0),
                                    Expanded(
                                        child: TextField(
                                          controller: username,
                                      decoration: InputDecoration(
                                        hintText: 'Username / email ',
                                      ),
                                      style: TextStyle(
                                          fontFamily: 'varela', fontSize: 20),
                                    ))
                                  ],
                                ),
                                SizedBox(height:20.0),
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.lock_outline,
                                    color: Color(0xFFF17532),
                                  ),
                                  SizedBox(width: 5.0),
                                  Expanded(child: TextFormField(
                                    validator: (value){
                                      String message ;
                                      if (value.isEmpty){
                                        message = 'please enter a valid email addres';
                                      }
                                      return message ;
                                    },
                                    controller: password,
                                    obscureText: true,
                                    style: TextStyle(
                                        fontFamily: 'varela', fontSize: 20),
                                    decoration: InputDecoration(
                                      hintText:'password', //suffixIcon:Icon(Icons.remove_red_eye)
                                    ),
                                  ))
                                ]),
                                SizedBox(height:50.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Text('Forgot Password ?' , textScaleFactor: 1.5,style: TextStyle(color: Colors.black54),),
                                  RaisedButton(
                                    elevation: 0.0,
                                    onPressed: (){
                                      //username.text == formInputList[3].userName && password.text == formInputList[3].passWord
                                      if(username.text ==this.formList[count].userName && password.text==this.formList[count].passWord){

                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return Homepage();
                                        }));
                                      } else {
                                        showDialog(context: context, barrierDismissible: true , builder: (_)=>
                                        AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Center(child: Text('Status ' , style:  TextStyle(fontFamily: 'Varela' , fontWeight:FontWeight.bold),)),
                                          content: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Icon(Icons.report_problem , color: Colors.orange,),
                                              Text('Crendetials Error' , style: TextStyle(fontFamily: 'Varela'),)
                                            ],
                                          )
                                        ));
                                      }
                                    },
                                    color: Colors.white,
                                    child: Text("Login" , style: TextStyle(fontFamily: 'Varela' , color: Color(0xFFF17532)),),)
                                ],)
                              ],
                            ),
                          ),
                        ],
                      ), // sign in container
                     Stack(
                        children: <Widget>[
                          Positioned(
                            top: 100,
                              left: 10,

                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                height: 500,
                                width: 425,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0)
                                  )
                                ),
                                child: ListView(
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        color: Color(0xFFF17532),
                                      ),
                                      SizedBox(width: 5.0),
                                      Expanded(child: TextFormField(
                                        controller: usernameS,
                                        onChanged: (value){
                                          updateuser();
                                        },

                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'varela', fontSize: 20),
                                        decoration: InputDecoration(
                                          hintText:'Full Names ', //suffixIcon:Icon(Icons.remove_red_eye)
                                        ),
                                      ))
                                    ],),
                                    SizedBox(height: 20,),
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.mail,
                                        color: Color(0xFFF17532),
                                      ),
                                      SizedBox(width: 5.0),
                                      Expanded(child: TextField(

                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'varela', fontSize: 20),
                                        decoration: InputDecoration(
                                          hintText: 'E - Mail Address ',
                                        ),
                                      ))
                                    ],),
                                    SizedBox(height: 20,),
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.lock,
                                        color: Color(0xFFF17532),
                                      ),
                                      SizedBox(width: 5.0),
                                      Expanded(child: TextFormField(
                                        controller: passwordS,
                                        onChanged: (valuePass){
                                          updatepass();
                                        },
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        style: TextStyle(
                                            fontFamily: 'varela', fontSize: 20),
                                        decoration: InputDecoration(

                                          hintText:'password ', //suffixIcon:Icon(Icons.remove_red_eye)
                                        ),
                                      ))
                                    ],),
                                    SizedBox(height: 20,),
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.lock_outline,
                                        color: Color(0xFFF17532),
                                      ),
                                      SizedBox(width: 5.0),
                                      Expanded(child: TextField(
                                        textCapitalization: TextCapitalization.words,
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        style: TextStyle(
                                            fontFamily: 'varela', fontSize: 20),
                                        decoration: InputDecoration(
                                          hintText:'re-type password ', //suffixIcon:Icon(Icons.remove_red_eye)
                                        ),
                                      ))
                                    ],),
                                    SizedBox(height: 20,),
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.phone_android,
                                        color: Color(0xFFF17532),
                                      ),
                                      SizedBox(width: 5.0),
                                      Expanded(child: TextField(
                                        textCapitalization: TextCapitalization.words,
                                        textAlign: TextAlign.center,
                                        keyboardType:TextInputType.number,
                                        style: TextStyle(
                                            fontFamily: 'varela', fontSize: 20),
                                        decoration: InputDecoration(
                                          hintText:'phone number ', //suffixIcon:Icon(Icons.remove_red_eye)
                                        ),
                                      ))
                                    ],),
                                    SizedBox(height:  60.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Checkbox(value: selected,

                                          activeColor:  Color(0xFFF17532),
                                          onChanged: (value){
                                         setState(() {
                                           selected = ! selected;
                                         });
                                          },
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            _save();
                                          },
                                          child: Container (
                                            width :100,
                                            height: 50,
                                            decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Color(0xFFF17532),
                                                width: 2,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Center(child: Text('Save' ,  style:  TextStyle(fontFamily: 'Varela' , fontSize: 17.0 , fontWeight: FontWeight.bold),)),

                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                          ),
                        ],
                     ),//Sign Up Widget
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }



  void updateFormInputList(){
    final Future<Database>futureDb =  login.initializeDatabase();
    futureDb.then((database){
      Future<List<FormInput>>formInputList = login.getFormList();
      formInputList.then((listInputForm){
      setState(() {
        this.count = listInputForm.length;
        this.formList = listInputForm;
        print(formList[1].userName);
      });
      });
    });

  }


  void _save()async{

    var result ;
    result = await login.insertFormList(formInput);
    updateFormInputList();
    if(result !=0 ){
   showDialog(context: context , builder: (_)=>AlertDialog(title: Text('Status'),content: Row(
     mainAxisAlignment:MainAxisAlignment.spaceEvenly,
     children: <Widget>[
     Icon(Icons.check) , Text('Successfully created an account')
   ],)));

    }else{
      print('there was an error in saving');
    }
  }

  void updateuser(){
    formInput.userName = usernameS.text;
  }
  void updatepass(){
    formInput.passWord = passwordS.text;
  }
}
