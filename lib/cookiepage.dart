
import 'package:cookies/cookiedetail.dart';
import 'package:flutter/material.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10.0,
              children: <Widget>[
                _buildCard('Cookie mint', '\$3.99', 'assets/cookiemint.jpg',
                    false, false, context),
                _buildCard('Cookie cream', '\$5.99', 'assets/cookiecream.jpg',
                    true, false, context),
                _buildCard('Cookie classic', '\$1.99',
                    'assets/cookieclassic.jpg', false, true, context),
                _buildCard('Cookie choco', '\$2.99', 'assets/cookiechoco.jpg',
                    false, false, context),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context){
            return CookieDetail(
                imgPath, price, name
            );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    isFavorite
                        ? Icon(Icons.favorite, color: Color(0xFFF17532))
                        : Icon(
                            Icons.favorite_border,
                            color: Color(0xFFF17532),
                          )
                  ],
                ),
              ),
              Hero(
                  tag: imgPath,
                  child: Image.asset(imgPath , height: 75, width: 75, fit: BoxFit.contain)),
              SizedBox(height: 25.0),
              Text(price,
                  style: TextStyle(
                      color: Color(0xFFCC8053),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Text(name,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              SizedBox(height : 5.0),
              Padding(
                padding:EdgeInsets.all(8.0),
                child: Container(
                  height:1, color:Colors.grey,),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (!added)...[ Icon(Icons.shopping_basket,
                    color: Color(0xFFD17E50), size: 12.0),
                Text('Add to cart',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Varela',
                        color: Color(0xFFD17E50),
                        fontSize: 13.0))],
                    if (added) ...[
                      Icon(Icons.remove_circle_outline,
                          color: Color(0xFFD17E50), size: 12.0),
                      Text('3',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              color: Color(0xFFD17E50),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      Icon(Icons.add_circle_outline,
                          color: Color(0xFFD17E50), size: 12.0),
                    ]
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
