class FailureModel {
  FailureModel({
    required this.state,
    required this.message,
    required this.data,
  });
    int ?state;
    String? message;
 String? data;

  FailureModel.fromJson(Map<String, dynamic> json){
    state = json['state'];
    message = json['message'];
    data = json['data'];
  }

}