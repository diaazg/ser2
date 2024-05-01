import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/features/medicinesSchedule/data/models/medicines_models.dart';
import 'package:ser2/features/medicinesSchedule/data/repo/medicines_repo_imp.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/schedule_state.dart';

class ScheduleBloc extends Cubit<ScheduleState> {
  ScheduleBloc(this.repo) : super(InitScheduleState());
  final MedicineRepoImp repo;

  // njib name ta3 lyom
  // njib les dates ta3 les jours ta3 had smana
  // nchof ida rah kayn f had liyam et apres nchof date
  // factor = date - today index + day index
  // getFactor will calculate day date
  DateTime getFactor(String day) {
    DateTime currentDate = DateTime.now();
    late DateTime result;
    String todayName = DateFormat.EEEE().format(currentDate);
    int todayIndex = daysIndex[todayName]!;
    String dayName = daysDict[day];
    int dayIndex = daysIndex[dayName]!;
    int difference = dayIndex - todayIndex;
    if (difference < 0) {
      result = currentDate.subtract(Duration(days: difference.abs()));
      DateTime midnightDate = DateTime(result.year, result.month, result.day);
      result = midnightDate;
    } else if (difference == 0) {
      result = currentDate;
      DateTime midnightDate = DateTime(result.year, result.month, result.day);
      result = midnightDate;
    } else {
      result = currentDate.add(Duration(days: difference));
      DateTime midnightDate = DateTime(result.year, result.month, result.day);
      result = midnightDate;
    }

    return result;
  }

  Map<String, dynamic> daysDict = {
    'Sat': 'Saturday',
    'Sun': 'Sunday',
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday'
  };

  Map<String, int> daysIndex = {
    'Saturday': 0,
    'Sunday': 1,
    'Monday': 2,
    'Tuesday': 3,
    'Wednesday': 4,
    'Thursday': 5,
    'Friday': 6
  };

  String choosenDay = 'Sat';

  void chooseDay(String day) async {
    choosenDay = day;
    emit(ChooseDayState());
    emit(ScheduleLoadingState());

    var response = await repo.fetchMedicines();

    response.fold((failure) {
      emit(ScheduleFailureState(failure: failure));
    }, (success) {
      List<MedicineModel> dayMedicines = success
          .where((element) => element.days.contains(choosenDay))
          .toList();
      if (dayMedicines.isNotEmpty) {

        dayMedicines = dayMedicines
            .where((element) => (
              (element.endDate.isAfter(getFactor(choosenDay)) || element.endDate.isAtSameMomentAs(getFactor(choosenDay)))
               &&
                (element.startDate.isBefore(getFactor(choosenDay)) ||  element.startDate.isAtSameMomentAs(getFactor(choosenDay))  )
                
                ))
            .toList();
      }
      emit(ScheduleSuccessState(medicinesList: dayMedicines));
    });
  }
}
