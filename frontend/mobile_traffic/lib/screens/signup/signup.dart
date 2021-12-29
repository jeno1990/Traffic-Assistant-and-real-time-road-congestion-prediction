import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children : [ 
              Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset("assets/world_map.png",fit: BoxFit.fill,),
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [                  // The validator receives the text that the user has entered.
                  // SizedBox(height: 30,),
                  Container(padding: EdgeInsets.fromLTRB(20, 30, 0, 0),child: Text("sign up",style: TextStyle(fontSize: 36,color: Colors.white),)),
                 
                  SizedBox(height: 30,),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'first name',
                      
                      // border: OutlineInputBorder(), 
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ],
              )
            ]),
        ),
      ),
    );
  }
}