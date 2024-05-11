import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/searchpage/cubit/searchpage_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../data/models/allusers.dart';
import '../../../data/models/mainposts.dart';
import '../../widgets/searchpage/customlisttilesearch.dart';
import '../../widgets/searchpage/custompostsgrid.dart';
import '../../widgets/searchpage/customsearchformfield.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<MainPosts> allPosts = [];
    List<AllUsers> searched = [];
    return ListView(
      children: [
        //Search TextFormFiled
        const CustomSearchFormField(),
        const SizedBox(
          height: 10,
        ),
        //All users from searching Generator , posts Generator
        BlocBuilder<SearchpageCubit, SearchpageState>(
          builder: (context, state) {
            if (state is SearchpageLoading) {
              return const Center(
                child: Text("Loading"),
              );
            }
            if (state is SearchpageIsSearching) {
              searched = state.allUsersSearched;
              if (searched.isNotEmpty) {
                return CustomListTileSearch(
                  searched: searched,
                );
              } else {
                return const Text(
                  "nothing has this name",
                  style: TextStyle(color: MyColors.secondary1),
                );
              }
            }
            if (state is SearchpageLoaded) {
              allPosts = state.allposts;
              return CustomPostsGrid(
                allPosts: allPosts,
              );
            } else {
              return const SizedBox(
                height: 0,
              );
            }
          },
        ),
      ],
    );
  }
}
