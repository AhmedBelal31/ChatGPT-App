import 'package:chatgpt/core/utils/services/api_service.dart';

class GetMessageService {
  Future<String> getResponseMessage({required String query, String? modelName}) async {
    String data = await ApiServices().postData(
      modelName: modelName,
      url: '/chat/completions',
      query: query,
    );
    return data;
  }
}
