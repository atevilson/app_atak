
import 'package:app_atak/providers/search_provider.dart';
import 'package:app_atak/widgets/result_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ResultContainerState> _resultContainerKey = GlobalKey<ResultContainerState>();
  HomeScreen({super.key});

  // títulos de widgets
  final appDePesquisaAtak = "App de pesquisa Atak";
  final pesquisaGoogle = "Pesquisa google";
  final pesquisar = "Pesquisar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appDePesquisaAtak),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<SearchProvider>(context, listen: false).updateSearchText(value);
              },
              decoration: InputDecoration(
                labelText: pesquisaGoogle,
                iconColor: Colors.black,
                focusedBorder: const OutlineInputBorder(
                  gapPadding: 1.0,
                  borderSide: BorderSide(
                    color: Colors.black,
                  )
                ),
                floatingLabelStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await Provider.of<SearchProvider>(context, listen: false).search();
                _resultContainerKey.currentState?.refresh();
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: Text(
                pesquisar,
              ),
            ),
            const SizedBox(height: 16.0),
            ResultContainer(key: _resultContainerKey),
          ],
        ),
      ),
    );
  }
}