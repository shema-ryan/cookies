import 'package:cookies/cookiepage.dart';
import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3 , vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Color(0xFF545068)),
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF545068),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Color(0xFF545068)),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 10,),
          Text('Categories' , style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 40.0 ,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 10.0,),
          TabBar(
              controller: _controller,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 40.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs:<Widget>[
                Tab(
                  child: Text('Cookies',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 22.0,
                      )),
                ),
                Tab(
                  child: Text('Cookie cake',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 22.0,
                      )),
                ),
                Tab(
                  child: Text('Ice cream',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 22.0,
                      )),
                )
              ]
          ),
          Container(
            height: MediaQuery.of(context).size.height - 30.0,
            width: double.infinity,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                CookiePage(),
                CookiePage(),
                CookiePage(),
              ],
            ),
          )
        ],
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
                      onPressed : (){

                      },
                      icon: Icon(Icons.person , color:Colors.grey),
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
      ),
    );
  }
}
