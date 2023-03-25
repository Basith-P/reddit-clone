import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppUser {
  final String uid;
  final String displayName;
  final String displayImage;
  final String banner;
  final bool isAuthenticated;
  final int karma;
  final List<String> awards;

  AppUser({
    required this.uid,
    required this.displayName,
    required this.displayImage,
    required this.banner,
    required this.isAuthenticated,
    required this.karma,
    required this.awards,
  });

  AppUser copyWith({
    String? uid,
    String? displayName,
    String? displayImage,
    String? banner,
    bool? isAuthenticated,
    int? karma,
    List<String>? awards,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      displayImage: displayImage ?? this.displayImage,
      banner: banner ?? this.banner,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      karma: karma ?? this.karma,
      awards: awards ?? this.awards,
    );
  }

  factory AppUser.fromMap(Map<String, dynamic> data) {
    return AppUser(
      uid: data['uid'],
      displayName: data['displayName'],
      displayImage: data['displayImage'],
      banner: data['banner'],
      isAuthenticated: data['isAuthenticated'],
      karma: data['karma'],
      awards: data['awards'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'displayImage': displayImage,
      'banner': banner,
      'isAuthenticated': isAuthenticated,
      'karma': karma,
      'awards': awards,
    };
  }

  @override
  String toString() {
    return 'User(uid: $uid, displayName: $displayName, displayImage: $displayImage, '
        'banner: $banner, isAuthenticated: $isAuthenticated, karma: $karma, awards: $awards)';
  }
}
