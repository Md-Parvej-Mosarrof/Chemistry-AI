class Reaction {
  final String id;

  /// User input
  final String reactants;

  /// Final balanced equation
  final String balancedEquation;

  /// Products
  final List<String> products;

  /// Reaction type
  final String reactionType;

  /// Required conditions
  final String conditions;

  /// AI explanation
  final String explanation;

  /// Is reaction balanced?
  final bool isBalanced;

  const Reaction({
    required this.id,
    required this.reactants,
    required this.balancedEquation,
    required this.products,
    required this.reactionType,
    required this.conditions,
    required this.explanation,
    required this.isBalanced,
  });
}
