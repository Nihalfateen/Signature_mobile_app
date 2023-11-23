import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawqee3_mobile_app/core/extensions/task_excuter.dart';
import 'package:tawqee3_mobile_app/feature/profile_feature/data/model/profile_model.dart';
import 'package:tawqee3_mobile_app/feature/profile_feature/data/repos/profile_repo.dart';

import '../../../core/services/locator_service.dart';
import '../../../fileExport.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ProfileRepo profileRepo = locator<ProfileRepo>();
  String? errorMessage;
  ProfileModel?profileModel;
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobStatusController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool viewInfo=true;
  void getData(){
    jobTitleController.text=
    profileModel!.profile!.job == null ? " " : profileModel!.profile!.job!;
    jobStatusController.text=
    profileModel!.profile!.jobState == null ? " " : profileModel!.profile!.jobState!;
    fullNameController.text=
    profileModel!.profile!.fullName== null ? " " : profileModel!.profile!.fullName!;
    phoneNumberController.text=
    profileModel!.profile!.phone == null ? " " : profileModel!.profile!.phone!;
    emailController.text=
    profileModel!.profile!.email == null ? " " : profileModel!.profile!.email!;
  }

  Future<void>getProfile()async{
    emit(ProfileLoading());
    var response = profileRepo.getProfile();
    await response.excute(
      onFailed: (failed) => emit(ProfileError(errorMessage: failed.message)),
      onSuccess: (value){
        profileModel = value;
        getData();
        emit(ProfileDone());
      },
    );
  }
  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());

    Profile? profile = Profile(
       fullName: fullNameController.text,
    email:  emailController.text,
    job:jobTitleController.text,
    jobState: jobStatusController.text,phone: phoneNumberController.text);
    var response = profileRepo.updateProfile(profile);
    await response.excute(
      onFailed: (failed) {
        errorMessage = failed.message;
        emit(UpdateProfileError(errorMessage: failed.message));
      },
      onSuccess: (value) async {
        emit(UpdateProfileDone());
      },
    );
  }
  changeView(){
    viewInfo = !viewInfo;
    emit(ProfileInitial());
  }
}
