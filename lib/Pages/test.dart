import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Api.dart';
import 'cubit/Calls.dart';

class AgendaPage extends StatelessWidget {
  final MakePlansAPI makePlansAPI = MakePlansAPI(Dio());

  AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgendaCubit(makePlansAPI),
      child: Scaffold(
        appBar: AppBar(title: Text("Agenda")),
        body: BlocConsumer<AgendaCubit, AgendaState>(
          listener: (context, state) {
            if (state is AgendaError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is AgendaLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is AgendaError) {
              return Center(child: Text(state.message));
            }

            if (state is AgendaLoaded) {
              return ListView.builder(
                itemCount: state.agenda.length,
                itemBuilder: (context, index) {
                  var plan = state.agenda[index];
                  return ListTile(
                    title: Text(plan['name'] ?? 'Unknown Event'),
                    subtitle: Text(plan['description'] ?? 'No description'),
                    trailing: IconButton(
                      icon: Icon(Icons.bookmark),
                      onPressed: () {
                        // Create a reservation when user taps the button
                        context.read<AgendaCubit>().createReservation(
                            plan['booking_id'], {'some': 'reservation data'});
                      },
                    ),
                  );
                },
              );
            }

            return Center(child: Text("No agenda available"));
          },
        ),
      ),
    );
  }
}
