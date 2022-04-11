import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/github_repo/github_store.dart';

class GitHubPage extends StatefulWidget {
  final String title;
  const GitHubPage({Key? key, required this.title}) : super(key: key);

  @override
  State<GitHubPage> createState() => _GitHubPageState();
}

class _GitHubPageState extends State<GitHubPage> {
  final store = GithubStore();

  final overlayLoading = OverlayEntry(builder: (_) {
    return Container(
      color: Colors.black45,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  });

  @override
  void initState() {
    super.initState();

    reaction((_) => store.error, (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(store.error.toString()),
        backgroundColor: Colors.red,
      ));
    });

    reaction<bool>((_) => store.loading, (isLoading) {
      if (isLoading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      store.fetchRepos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          if (store.state.isEmpty) {
            return Container();
          }

          return ListView.builder(
              itemCount: store.state.length,
              itemBuilder: (context, id) {
                final model = store.state[id];
                return ListTile(
                  title: Text(model.name),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.fetchRepos,
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
