import 'package:chatgpt/features/data/repos/get_messages_repo.dart';
import 'package:chatgpt/features/data/repos/get_models_repo.dart';
import 'package:chatgpt/features/presentation/controller/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  String selectedItem = 'Model1';

  String getSelectedModel() {
    switch (selectedItem) {
      case 'Model1':
        return 'gpt-3.5-turbo-1106';
      case 'Model2':
        return 'gpt-3.5-turbo-0613';
      case 'Model3':
        return 'gpt-3.5-turbo-0301';
      case 'Model4':
        return 'gpt-3.5-turbo';
      default:
        return 'gpt-3.5-turbo-16k';
    }
  }

  void changeDropdownMenuItem(String value) {
    selectedItem = value;
    emit(ChangeDropdownMenuItemState());
  }

  void getAllModels() {
    emit(GetALlModelsLoadingState());
    GetAllModels().getAllModel();
    emit(GetALlModelsSuccessState());
  }

  List<String> responseMessage = [];

  void getResponseMessage({required String query}) {
    emit(GetResponseLoadingState());
    GetMessageService()
        .getResponseMessage(query: query, modelName: getSelectedModel())
        .then((value) {
      responseMessage.add(value);
      emit(GetResponseSuccessState());
      // for(int i =0 ; i<responseMessage.length ; i++)
      //   {
      //     print('Response Messages IS ${responseMessage[i]}');
      //   }
    });
  }
}
