import 'package:ecom_clean_code/features/login/domain/entities/login_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_data_model.g.dart';

@JsonSerializable()
class LoginDataModel extends LoginModel {
  final String token;
  LoginDataModel({required this.token}) : super(token: token);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
}
