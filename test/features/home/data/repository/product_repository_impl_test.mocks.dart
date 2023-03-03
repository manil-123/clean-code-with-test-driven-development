// Mocks generated by Mockito 5.3.2 from annotations
// in ecom_clean_code/test/features/home/data/repository/product_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart'
    as _i4;
import 'package:ecom_clean_code/features/home/data/model/product_data_model.dart'
    as _i6;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSharedPreferences_1 extends _i1.SmartFake
    implements _i3.SharedPreferences {
  _FakeSharedPreferences_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductsRemoteDataSource extends _i1.Mock
    implements _i4.ProductsRemoteDataSource {
  MockProductsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);
  @override
  _i3.SharedPreferences get sharedPreferences => (super.noSuchMethod(
        Invocation.getter(#sharedPreferences),
        returnValue: _FakeSharedPreferences_1(
          this,
          Invocation.getter(#sharedPreferences),
        ),
      ) as _i3.SharedPreferences);
  @override
  _i5.Future<List<_i6.ProductDataModel>> getProducts() => (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
        ),
        returnValue: _i5.Future<List<_i6.ProductDataModel>>.value(
            <_i6.ProductDataModel>[]),
      ) as _i5.Future<List<_i6.ProductDataModel>>);
  @override
  _i5.Future<_i2.Response> performGetRequest(String? endpoint) =>
      (super.noSuchMethod(
        Invocation.method(
          #performGetRequest,
          [endpoint],
        ),
        returnValue: _i5.Future<_i2.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #performGetRequest,
            [endpoint],
          ),
        )),
      ) as _i5.Future<_i2.Response>);
  @override
  _i5.Future<_i2.Response> performPostRequest(
    String? endpoint,
    Object? parameter,
    Map<String, String>? header,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #performPostRequest,
          [
            endpoint,
            parameter,
            header,
          ],
        ),
        returnValue: _i5.Future<_i2.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #performPostRequest,
            [
              endpoint,
              parameter,
              header,
            ],
          ),
        )),
      ) as _i5.Future<_i2.Response>);
  @override
  Never onTimeout() => (super.noSuchMethod(
        Invocation.method(
          #onTimeout,
          [],
        ),
        returnValue: null,
      ) as Never);
}
