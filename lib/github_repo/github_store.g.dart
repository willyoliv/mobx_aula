// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GithubStore on _GithubStore, Store {
  final _$loadingAtom = Atom(name: '_GithubStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_GithubStore.error');

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$stateAtom = Atom(name: '_GithubStore.state');

  @override
  List<RepoModel> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(List<RepoModel> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$fetchReposAsyncAction = AsyncAction('_GithubStore.fetchRepos');

  @override
  Future<void> fetchRepos() {
    return _$fetchReposAsyncAction.run(() => super.fetchRepos());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
state: ${state}
    ''';
  }
}
