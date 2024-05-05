import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/features/appointment/data/models/appointment_model.dart';
import 'package:ser2/features/appointment/data/models/my_rendu_vous.dart';
import 'package:ser2/features/appointment/data/repos/appointment_repo_abs.dart';

class AppointmentRepo extends AppointmentRepoAbs {
  FirebaseFirestore storeInstance = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, List<AppointmentModel>>> fecthAppointmentInfo(
      String medcinUid) async {
    try {
      CollectionReference medicalCollection =
          storeInstance.collection('doctors').doc(medcinUid).collection('days');
      QuerySnapshot querySnapshot = await medicalCollection.get();

      List<AppointmentModel> doctorSchedule = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return AppointmentModel.fromJson(data, doc.id);
      }).toList();
      return right(doctorSchedule);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }

  @override
  Future<Either<Failure, int>> reserve(
      String medcinUid, String day, String maladUid, bool isToday) async {
    try {
      late int nbr;
      late AppointmentModel aptInfo;
      late DateTime date;
      DocumentReference aptDoc = storeInstance
          .collection('doctors')
          .doc(medcinUid)
          .collection('days')
          .doc(day);

      dynamic documentSnapshot = await aptDoc.get();
      if (documentSnapshot.exists) {
        dynamic json = documentSnapshot.data()!;
        aptInfo = AppointmentModel.fromJson(json, day);

        nbr = aptInfo.nbr;
      } else {
        nbr = 0;
      }

      if (nbr > 0) {
        if (compareTimes(
                aptInfo.mrStart, aptInfo.mrEnd, int.parse(aptInfo.time)) ==
            -1) {
          var addedTime = DateTime.parse("2000-01-01 ${aptInfo.mrStart}");

          addedTime = addedTime.add(Duration(minutes: int.parse(aptInfo.time)));
          String formattedHour = addedTime.hour.toString().padLeft(2, '0');
          String formattedMinute = addedTime.minute.toString().padLeft(2, '0');
          if (isToday) {
            date = DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, addedTime.hour, addedTime.minute);
          } else {
            date = DateTime(
                DateTime.now().add(const Duration(days: 1)).year,
                DateTime.now().add(const Duration(days: 1)).month,
                DateTime.now().add(const Duration(days: 1)).day,
                addedTime.hour,
                addedTime.minute);
          }
          await aptDoc.update(
              {'Nb': nbr - 1, 'Mr1': '$formattedHour:$formattedMinute'});
          await storeInstance.collection('Reservation').add(RenduVousModel(
                  renduVousId: '',
                  doctorId: medcinUid,
                  maladId: maladUid,
                  turn: nbr,
                  state: false,
                  dateTime: date)
              .toJson());
          return right(nbr);
        } else if (compareTimes(
                aptInfo.evStart, aptInfo.evEnd, int.parse(aptInfo.time)) ==
            -1) {
          var addedTime = DateTime.parse("2000-01-01 ${aptInfo.evStart}");
          addedTime = addedTime.add(Duration(minutes: int.parse(aptInfo.time)));
          String formattedHour = addedTime.hour.toString().padLeft(2, '0');
          String formattedMinute = addedTime.minute.toString().padLeft(2, '0');
          if (isToday) {
            date = DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, addedTime.hour, addedTime.minute);
          } else {
            date = DateTime(
                DateTime.now().add(const Duration(days: 1)).year,
                DateTime.now().add(const Duration(days: 1)).month,
                DateTime.now().add(const Duration(days: 1)).day,
                addedTime.hour,
                addedTime.minute);
          }
          await aptDoc.update(
              {'Nb': nbr - 1, 'Ev1': '$formattedHour:$formattedMinute'});
          await storeInstance.collection('Reservation').add(RenduVousModel(
                  renduVousId:'',
                  doctorId: medcinUid,
                  maladId: maladUid,
                  turn: nbr,
                  state: false,
                  dateTime: date)
              .toJson());
          return right(nbr);
        } else {
          return left(
              FirebaseFailure(errMessage: 'Nombre de place insufisant'));
        }
      } else {
        return left(FirebaseFailure(errMessage: 'Nombre de place insufisant'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }

  int compareTimes(String time1, String time2, int pass) {
    // Convert time strings to DateTime objects
    DateTime mr1Time = DateTime.parse("2000-01-01 $time1:00");
    DateTime mr2Time = DateTime.parse("2000-01-01 $time2:00");

    // Add 20 minutes to Mr1
    mr1Time = mr1Time.add(const Duration(minutes: 20));

    // Compare Mr1 with Mr2
    if (mr1Time.isBefore(mr2Time)) {
      return -1;
    } else if (mr1Time.isAfter(mr2Time)) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Future<Either<Failure, List<RenduVousModel>>> myAppointments(
      String userId) async {
    try {
     
      CollectionReference doctorsCollection =
          storeInstance.collection('Reservation');
    
      QuerySnapshot querySnapshot = await doctorsCollection
          .where('MaladeId', isEqualTo: userId)
          .where('state', isEqualTo: false)
          .get();
         
      List<RenduVousModel> renduVousList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return RenduVousModel.fromJson(data,doc.id);
      }).toList();
      return right(renduVousList);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } catch (e) {
      return left(FirebaseFailure(errMessage: 'Oops error occurred try later'));
    }
  }

}
