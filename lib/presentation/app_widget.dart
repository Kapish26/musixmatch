import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musixmatch/injection_service.dart';
import 'package:musixmatch/presentation/blocs/track_list/track_list_bloc.dart';
import 'package:musixmatch/presentation/pages/track_list_page.dart';

import 'blocs/network/network_bloc.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    setupDependencies();
  }

  @override
  void dispose() {
    destroyDependencies();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Musix Match',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.interTextTheme(),
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TrackListBloc>(
              create: (context) => injector.get<TrackListBloc>(),
            ),
            BlocProvider<NetworkBloc>(
              create: (context) =>
                  injector.get<NetworkBloc>()..add(ListenConnection()),
            ),
          ],
          child: Scaffold(
            body: BlocBuilder<NetworkBloc, NetworkState>(
              builder: (context, state) {
                if (state is NetworkConnectionFailure) {
                  return const Center(
                    child: Text(
                      'NO INTERNET CONNECTION',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  );
                } else if (state is NetworkConnectionSuccess) {
                  return const TrackListPage();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }
}
