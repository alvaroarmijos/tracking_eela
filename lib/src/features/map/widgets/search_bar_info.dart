import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_eela/src/features/map/blocs/search/search_cubit.dart';
import 'package:tracking_eela/src/features/map/widgets/widgets.dart';

class SearchBarInfo extends StatelessWidget {
  const SearchBarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: Row(
            children: [
              const RunningInfo(),
              IconButton(
                onPressed: () async {
                  final searchResult = await showSearch(
                    context: context,
                    delegate: SearchDestionationDelegate(),
                  );

                  if (searchResult == null || searchResult.cancel == true) {
                    return;
                  }

                  if (searchResult.manualMarker) {
                    context.read<SearchCubit>().updateShowManualMarker(true);
                  }
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
