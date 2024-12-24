import 'package:flutter/material.dart';

class RunningInfo extends StatelessWidget {
  const RunningInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          children: [
            // ...listItems.map(
            //   (itemData) => ItemInfo(
            //     iconPath: itemData.icon,
            //     value: itemData.value,
            //     label: itemData.label,
            //   ),
            // ),
            // for (var i = 0; i < listItems.length; i++)
            //   ItemInfo(
            //     iconPath: listItems[i].icon,
            //     value: listItems[i].label,
            //     label: listItems[i].value,
            //   )
            const ItemInfo(
              iconPath: 'assets/icons/running_icon.png',
              value: '0.0',
              label: 'km',
            ),
            VerticalDivider(
              color: Colors.grey[300],
            ),
            const ItemInfo(
              iconPath: 'assets/icons/fire_icon.png',
              value: '0.0',
              label: 'kcal',
            ),
            VerticalDivider(
              color: Colors.grey[300],
            ),
            const ItemInfo(
              iconPath: 'assets/icons/velocity_icon.png',
              value: '0.0',
              label: 'km/hr',
            ),
          ],
        ),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.iconPath,
    required this.value,
    required this.label,
  });

  final String iconPath;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
