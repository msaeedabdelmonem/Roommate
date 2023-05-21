import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roommate/models/home/room_model.dart';

/// [HomeRepo] hold abstraction for authorization
abstract class HomeRepo {
  Future<List<RoomModel>> getRooms();
}

/// [HomeRepoImp] hold logic for authorization
class HomeRepoImp implements HomeRepo {
  @override
  Future<List<RoomModel>> getRooms() async {
    List<RoomModel> models = [];
    await FirebaseFirestore.instance.collection("rooms").get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          models.add(RoomModel.fromJson(element.data()));
        });
      }
    });
    return models;
  }
}
