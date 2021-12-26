import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  // static const STRIPE_ID = 'stripeId';

  String? _name;
  String? _email;
  String? _id;
  // String _stripeId;

  //getters
  String? get name => _name;
  String? get email => _email;
  String? get id => _id;
  // String get stripeId => _stripeId;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot[NAME]; //snapshot or snapshot.data[NAME] may be null
    _email = snapshot[EMAIL];
    _id = snapshot[ID];
    // _stripeId = snapshot[STRIPE_ID] ?? [];
  }
}
