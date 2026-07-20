import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reaction_state.dart';
import '../../domain/usecases/search_reaction.dart';

class ReactionNotifier extends StateNotifier<ReactionState> {
  final SearchReaction searchReaction;

  ReactionNotifier(this.searchReaction)
      : super(const ReactionState());

  Future<void> search(String equation) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final result = await searchReaction(equation);

      state = ReactionState(
        isLoading: false,
        reaction: result,
      );
    } catch (e) {
      state = ReactionState(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}