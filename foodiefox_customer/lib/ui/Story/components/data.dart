import 'story_model.dart';
import 'user_model.dart';

final List<Story> stories = [
  Story(
    url:
        'https://media-cdn.tripadvisor.com/media/photo-s/19/ec/18/5d/burning-brownie.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: User(
        name: "Burning Brownie",
        profileImageUrl:
            "https://reviewmonkey.pk/wp-content/uploads/2018/11/Burning-Brownie-logo-Review-Monkey.png"),
  ),
  Story(
    url:
        'https://media-cdn.tripadvisor.com/media/photo-s/11/02/31/b0/yum-is-first-floor-and.jpg',
    media: MediaType.image,
    user: User(
      name: 'Asian Wok',
      profileImageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/99/c9/93/asian-wok.jpg',
    ),
    duration: const Duration(seconds: 5),
  ),
  Story(
    url:
        'https://media-cdn.tripadvisor.com/media/photo-s/11/51/7d/9a/snapchat-1333196086-largejpg.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: User(
      name: 'Howdy',
      profileImageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/09/2d/b7/a6/howdy-s-restaurant.jpg',
    ),
  )
];
