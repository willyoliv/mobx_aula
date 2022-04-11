import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import 'models/repo_model.dart';

part 'github_store.g.dart';

const GITHUB_URL = 'https://api.github.com/users/willyoliv/repos';

class GithubStore = _GithubStore with _$GithubStore;

abstract class _GithubStore with Store {
  @observable
  bool loading = false;

  @observable
  Exception? error;

  @observable
  var state = <RepoModel>[];

  @action
  Future<void> fetchRepos() async {
    loading = true;

    try {
      final result = await Dio().get(GITHUB_URL);
      state = (result.data as List).map((e) => RepoModel.fromMap(e)).toList();
    } catch (e) {
      error = Exception('Erro ao pegar repositório');
    } finally {
      loading = false;
    }
  }
}
