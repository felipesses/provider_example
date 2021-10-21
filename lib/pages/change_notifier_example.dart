import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/models/coin_model.dart';
import 'package:provider_example/models/product_model.dart';
import 'package:provider_example/providers/coin_provider.dart';

class ChangeNotifierExamplePage extends StatefulWidget {
  const ChangeNotifierExamplePage({Key? key}) : super(key: key);

  @override
  _ChangeNotifierExamplePageState createState() =>
      _ChangeNotifierExamplePageState();
}

class _ChangeNotifierExamplePageState extends State<ChangeNotifierExamplePage> {
  List<ProductModel> productsList = [
    ProductModel(
      name: 'Xiaomi Redmi Note 9s',
      value: 5,
      imgSource: 'assets/xiaomi.jpg',
    ),
    ProductModel(
      name: 'iPhone 13',
      value: 10,
      imgSource: 'assets/iphone13.png',
    ),
    ProductModel(
      name: 'TV Samsung',
      value: 8,
      imgSource: 'assets/tv.jpg',
    ),
    ProductModel(
      name: 'MacBook Pro',
      value: 12,
      imgSource: 'assets/mac.jpg',
    ),
    ProductModel(
      name: 'Teclado HyperX Mars RGB',
      value: 11,
      imgSource: 'assets/hyperx.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoinProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                  Icons.attach_money_rounded,
                  color: Colors.yellow,
                ),
                Text(
                  provider.model.value.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        childAspectRatio: 8.0 / 9.0,
        children: productsList
            .map(
              (e) => InkWell(
                onTap: () {
                  provider.buyProduct(e.value ?? 0);
                  if (provider.canBuy) {
                    _showDialog(true);
                  } else {
                    _showDialog(false);
                  }
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 18.0 / 11.0,
                        child: Image.asset(e.imgSource),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${e.name}'),
                            const SizedBox(height: 8.0),
                            Text(e.value.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(" Adicionar moedas"),
        onPressed: () {
          provider.addValue();
        },
      ),
    );
  }

  _showDialog(bool canBuy) {
    String title = canBuy
        ? 'Produto comprado com sucesso!'
        : 'Você não possui moedas suficientes!';

    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
        );
      },
    );
  }
}
