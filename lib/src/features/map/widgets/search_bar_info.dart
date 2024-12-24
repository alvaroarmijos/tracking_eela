import 'package:flutter/material.dart';
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
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchDestionationDelegate(),
                  );
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
