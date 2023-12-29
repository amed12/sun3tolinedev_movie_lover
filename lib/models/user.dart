part of 'models.dart';

class Client extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? profilePicture;
  final List<String>? selectedGenres;
  final String? selectedLanguage;
  final int? balance;

  Client(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.balance,
      this.selectedGenres,
      this.selectedLanguage});

  Client copyWith({ String? name, String? profilePicture, int? balance}) =>
      Client(id, email,
          name: name,
          profilePicture: profilePicture,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        name ?? '',
        profilePicture ?? '',
        selectedGenres ?? '',
        selectedLanguage ??  '',
        balance ?? 0
      ];
}
