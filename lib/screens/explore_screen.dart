import 'package:demo_app/api/api_service.dart';
import 'package:demo_app/components/circle_image.dart';
import 'package:demo_app/components/today_recipe_listview.dart';
import 'package:demo_app/models/post.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getExploreData(),
      builder: (context, snapshot) {
        // Checks if data has been loaded in
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListview(recipes: snapshot.data?.todayRecipes ?? []),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  } //Card1();
}

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({super.key, required this.friendPosts});

  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Social Chefs 🧑‍🍳',
              style: Theme.of(context).textTheme.displayLarge),
          ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                final post = friendPosts[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleImage(imageProvider: AssetImage(post.profileImageUrl), radius: 24,),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('${post.comment}'),
                              Text('${post.timestamp} minutes ago'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 5);
              },
              itemCount: friendPosts.length)
        ],
      ),
    );
  }
}
