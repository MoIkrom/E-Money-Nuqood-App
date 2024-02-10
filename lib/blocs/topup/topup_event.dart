part of 'topup_bloc.dart';

sealed class TopupEvent extends Equatable {
  const TopupEvent();

  @override
  List<Object> get props => [];
}

class TopUpPost extends TopupEvent {
  final TopupFormModel data;

  const TopUpPost(
    this.data,
  );

  @override
  List<Object> get props => [data];
}

class TopUpPosted extends TopupEvent {
  final TopupFormModel data;

  const TopUpPosted(
    this.data,
  );

  @override
  List<Object> get props => [data];
}
