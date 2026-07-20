import '../entities/reaction.dart';
import '../repository/reaction_repository.dart';

class SearchReaction {
  final ReactionRepository repository;

  SearchReaction(this.repository);

  Future<Reaction> call(String equation) {
    return repository.searchReaction(equation);
  }
}