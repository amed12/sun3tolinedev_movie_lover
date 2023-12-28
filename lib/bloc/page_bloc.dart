import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun3dev_movielover/models/models.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()){
    on<GoToSplashPage>((event, emit)  {
      emit(OnSplashPage());
    });
    on<GoToLoginPage>((event, emit)  {
      emit(OnLoginPage());
    });
    on<GoToMainPage>((event, emit)  {
      emit(OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex, isExpired: event.isExpired));
    });
    on<GoToRegistrationPage>((event, emit)   {
      emit(OnRegistrationPage(event.registrationData));
    });
    on<GoToPreferencePage>((event, emit)  {
      emit(OnPreferencePage(event.registrationData));
    });
    on<GoToAccountConfirmationPage>((event, emit) {
      emit(OnAccountConfirmationPage(event.registrationData));
    });
    on<GoToMovieDetailPage>((event, emit)  {
      emit(OnMovieDetailPage(event.movie));
    });

    on<GoToSelectSchedulePage>((event, emit)  {
      emit(OnSelectSchedulePage(event.movieDetail));
    });


    on<GoToSelectSeatPage>((event, emit)  {
      emit(OnSelectSeatPage(event.ticket));
    });
    
    on<GoToCheckoutPage>((event, emit)  {
      emit(OnCheckoutPage(event.ticket));
    });

    on<GoToSuccessPage>((event, emit)  {
      emit(OnSuccessPage(event.ticket, event.transaction));
    });

    on<GoToTicketDetailPage>((event, emit)  {
      emit(OnTicketDetailPage(event.ticket));
    });

    on<GoToProfilePage>((event, emit)  {
      emit(OnProfilePage());
    });

    on<GoToProfilePage>((event, emit)  {
      emit(OnProfilePage());
    });

    on<GoToTopUpPage>((event, emit)  {
      emit(OnTopUpPage(event.pageEvent));
    });

    on<GoToWalletPage>((event, emit)  {
      emit(OnWalletPage(event.pageEvent));
    });

    on<GoToEditProfilePage>((event, emit)  {
      emit(OnEditProfilePage(event.user));
    });

  }

}
