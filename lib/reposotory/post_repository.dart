import 'package:todoly/model/post_model.dart';
import 'package:todoly/service/api_service.dart';

class PostRepository {
  final ApiService apiService = ApiService();

  Future<List<PostModel>>? fetchPost() async {
    return await apiService.get('/posts').then((response) {
      return List<PostModel>.from(
        response.map(
          (data) => PostModel.fromJson(data),
        ),
      );
    });
  }
}
