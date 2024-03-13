import 'package:appwrite/appwrite.dart' as appModels;
import 'package:docs_google/Constant/asset.dart';

class AppWrite {
  late appModels.Client instance;

  void init() {
    instance = appModels.Client()
        .setEndpoint(appWriteEndPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }

  appModels.Client appWriteClientProvider() {
    return this.instance;
  }
}
