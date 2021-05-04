import 'package:flutter/material.dart';
import 'package:numbers/numbers/service/numbers_service.dart';
import 'package:numbers/numbers/service/region.dart';
import 'package:numbers/numbers/ui/numbers_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numbers/numbers/ui/region_selector.dart';

class NumbersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegionSelector(),
            Expanded(child: Center(child: NumbersView())),
            Padding(
              padding: const EdgeInsets.all(20),
              child: OutlinedButton(
                child: Text('Reload'),
                onPressed: () => context.refresh(latestTotalNumberProvider),
              ),
            )
          ],
        ),
      ),
    );
  }
}
