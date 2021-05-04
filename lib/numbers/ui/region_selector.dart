import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numbers/numbers/service/numbers_service.dart';
import 'package:numbers/numbers/service/region.dart';

class RegionSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButton<Region>(
        value: watch(selectedRegion).state,
        items: Region.values
            .map((region) => DropdownMenuItem<Region>(
                  child: Text(region.name),
                  value: region,
                ))
            .toList(growable: false),
        onChanged: (region) => context.read(selectedRegion).state = region!,
      ),
    );
  }
}
