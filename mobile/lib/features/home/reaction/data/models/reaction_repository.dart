import '../entities/reaction.dart';

abstract class ReactionRepository {
  Future<Reaction> searchReaction(String equation);
}