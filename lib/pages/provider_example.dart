import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/models/example_model.dart';

class ProviderExamplePage extends StatefulWidget {
  const ProviderExamplePage({Key? key}) : super(key: key);

  @override
  State<ProviderExamplePage> createState() => _ProviderExamplePageState();
}

class _ProviderExamplePageState extends State<ProviderExamplePage> {
  @override
  Widget build(BuildContext context) {
    final exampleModel = Provider.of<ExampleModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              exampleModel.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                exampleModel.changeTitle();
              },
              child: const Text(
                'Mudar texto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
