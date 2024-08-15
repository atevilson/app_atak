
import 'package:app_atak/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultContainer extends StatefulWidget {

  const ResultContainer({super.key});

  @override
  ResultContainerState createState() => ResultContainerState();

  void refresh(BuildContext context) {
    ResultContainerState state = context.findAncestorStateOfType<ResultContainerState>()!;
    state.refresh();
  }
}

class ResultContainerState extends State<ResultContainer> with SingleTickerProviderStateMixin {

  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = animation();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, _) {
        if (searchProvider.isLoading) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                strokeAlign: CircularProgressIndicator.strokeAlignCenter,
                backgroundColor: Colors.grey,
                valueColor: _colorTween(),
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  searchProvider.title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                if (searchProvider.link.isNotEmpty)
                  InkWell(
                    onTap: () async {
                      String url = searchProvider.link.startsWith('http') ? searchProvider.link : 'http://${searchProvider.link}';
                      await launchUrl(Uri.parse(url));
                    },
                    child: Text(
                      searchProvider.link,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }
  
  Animation<Color?> _colorTween() {   
    return ColorTween(
      begin: Colors.deepPurpleAccent,
      end: Colors.black
    ).animate(_animation);
  }

  AnimationController animation() {
    return AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }
}
