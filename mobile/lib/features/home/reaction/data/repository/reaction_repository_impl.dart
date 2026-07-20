import '../../domain/entities/reaction.dart';
import '../../domain/repository/reaction_repository.dart';
import '../datasource/fake_reaction_datasource.dart';

class ReactionRepositoryImpl implements ReactionRepository {
  final FakeReactionDataSource dataSource;

  ReactionRepositoryImpl(this.dataSource);

  @override
  Future<Reaction> searchReaction(String equation) {
    return dataSource.searchReaction(equation);
  }
}