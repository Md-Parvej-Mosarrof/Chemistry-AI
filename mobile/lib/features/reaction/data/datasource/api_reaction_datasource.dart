import 'package:dio/dio.dart';

class ApiReactionDataSource {
  final Dio dio;

  ApiReactionDataSource(this.dio);

  Future<String> searchReaction(String equation) async {
    throw UnimplementedError();
  }
}
