import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/models/search_location/city_model.dart';

/// [HomeRepo] hold abstraction for authorization
abstract class SearchRepo {
  Future<List<SheetItemModel>> getRoomsTypes();
  Future<List<SheetItemModel>> getPrices();
  Future<List<CityModel>> getLocations();
  Future<List<RoomModel>> searchRoom({required String title});
}

/// [SearchRepoImp] hold logic for authorization
class SearchRepoImp implements SearchRepo {
  @override
  Future<List<CityModel>> getLocations() async {
    List<CityModel> models = [];
    await FirebaseFirestore.instance.collection("locations").get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          models.add(CityModel.fromJson(element.data()));
        });
      }
    });
    return models;
  }

  @override
  Future<List<SheetItemModel>> getPrices() async {
    List<SheetItemModel> models = [];
    await FirebaseFirestore.instance.collection("prices").get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          models.add(SheetItemModel.fromJson(element.data()));
        });
      }
    });
    return models;
  }

  @override
  Future<List<SheetItemModel>> getRoomsTypes() async {
    List<SheetItemModel> models = [];
    await FirebaseFirestore.instance.collection("roomTypes").get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          models.add(SheetItemModel.fromJson(element.data()));
        });
      }
    });
    return models;
  }

  @override
  Future<List<RoomModel>> searchRoom({required String title}) async {
    List<RoomModel> models = [];
    await FirebaseFirestore.instance.collection("rooms").
    where("title",arrayContains:  title).
    get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          models.add(RoomModel.fromJson(element.data()));
        });
      }
    });
    return models;
  }

}