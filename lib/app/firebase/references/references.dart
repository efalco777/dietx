import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietx/app/model/food/entity/food.dart';
import 'package:dietx/app/model/food/entity/food_keys.dart';
import 'package:dietx/app/model/settings/entity/config.dart';
import 'package:dietx/app/model/settings/entity/training_config.dart';
import 'package:dietx/app/model/user/entity/user_keys.dart';
import 'package:dietx/app/model/utils/app_user.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class AppDocuments {
  static DocumentReference<dynamic> user() {
    return FirebaseFirestore.instance.collection(UserKeys.collection).doc(AppUser.id);
  }

  static DocumentReference<TrainingConfig> trainingConfig() {
    return user()
        .collection(ConfigKeys.collection)
        .withConverter<TrainingConfig>(
            fromFirestore: (snapshot, _) => TrainingConfig.fromJson(snapshot.data()!),
            toFirestore: (trainingConfig, _) => trainingConfig.toJson())
        .doc(ConfigKeys.trainingDocument);
  }
}

abstract class AppCollections {
  static CollectionReference<Food> food() {
    return AppDocuments.user().collection(FoodKeys.collection).withConverter<Food>(
        fromFirestore: (snapshot, _) => Food.fromJson(snapshot.data()!),
        toFirestore: (trainingConfig, _) => trainingConfig.toJson());
  }
}

abstract class AppStorage {
  static Reference ref() => FirebaseStorage.instance.ref(AppUser.id);
}
