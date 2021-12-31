import "package:flutter/material.dart";
class BackgroundSignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Stack(children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/world_map.png',
            ),
          ),
        )),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                Color.fromRGBO(72, 131, 246, 0.7),
                Color.fromRGBO(0, 0, 0, 0.7)
              ],
                  stops: [
                0.0,
                1.0
              ])),
        ),
       ] )
    );
  }
}