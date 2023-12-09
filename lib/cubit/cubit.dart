import 'package:chatgpt/cubit/states.dart';
import 'package:chatgpt/services/get_messages_service.dart';
import 'package:chatgpt/services/get_models_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  String selectedItem = 'Model1';

  void changeDropdownMenuItem(String value) {
    selectedItem = value;
    emit(ChangeDropdownMenuItemState());
  }

  void getAllModels() {
    emit(GetALlModelsLoadingState());
    GetAllModels().getAllModel();
    emit(GetALlModelsSuccessState());
  }
List<String> responseMessage = [] ;
  void getResponseMessage(String query) {
    emit(GetResponseLoadingState());
    GetMessageService().getResponseMessage(query).then((value){
      responseMessage.add(value) ;
      emit(GetResponseSuccessState());
      // for(int i =0 ; i<responseMessage.length ; i++)
      //   {
      //     print('Response Messages IS ${responseMessage[i]}');
      //   }

    });

  }
}
