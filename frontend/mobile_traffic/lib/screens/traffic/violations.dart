import 'package:flutter/material.dart';

class Violations extends StatelessWidget {
  // const Violations({ Key? key }) : super(key: key);
  bool index1 = true;
  bool index2 = false;
  bool index3 = false;
  String title="Violations";

    void handletab(int index){
      // if()
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
         // Traffc_background(title),
          Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TabText("violations", index1, 1),
                      TabText("issued cases", index2, 2),
                      TabText("reported cases", index3, 3)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Card(
                        color: Colors.white70,
                        child: ListTile(
                          tileColor: Colors.white,
                          leading: CircleAvatar(
                            child: Text("${index+1}"),
                          ),
                          title: Text("Speed alert"),
                          subtitle: Text("A06752 AA"),
                        ),
                      ),
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget TabText (String text, bool isSelected, int index){
    return GestureDetector( onTap:(){} , child: Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: isSelected?Colors.white:Colors.white60,)));
  }
  
}