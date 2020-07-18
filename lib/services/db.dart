import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/coffee_record.dart';
import 'package:coffee_app/models/user.dart';

class DB_Service {
  String uid;
  DB_Service({this.uid});

  //collection reference
  final CollectionReference coffees = Firestore.instance.collection('coffees');

  //update user data
  Future<void> updateUserData(String sugar, String name, int strength) async {
    return await coffees.document(uid).setData({
      'sugar': sugar,
      'name': name,
      'strength': strength,
    });
  }

  //coffee docs stream getter
  Stream<List<CoffeeRecord>> get coffeeStream {
    return coffees.snapshots().map(_createCustomDocuments);
  }

  //create custom records (documents)
  List<CoffeeRecord> _createCustomDocuments(QuerySnapshot query) {
    return query.documents.map((doc) {
      return CoffeeRecord(
        name: doc['name'] ?? '',
        strength: doc['strength'] ?? 0,
        sugar: doc['sugar'] ?? '',
      );
    }).toList();
  }

  // User Doc stream getter
  Stream<UserData> get userDataStream {
    return coffees.document(uid).snapshots().map(_createCustomUserData);
  }

  // Create cutom user data model (Doc + ID)
  UserData _createCustomUserData(DocumentSnapshot doc) {
    return UserData(
      uid: uid,
      name: doc.data['name'],
      sugar: doc.data['sugar'],
      strength: doc.data['strength'],
    );
  }
}
