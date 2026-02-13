import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_img.dart';
import '../../data/repo/gold_repo.dart';
import '../cubits/gold_cubit.dart';
import '../cubits/gold_states.dart';

class Gold extends StatelessWidget {
  const Gold({super.key, required this.goldRepo});

  final GoldRepo goldRepo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(goldRepo: goldRepo)..getGold(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: AppColors.gold,
          centerTitle: true,
          title: const Text(
            AppStrings.kGoldTracker,
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: BlocBuilder<GoldCubit, BaseGoldState>(
          builder: (context, state) {
            if (state is LoadingGoldState) {
              return Center(child: Lottie.asset(AppImages.kLoadingImg));
            } else if (state is FailureGoldState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(
                    fontSize: 30,
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomImg(
                      imgPath: AppImages.kGoldImg,
                      imgColor: AppColors.gold,
                    ),
                    Text(
                      "${(state as SuccessGoldState).goldModel.price} USD",
                      style: const TextStyle(
                        fontSize: 30,
                        color: AppColors.gold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
