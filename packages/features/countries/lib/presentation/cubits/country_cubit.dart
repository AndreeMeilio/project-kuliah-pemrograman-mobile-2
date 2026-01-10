
import 'package:core/constant/response_code.dart';
import 'package:core/utils/generic_state.dart';
import 'package:countries/domain/entities/country/country.dart';
import 'package:countries/domain/usecases/get_all_country.dart';
import 'package:countries/presentation/states/country_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCubit extends Cubit<GenericState> {
  final GetAllCountry _getAllCountry;

  CountryCubit({
    required GetAllCountry getAllCountry
  }) : _getAllCountry = getAllCountry,
      super(GenericState(
        state: CountryInitialState()
      ));

  GenericState getAllCountryState = GenericState<List<CountryData>, CountryState>(
    state: CountryInitialState()
  );

  Future<Country> getAllCountry() async{
    try {
      getAllCountryState = GenericState(state: CountryLoadingState());
      emit(getAllCountryState);

      final Country data = await _getAllCountry();

      getAllCountryState = GenericState<List<CountryData>, CountryState>(
        status: data.statusCode,
        message: data.message,
        data: data.data,
        state: CountryLoadedState()
      );
      emit(getAllCountryState);

      return data;
    } catch (e){

      const status = ResponseCodeEnum.error;
      final message = "Terjadi kesahalan pada aplikasi",

      getAllCountryState = GenericState(
        status: status,
        message: message,
        error: e.toString(),
        state: CountryFailedState(),
        data: []
      );

      emit(getAllCountryState);

      return Country(
        statusCode: status,
        message: message,
        data: []
      );
    }
  }
}
