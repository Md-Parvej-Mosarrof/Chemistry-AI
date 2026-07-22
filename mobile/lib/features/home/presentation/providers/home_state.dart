import '../../domain/entities/home_entity.dart';

class HomeState {
  final bool isLoading;
  final List<HomeEntity> data;
  final String? error;

  const HomeState({this.isLoading = false, this.data = const [], this.error});

  HomeState copyWith({bool? isLoading, List<HomeEntity>? data, String? error}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
    );
  }
}
