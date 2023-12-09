import 'package:chatgpt/core/utils/services/api_service.dart';

class GetMessageService {
  Future<String> getResponseMessage(String query) async {
    String data = await ApiServices().postData(
      url: '/chat/completions',
      query: query,
    );
    return data;
  }
}
