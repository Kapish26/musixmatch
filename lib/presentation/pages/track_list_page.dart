import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/injection_service.dart';
import 'package:musixmatch/presentation/blocs/track_list/track_list_bloc.dart';
import 'package:musixmatch/presentation/pages/trac_detail_page.dart';
import 'package:musixmatch/presentation/widgets/image_widget.dart';

class TrackListPage extends StatefulWidget {
  const TrackListPage({Key? key}) : super(key: key);

  @override
  State<TrackListPage> createState() => _TrackListPageState();
}

class _TrackListPageState extends State<TrackListPage> {
  late TrackListBloc trackListBloc;

  @override
  void initState() {
    super.initState();
    trackListBloc = injector.get<TrackListBloc>();
    trackListBloc.add(const GetTrackListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tracks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TrackListBloc, TrackListState>(
        builder: (context, state) {
          if (state is TrackListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrackListErrorState) {
            return Center(child: Text("Error: ${state.error.toString()}"));
          } else if (state is TrackListLoadedState) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemBuilder: (context, index) {
                  var track = state.tracks.trackList[index].track;
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                TrackDetailPage(trackId: track!.trackId)));
                      },
                      contentPadding: const EdgeInsets.all(8),
                      leading: ImageWidget(),
                      title: Text(
                        '${track!.trackName}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${track.artistName}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black87),
                      ),
                      subtitle: Text(
                        '${track.albumName}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black38),
                        maxLines: 1,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: state.tracks.trackList.length);
          }
          return Container();
        },
      ),
    );
  }
}
