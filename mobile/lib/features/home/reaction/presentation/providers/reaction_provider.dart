import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/fake_reaction_datasource.dart';
import '../../data/repository/reaction_repository_impl.dart';
import '../../domain/usecases/search_reaction.dart';

final fakeReactionDataSourceProvider =
    Provider<FakeReactionDataSource>((ref) {
  return FakeReactionDataSource();
});

final reactionRepositoryProvider =
    Provider<ReactionRepositoryImpl>((ref) {
  return ReactionRepositoryImpl(
    ref.watch(fakeReactionDataSourceProvider),
  );
});

final searchReactionProvider =
    Provider<SearchReaction>((ref) {
  return SearchReaction(
    ref.watch(reactionRepositoryProvider),
  );
});