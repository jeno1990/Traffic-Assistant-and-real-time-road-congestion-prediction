
import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';

class Traffc_background extends StatefulWidget {
  // const Traffc_background({ Key? key }) : super(key: key);
  final String header;

  Traffc_background(this.header);

  @override
  State<Traffc_background> createState() => _Traffc_backgroundState();
}

class _Traffc_backgroundState extends State<Traffc_background> {
  bool isActive = true;

  @override
  
  Widget build(BuildContext context) {
    
     Size size = MediaQuery.of(context).size;
    return  Container(
          height: size.height,
          color: Colors.white,
          // width: double.infinity,
          child: Stack(
            // alignment: AlignmentDirectional.bottomStart,
            overflow: Overflow.visible,
            children:[
              Container(
                height: 160,
                width: size.width,
                color: Colors.blue,
                child: Container(padding: EdgeInsets.fromLTRB(50, 30, 0, 0) ,child: HeaderText( widget.header)),
              ),
              Positioned(
                top: 10,
                right: 20,
                child: IconButton(onPressed: (){
                  setState(() {
                    if(isActive==true){
                      isActive=false;
                    }else{
                      isActive=true;
                    }
                  });
                },
                icon: Icon(isActive?Icons.visibility:Icons.visibility_off))),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: size.height*.76,
                  width: size.width,//double.infinity,
                  // color: Colors.grey,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
                ),
              )
            ]
          ),
        );
      
  }
}