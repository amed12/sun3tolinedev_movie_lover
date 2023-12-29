part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(Client user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<Client> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return Client(id, snapshot.get('email'),
        balance: snapshot.get('balance'),
        profilePicture: snapshot.get('profilePicture'),
        selectedGenres: (snapshot.get('selectedGenres') as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.get('selectedLanguage'),
        name: snapshot.get('name'));
  }
}
