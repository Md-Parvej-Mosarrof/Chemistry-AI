import '../models/reaction_model.dart';

class FakeReactionDataSource {
  Future<ReactionModel> searchReaction(String equation) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final input = equation.replaceAll(' ', '').toLowerCase();

    switch (input) {
      case 'h2+o2':
        return const ReactionModel(
          id: '1',
          reactants: 'H2 + O2',
          balancedEquation: '2H₂ + O₂ → 2H₂O',
          products: ['H₂O'],
          reactionType: 'Combination',
          conditions: 'Heat',
          explanation:
              'Hydrogen reacts with oxygen to produce water.',
          isBalanced: true,
        );

      default:
        throw Exception('Reaction not found');
    }
  }
}