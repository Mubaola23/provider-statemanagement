import 'package:mockito/annotations.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:todoly/controller/todo_view_controller.dart';
import 'package:todoly/service/storage/local_storage_service.dart';

@GenerateMocks([
  PathProviderPlatform,
  LocalStorageService,
  // StorageRepository,
  TodoViewController
])
void main() {}
