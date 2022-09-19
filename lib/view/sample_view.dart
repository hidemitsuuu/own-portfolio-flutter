import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:own_portfolio/view_model/sample_view_model.dart';

class SampleView extends ConsumerWidget {
  const SampleView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(sampleViewModelProvider);
    final notifier = ref.read(sampleViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              viewModel.count,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifier.fetchSample,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
