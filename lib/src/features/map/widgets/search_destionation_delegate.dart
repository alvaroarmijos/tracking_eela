import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/location/location_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/search/search_cubit.dart';
import 'package:tracking_eela/src/features/map/models/search_result.dart';

class SearchDestionationDelegate extends SearchDelegate<SearchResult> {
  SearchDestionationDelegate()
      : super(
          searchFieldLabel: "Buscar...",
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        const searchResult = SearchResult(cancel: true);
        close(context, searchResult);
      },
      icon: const Icon(
        Icons.navigate_before,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final proximity = context.read<LocationBloc>().state.lastKnownLocation;

    if (query.isEmpty) return _buildSuggestions(context);

    context.read<SearchCubit>().searchPlaces(query, proximity!);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final places = state.places;

        return ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(places[index].text),
              subtitle: Text(places[index].placeName),
              leading: const Icon(
                Icons.location_on_outlined,
                color: Colors.purple,
              ),
              onTap: () {
                final searchResult = SearchResult(
                  cancel: false,
                  manualMarker: false,
                  place: places[index],
                );

                close(context, searchResult);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestions(context);
  }

  Widget _buildSuggestions(BuildContext context) {
    return ListTile(
      iconColor: Colors.purple,
      leading: const Icon(Icons.location_on_outlined),
      title: const Text('Colocar la ubicación en el mapa'),
      onTap: () {
        const searchResult = SearchResult(
          cancel: false,
          manualMarker: true,
        );
        close(context, searchResult);
      },
    );
  }
}
