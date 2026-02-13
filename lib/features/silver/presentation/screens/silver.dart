import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/widgets/custom_img.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../data/repo/silver_repo.dart';
import '../cubits/silver_cubit.dart';
import '../cubits/silver_states.dart';

class Silver extends StatelessWidget {
  const Silver({super.key, required this.silverRepo});

  final SilverRepo silverRepo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(silverRepo: silverRepo)..getSilver(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: AppColors.silver,
          title: const Text(
            AppStrings.kSilverTracker,
            style: TextStyle(
              color: AppColors.silver,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: BlocBuilder<SilverCubit, BaseSilverState>(
          builder: (context, state) {
            if (state is LoadingSilverState) {
              return Center(child: Lottie.asset(AppImages.kLoadingImg));
            } else if (state is FailureSilverState) {
              return Center(
                child: Text(
                  state.errorMsg,
                  style: const TextStyle(
                    fontSize: 30,
                    color: AppColors.silver,
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
                      imgPath: AppImages.kSilverImg,
                      imgColor: AppColors.silver,
                    ),
                    Text(
                      "${(state as SuccessSilverState).silverModel.price} USD",
                      style: const TextStyle(
                        fontSize: 30,
                        color: AppColors.silver,
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
