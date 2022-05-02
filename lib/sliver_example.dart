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
          pinned: true,
          floating: true,
          stretch: true,
          onStretchTrigger: () async {
            print('stretched');
          },
          // snap: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
            title: Text('Horizons'),
            background: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.teal[800]!,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1651419935061-c7f954d37446?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        MainList(),
      ],
    ));
  }
}

class MainList extends StatelessWidget {
  MainList({Key? key}) : super(key: key);

  final List<int> list =
      List.generate(24, (int index) => index * index, growable: false);

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
        childCount: 24,
      ),
    );
  }
}
