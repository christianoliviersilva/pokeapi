part of 'favorite_icon_bloc.dart';

class FavoriteIconCheckFavState extends Equatable {
  final bool isFavorite;

  const FavoriteIconCheckFavState({
    required this.isFavorite,
  });

  @override
  List<Object> get props => [
        isFavorite,
      ];
}
