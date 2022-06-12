import 'package:flutter/material.dart';
import 'package:mobile_traffic/models/crowded_street_requestModel.dart';
import 'package:mobile_traffic/screens/driver/custom_search_delegate.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final crowdedStreetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   	return Scaffold(
            appBar: AppBar(
         title: const Text(
         "Search",
         ),
         actions: [
         IconButton(
           onPressed: () {
           // method to show the search bar
           showSearch(
             context: context,
             // delegate to customize the search bar
             delegate: CustomSearchDelegate()
           );
           },
           icon: const Icon(Icons.search),
         )
         ],
       ),
       body: Center(
         child: Text("Search here ..."),
       ),
          );
  }
}
