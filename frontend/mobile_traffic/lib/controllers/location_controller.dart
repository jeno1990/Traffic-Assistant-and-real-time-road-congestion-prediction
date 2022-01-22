

import 'package:get/state_manager.dart';
import 'package:location/location.dart';

import 'package:get/get.dart';

class LocationController extends GetxController{
      Location location = new Location();

      late bool _serviceEnabled;
      late PermissionStatus _permissionGranted;
      Rx<LocationData> _locationData  = new LocationData.fromMap({"latitude":-1.0,"longitude":-1.0}).obs;

      LocationData getLocationData(){
        return _locationData.value;
      }
      
      Future<void> updateLocation() async{

        try{
        bool _serviceEnabled = await location.serviceEnabled();
        
          if (!_serviceEnabled) {
            _serviceEnabled = await location.requestService();
            if (!_serviceEnabled) {
              return;
            }
        }

        PermissionStatus _permissionGranted = await location.hasPermission();
          if (_permissionGranted == PermissionStatus.denied) {
            _permissionGranted = await location.requestPermission();
            if (_permissionGranted != PermissionStatus.granted) {
              return;
            }
        }

          _locationData.value = await location.getLocation();
        }catch(err){
          //catch block
        }
          print("location data is  : ${_locationData.value} ");
      }
}