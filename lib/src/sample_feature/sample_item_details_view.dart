import 'package:flutter/material.dart';
import 'package:pokedex/src/sample_feature/sample_item.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({Key? key}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bulbasaur'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              Image.asset('assets/images/1.png'),
              Text(
                'Bulbasaur',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        'Grama',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                          ),
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        'Veneno',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ))
            ], crossAxisAlignment: CrossAxisAlignment.center)),
      ),
    );
  }
}
