
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun3dev_movielover/models/models.dart';
import 'package:sun3dev_movielover/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()){
    on<LoadUser>((event, emit) async {
      Client user = await UserServices.getUser(event.id);
      emit(UserLoaded(user));
    });
    on<SignOut>((event, emit) async {
      emit(UserInitial());
    });
    
    on<UpdateData>((event, emit) async {
      if (state is UserLoaded) {
      Client updatedUser = (state as UserLoaded)
          .user
          .copyWith(name: event.name, profilePicture: event.profileImage);

      await UserServices.updateUser(updatedUser);

      emit(UserLoaded(updatedUser));
      }
    });

    on<TopUp>((event, emit) async {
      if (state is UserLoaded) {
        try {
          Client updatedUser = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance! + event.amount);

          await UserServices.updateUser(updatedUser);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    });

    on<Purchase>((event, emit) async {
      if (state is UserLoaded) {
        try {
          Client updatedUser = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance! - event.amount);

          await UserServices.updateUser(updatedUser);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
