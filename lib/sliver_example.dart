import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  const SliverExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Horizons"),
          backgroundColor: Colors.teal[800],
        ),
        MainList(),
      ],
    ));
  }
}

class MainList extends StatelessWidget {
  MainList({Key? key}) : super(key: key);

  final List<int> list =
      List.generate(14, (int index) => index * index, growable: false);

  @override
  Widget build(BuildContext context) {
    print(list[0]);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text('Title'),
              subtitle: Text('Sub title'),
              leading: Text('${list[index]}'),
              trailing: Text('trailing'),
            ),
          );
        },
        childCount: 14,
      ),
    );
  }
}
