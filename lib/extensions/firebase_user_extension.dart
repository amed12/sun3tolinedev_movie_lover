part of 'extensions.dart';

extension FirebaseUserExtension on User {
  Client convertToClient(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      Client(uid, email ?? "",
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<Client> fromFireStore() async => await UserServices.getUser(uid);
}
