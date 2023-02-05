import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_app/data/repo/home_repository.dart';

final homeRepoProvider = Provider(
  (ref) => HomeRepository(),
);

final videoDataProvider = FutureProvider(
  (ref) {
    return ref.watch(homeRepoProvider).getVideoData();
  },
);
