import '../../domain/entities/reaction.dart';

class ReactionModel extends Reaction {
  const ReactionModel({
    required super.id,
    required super.reactants,
    required super.balancedEquation,
    required super.products,
    required super.reactionType,
    required super.conditions,
    required super.explanation,
    required super.isBalanced,
  });
}
