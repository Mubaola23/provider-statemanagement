import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoly/controller/post_controller.dart';
import 'package:todoly/shared/_shared.dart';
import 'package:todoly/views/components/_componenets.dart' show PostItem;

class PostView extends StatelessWidget {
  const PostView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PostController>();

    if (controller.isLoading) {
      return const NetworkLoader();
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await controller.fetchPosts();
        },
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    color: Colors.blueGrey,
                    child: const AppLogo(text: 'Post')),
                background: Container(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            if (controller.posts.isEmpty) ...[
              const SliverFillRemaining(
                  child: Center(
                child: Text('No Posts'),
              ))
            ] else ...[
              SliverList.builder(itemBuilder: (context, index) {
                return PostItem(
                  title: controller.posts[index].title ?? '',
                  subtitle: controller.posts[index].body ?? '',
                );
              })
            ],
          ],
        ),
      ),
    );
  }
}
