import 'package:flutter/material.dart';
import 'package:mobile_traffic/models/crowded_street_requestModel.dart';
import 'package:mobile_traffic/screens/driver/custom_search_delegate.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:get/get.dart';

class CrowdedStreet extends StatefulWidget {
  const CrowdedStreet({Key? key}) : super(key: key);

  @override
  _CrowdedStreetState createState() => _CrowdedStreetState();
}

class _CrowdedStreetState extends State<CrowdedStreet> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final crowdedStreetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   	return Scaffold(
	appBar: AppBar(
		title: const Text(
		"Driver",
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


    );
  }
}
