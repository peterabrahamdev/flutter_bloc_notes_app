import 'package:flutter/material.dart';

extension ToListView<T> on Iterable<T> {
  Widget toListView() => IterableListScreen(iterable: this);
}

class IterableListScreen<T> extends StatelessWidget {
  const IterableListScreen({super.key, required this.iterable});
  final Iterable<T> iterable;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: iterable.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            iterable.elementAt(index).toString(),
          ),
        );
      },
    );
  }
}
