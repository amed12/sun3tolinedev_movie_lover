import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun3dev_movielover/models/models.dart';
import 'package:sun3dev_movielover/services/services.dart';
import 'package:equatable/equatable.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState([])){

    on<BuyTicket>((event, emit) async {
      await TicketServices.saveTicket(event.userID, event.ticket);

      List<Ticket> tickets = state.tickets + [event.ticket];

      emit(TicketState(tickets));
    });

    on<GetTickets>((event, emit) async {
     List<Ticket> tickets = await TicketServices.getTickets(event.userID);
      emit(TicketState(tickets));
    });
  }
}
