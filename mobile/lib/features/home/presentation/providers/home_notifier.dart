import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/home_usecase.dart';
import 'home_provider.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this._useCase) : super(const HomeState()) {
    loadHomeData();
  }

  final HomeUseCase _useCase;

  Future<void> loadHomeData() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final result = await _useCase();

      state = state.copyWith(
        isLoading: false,
        data: result,
        error: null,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<void> refresh() async {
    await loadHomeData();
  }

  Future<void> retry() async {
    await loadHomeData();
  }
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(
    ref.read(homeUseCaseProvider),
  );
});