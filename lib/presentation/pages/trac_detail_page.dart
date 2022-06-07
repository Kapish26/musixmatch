import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/injection_service.dart';
import 'package:musixmatch/models/lyrics.dart';
import 'package:musixmatch/models/tracks.dart';
import 'package:musixmatch/presentation/blocs/track_details/track_detail_bloc.dart';
import 'package:musixmatch/presentation/widgets/image_widget.dart';

class TrackDetailPage extends StatefulWidget {
  final int trackId;

  const TrackDetailPage({
    Key? key,
    required this.trackId,
  }) : super(key: key);

  @override
  State<TrackDetailPage> createState() => _TrackDetailPageState();
}

class _TrackDetailPageState extends State<TrackDetailPage> {
  late TrackDetailBloc trackDetailBloc;

  @override
  void initState() {
    super.initState();
    trackDetailBloc = injector.get<TrackDetailBloc>();
    trackDetailBloc.add(GetTrackDetailEvent(trackId: widget.trackId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => trackDetailBloc,
        child: BlocBuilder<TrackDetailBloc, TrackDetailState>(
          builder: (context, state) {
            if (state is TrackDetailLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TrackDetailErrorState) {
              return Center(child: Text("Error: ${state.error.toString()}"));
            } else if (state is TrackDetailLoadedState) {
              Track track = state.trackDetails['trackDetail'];
              Lyrics lyrics = state.trackDetails['lyrics'];
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: ImageWidget(
                          size: 125,
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${track.trackName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (track.explicit == 1)
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                        'assets/images/explicit.png'),
                                  ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${track.artistName}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey.shade600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        const Text(
                          'Lyrics',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('${lyrics.lyricsBody}')
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
