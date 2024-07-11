
import 'package:commons/commons.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AppLocalizations locate = GetIt.I<AppLocalizations>();
  final GlobalKey<ResultContainerState> _resultContainerKey =
      GlobalKey<ResultContainerState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text(locate.appBarTitleHome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<SearchProvider>(context, listen: false)
                    .updateSearchText(value);
              },
              decoration: InputDecoration(labelText: locate.titleInputLabelHome),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () async {
                await Provider.of<SearchProvider>(context, listen: false)
                    .search();
                _resultContainerKey.currentState?.refresh();
              },
              child: Text(locate.titleBottomHome),
            ),
            const SizedBox(height: 16.0),
            ResultContainer(key: _resultContainerKey),
          ],
        ),
      ),
    );
  }
}
