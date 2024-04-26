import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/profile/data/repo/user_repo_imp.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_Event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent,UserDataState>{
  final UserDataRepoImp userDataRepo ;
  final String uid ;
  late UserModelInfo? userInfo;


  

  UserDataBloc({required this.userDataRepo,required this.uid}):super(UserDataInit()){
    on<GetUserData>((event, emit) async {
     emit(UserDataLoading());
      var response = await userDataRepo.getUserData(event.uid);
                    response.fold((failure){
                emit(UserDataGetFailure(failure: failure));
               }, (success){
                userInfo = success;
                emit(UserDataGetSuccessfull(userModelInfo: success));
               });
    });
    on<UpdateImage>((event, emit) async{
      try {
        emit(UserDataLoading());
    await userDataRepo.storeInstance.collection('users').doc(uid).update({'img': event.url});
          var response = await userDataRepo.getUserData(uid);
                    response.fold((failure){
                emit(UserDataGetFailure(failure: failure));
               }, (success){
                emit(UserDataGetSuccessfull(userModelInfo: success));
               });
    
   
} catch (error) {
    
}
    });

  }
} 