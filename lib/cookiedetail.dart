import 'package:flutter/material.dart';
class CookieDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  CookieDetail(this.assetPath, this.cookieprice, this.cookiename);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color:Colors.grey,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Details' , style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 30.0,
            color:Colors.grey)),
      ),
      body: ListView(
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  'Cookie',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 15.0),
            Hero(
                tag: assetPath,
                child: Image.asset(assetPath,
                    height: 300.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(cookieprice,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(cookiename,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: Center(
                        child: Text('Add to cart',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        )
                    )
                )
            )
          ]
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor:Color(0xFFF17532),
          child:Icon(Icons.fastfood),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape:CircularNotchedRectangle(),
          notchMargin: 5.0,
          elevation: 10.0,
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child:  Container(
            height: 50.0,
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width /2 - 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed : (){
                        },
                        icon: Icon(Icons.home , color: Color(0xFFEF7532),),
                      ),
                      IconButton(
                        onPressed : (){},
                        icon: Icon(Icons.person , color:Color(0xFF676E79) ,),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width /2 - 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed : (){},
                        icon: Icon(Icons.search , color: Color(0xFF676E79),),
                      ),
                      IconButton(
                        onPressed : (){

                        },
                        icon: Icon(Icons.shopping_basket , color: Color(0xFF676E79),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
