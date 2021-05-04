import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:numbers/numbers/service/numbers_service.dart';

class NumbersView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(latestTotalNumberProvider).when(
      data: (data) => Text(
        NumberFormat('#,###').format(data),
        style: Theme.of(context).textTheme.headline2,
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text(
        'Oh no.\nAn error occured.',
        style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
