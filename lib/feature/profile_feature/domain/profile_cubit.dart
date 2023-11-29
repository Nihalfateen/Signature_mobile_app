import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:signature/signature.dart';
import 'package:tawqee3_mobile_app/core/extensions/task_excuter.dart';
import 'package:tawqee3_mobile_app/feature/profile_feature/data/model/avatar_model.dart';
import 'package:tawqee3_mobile_app/feature/profile_feature/data/model/profile_model.dart';
import 'package:tawqee3_mobile_app/feature/profile_feature/data/repos/profile_repo.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/services/locator_service.dart';
import '../../../fileExport.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ProfileRepo profileRepo = locator<ProfileRepo>();
  String? errorMessage;
  ProfileModel? profileModel;
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobStatusController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  File? image;
  final formKey = GlobalKey<FormState>();
  bool viewInfo = true;
  final SignatureController controller = SignatureController(
    penStrokeWidth: 2,
    penColor: const Color(0xff0000ff),
    exportBackgroundColor: AppColors.white1,
  );
  void getData() {
    jobTitleController.text =
        profileModel!.profile!.job == null ? " " : profileModel!.profile!.job!;
    jobStatusController.text = profileModel!.profile!.jobState == null
        ? " "
        : profileModel!.profile!.jobState!;
    fullNameController.text = profileModel!.profile!.fullName == null
        ? " "
        : profileModel!.profile!.fullName!;
    phoneNumberController.text = profileModel!.profile!.phone == null
        ? " "
        : profileModel!.profile!.phone!;
    emailController.text = profileModel!.profile!.email == null
        ? " "
        : profileModel!.profile!.email!;
  }

  Future<void> getProfile() async {
    emit(ProfileLoading());
    var response = profileRepo.getProfile();
    await response.excute(
      onFailed: (failed) => emit(ProfileError(errorMessage: failed.message)),
      onSuccess: (value) {
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
        email: emailController.text,
        job: jobTitleController.text,
        jobState: jobStatusController.text,
        phone: phoneNumberController.text);
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

  changeView() {
    viewInfo = !viewInfo;
    emit(ProfileInitial());
  }

  Future<File?> getImage({FileType? type}) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: type ?? FileType.media);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files.first;
    } else {
      return null;
    }
  }

  void getGalleryImage() async {
    image = await getImage();
    emit(ImageSelected());
  }

  bool canRemoveImage(File? image, String? currentImage) {
    bool canRemove = false;
    if (image != null) {
      canRemove = true;
      return canRemove;
    } else if (currentImage != null && currentImage != "") {
      canRemove = true;
      return canRemove;
    }
    return canRemove;
  }

  void removeSelectedImage() {
    image = null;
    emit(ImageDeleted());
  }

  Future<void> updateAvatar() async {
    emit(UpdateAvatarLoading());
    List<int> fileBytes = await image!.readAsBytes();
    String base64Image = base64Encode(fileBytes);
    final fileEncoded = 'data:data:image/png;base64,$base64Image';
    AvatarModel? avatarModel = AvatarModel(avatar: fileEncoded);
    var response = profileRepo.updateAvatar(avatarModel);
    await response.excute(
      onFailed: (failed) {
        errorMessage = failed.message;
        emit(UpdateAvatarError(errorMessage: failed.message));
      },
      onSuccess: (value) async {
        await getProfile().then((value) => removeSelectedImage());
        emit(UpdateAvatarDone());
      },
    );
  }
  Future<void>updateSignature()async{
    Uint8List? data = await controller.toPngBytes();
    String signature=base64Encode(data!);
    final fileEncoded = 'data:data:image/png;base64,$signature';
    var response =  profileRepo.updateSignature(fileEncoded);

    await response.excute(
      onFailed: (failed) {

        errorMessage = failed.message;

        emit(UpdateSignatureError(errorMessage: failed.message));
      },
      onSuccess: (value)async {
        await getProfile();
        emit(UpdateSignatureDone());
      },
    );
  }

  void editSignature()async{
    controller.clear();
    profileModel!.profile!.signature=null;
    emit(SignatureEdited());
  }
}
