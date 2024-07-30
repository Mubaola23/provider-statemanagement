import 'package:flutter/foundation.dart';
import 'package:todoly/model/post_model.dart';
import 'package:todoly/reposotory/post_repository.dart';

class PostController extends ChangeNotifier {
  PostController() {
    fetchPosts();
  }

  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  final _repo = PostRepository();
  bool isLoading = false;

  Future<void> fetchPosts() async {
    try {
      isLoading = true;
      notifyListeners();
      _posts = await _repo.fetchPost() ?? [];
    } on Error catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
