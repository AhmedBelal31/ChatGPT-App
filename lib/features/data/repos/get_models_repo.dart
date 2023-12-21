import 'package:chatgpt/core/utils/services/api_service.dart';
import 'package:chatgpt/features/data/models/models_model.dart';

class GetAllModels {
  Future<void> getAllModel() async {
    List<dynamic> data = await ApiServices().getData(url: '/models');

    List<ModelsModel> allModels = [];
    for (var model in data) {
      allModels.add(ModelsModel.fromJson(model));
    }

    /// For Testing
    for (int i = 0; i < allModels.length; i++) {
      // print(allModels[i].id);

      // print(allModels[0].object);
      // print(allModels[0].ownedBy);
    }
    print(allModels.length);
  }
}
