
import 'package:provider/single_child_widget.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';

import '../../feature/auth_feature/domain/services/auth_cubit.dart';
import '../../fileExport.dart';

class AppCubits{

  static List<SingleChildWidget> appCubit() => [

    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
    ),
    BlocProvider<MeetingsCubit>(
      create: (context) => MeetingsCubit(),
    ),
  ];


}
