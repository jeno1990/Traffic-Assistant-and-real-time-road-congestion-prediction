import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class AwesomeDropdownExample extends StatefulWidget {
  const AwesomeDropdownExample({ Key? key }) : super(key: key);

  @override
  _AwesomeDropdownExampleState createState() => _AwesomeDropdownExampleState();
}

class _AwesomeDropdownExampleState extends State<AwesomeDropdownExample> {
 

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Menu mode",
                hintText: "country in menu mode",
              ),
              popupItemDisabled: isItemDisabled,
              onChanged: itemSelectionChanged,
              //selectedItem: "",
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                cursorColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20,),
            // DropdownSearch<String>.multiSelection(
            //   mode: Mode.MENU,
            //   showSelectedItems: true,
            //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            //   dropdownSearchDecoration: InputDecoration(
            //     labelText: "Menu mode",
            //     hintText: "country in menu mode",
            //   ),
            //   popupItemDisabled: isItemDisabled,
            //   onChanged: print,
            //   selectedItems: ["Brazil"],
            // ),
            SizedBox(height: 20,),
            DropdownSearch(
              mode: Mode.DIALOG,
              items: ["Brazil", "France", "Tunisia", "Canada"],
              dropdownSearchDecoration: InputDecoration(labelText: "Name"),
              onChanged: print,
              selectedItem: "Tunisia",
              validator: (String? item) {
                if (item == null) return "Required field";
                else if (item == "Brazil") return "Invalid item";
                else return null;
              },
            ),
            SizedBox(height: 20,),
            DropdownSearch(
              mode: Mode.BOTTOM_SHEET,
              items: ["Brazil", "France", "Tunisia", "Canada"],
              dropdownSearchDecoration: InputDecoration(labelText: "Name"),
              onChanged: print,
              selectedItem: "Tunisia",
              validator: (String? item) {
                if (item == null) return "Required field";
                else if (item == "Brazil") return "Invalid item";
                else return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isItemDisabled(String s) {
    //return s.startsWith('I');

    if (s.startsWith('I')) {
      return true;
    } else {
      return false;
    }
  }

  void itemSelectionChanged(String? s) {
    print(s);
  }

}