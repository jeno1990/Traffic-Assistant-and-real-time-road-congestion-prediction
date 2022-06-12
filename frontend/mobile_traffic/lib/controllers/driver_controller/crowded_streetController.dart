import 'package:get/get.dart';
import 'package:mobile_traffic/models/crowded_street_requestModel.dart';
import 'package:mobile_traffic/models/crowded_street_responseModel.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/services/api_service.dart';

class CrowdedStreetController extends GetxController {
  // ignore: deprecated_member_use
  CrowdedStreetController() {
    print("in the constructor");
  }
  static late String source;
  static late String destination;
  var crowdedList = List<CrowdedStreetResponseModel>.empty(growable: true).obs;
// static String source="";
// static String destination="";
  static String street = "";

  //  var notificationList = [

  //     [
  //     "megenagna",
  //      "bole",
  //       "main road",
  //     ],
  //     [
  //     "megenagna",
  //        "bole",
  //       "24",
  //     ],
  //     [
  //     "Megenagna",
  //      "Bole",
  //     "Gerji",
  // ],
  //  [
  //       source= "Megenagna",
  //       destination= "Bole",
  //       street= "Studium",
  //  ],

  // ];
  var isLoading = false.obs;
  @override
  void onInit() {
    print("crowded" + crowdedList.toString());

    // getListOfRoads();
    update();
    super.onInit();
  }

  void getListOfRoads(model) async {
    try {
      isLoading(true);

      var notifications = await APIService.getCrowdedStreet(model);
      //  var notifications = model;
      print(notifications);

      if (notifications != null) {
        crowdedList.value = notifications;
      }
    } finally {
      // TODO
      isLoading(false);
    }
  }
}
