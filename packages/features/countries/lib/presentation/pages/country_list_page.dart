
import 'package:core/constant/colors.dart';
import 'package:core/constant/numbers.dart';
import 'package:core/constant/spacings.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/generic_state.dart';
import 'package:core/utils/text_styles.dart';
import 'package:countries/domain/entities/country/country.dart';
import 'package:countries/presentation/cubits/country_cubit.dart';
import 'package:countries/presentation/states/country_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({super.key});

  @override
  State<CountryListPage> createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {

  late CountryCubit _countryCubit;

  @override
  void initState() {
    super.initState();

    _countryCubit = BlocProvider.of(context, listen: false);
    _countryCubit.getAllCountry();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(AppSpacing.defaultMargin),
              child: Text(
                "Daftar Country",
                style: AppTextStyle.kHeading1.get(),
              ),
            ),
            const SizedBox(height: AppSpacing.defaultVerticalSpace,),
            Expanded(
              child: BlocConsumer<CountryCubit, GenericState>(
                builder: (context, state) {
                  if (state.state is CountryLoadingState){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.state is CountryLoadedState){
                    final List<CountryData> data = state.data as List<CountryData>;

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.defaultMargin, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.black60
                            ),
                            color: AppColors.black40,
                            borderRadius: const BorderRadius.all(Radius.circular(AppNumbers.defaultRadius))
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: AppColors.splashColor,
                              borderRadius: const BorderRadius.all(Radius.circular(AppNumbers.defaultRadius)),
                              onTap: () {
                            
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  data[index].countryName.common ?? "",
                                  style: AppTextStyle.kBody1.get(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        state.message ?? "",
                        style: AppTextStyle.kBody1.get(),
                      ),
                    );
                  }
                },
                listener: (context, state) {
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}