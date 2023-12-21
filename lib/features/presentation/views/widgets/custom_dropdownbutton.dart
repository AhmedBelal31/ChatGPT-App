import 'package:chatgpt/core/utils/constants/constants.dart';
import 'package:chatgpt/core/utils/constants/styles.dart';
import 'package:chatgpt/features/presentation/controller/cubit/cubit.dart';
import 'package:chatgpt/features/presentation/controller/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return DropdownButton(
          dropdownColor: scaffoldBackgroundColor,
          items: models.map(
                (model) => DropdownMenuItem(
                  value: model,
                  // onTap: cubit.getAllModels,
                  child: Text(
                    model,
                    style: Styles.textStyle18,
                  ),
                ),
              )
              .toList(),
          value: cubit.selectedItem,
          onChanged: (item) {
            cubit.changeDropdownMenuItem(item!);
          },
        );
      },
    );
  }
}
