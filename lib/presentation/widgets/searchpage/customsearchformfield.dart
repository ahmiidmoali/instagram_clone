import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussiness_logic/searchpage/cubit/searchpage_cubit.dart';
import '../../../core/constants/colors.dart';

class CustomSearchFormField extends StatelessWidget {
  const CustomSearchFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: MyColors.secondary2, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        onChanged: (value) {
          BlocProvider.of<SearchpageCubit>(context).isSearching(value);
        },
        maxLines: 1,
        minLines: 1,
        style: const TextStyle(color: MyColors.secondary1),
        decoration: InputDecoration(
            prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  size: 25,
                  color: MyColors.secondary1,
                )),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: MyColors.secondary2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: "Search",
            hintStyle:
                const TextStyle(color: MyColors.secondary1, fontSize: 25)),
      ),
    );
  }
}
