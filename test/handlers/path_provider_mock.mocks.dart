// Mocks generated by Mockito 5.4.4 from annotations
// in todoly/test/handlers/path_provider_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i9;

import 'package:flutter/material.dart' as _i1;
import 'package:mockito/mockito.dart' as _i2;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart'
    as _i4;
import 'package:path_provider_platform_interface/src/enums.dart' as _i6;
import 'package:todoly/controller/todo_view_controller.dart' as _i7;
import 'package:todoly/model/_model.dart' as _i8;
import 'package:todoly/service/storage/local_storage_service.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGlobalKey_0<T extends _i1.State<_i1.StatefulWidget>>
    extends _i2.SmartFake implements _i1.GlobalKey<T> {
  _FakeGlobalKey_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTextEditingController_1 extends _i2.SmartFake
    implements _i1.TextEditingController {
  _FakeTextEditingController_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocalStorageService_2 extends _i2.SmartFake
    implements _i3.LocalStorageService {
  _FakeLocalStorageService_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PathProviderPlatform].
///
/// See the documentation for Mockito's code generation for more information.
class MockPathProviderPlatform extends _i2.Mock
    implements _i4.PathProviderPlatform {
  MockPathProviderPlatform() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String?> getTemporaryPath() => (super.noSuchMethod(
        Invocation.method(
          #getTemporaryPath,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);

  @override
  _i5.Future<String?> getApplicationSupportPath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationSupportPath,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);

  @override
  _i5.Future<String?> getLibraryPath() => (super.noSuchMethod(
        Invocation.method(
          #getLibraryPath,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);

  @override
  _i5.Future<String?> getApplicationDocumentsPath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationDocumentsPath,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);

  @override
  _i5.Future<String?> getApplicationCachePath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationCachePath,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);

  @override
  _i5.Future<String?> getExternalStoragePath() => (super.noSuchMethod(
        Invocation.method(
          #getExternalStoragePath,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);

  @override
  _i5.Future<List<String>?> getExternalCachePaths() => (super.noSuchMethod(
        Invocation.method(
          #getExternalCachePaths,
          [],
        ),
        returnValue: _i5.Future<List<String>?>.value(),
      ) as _i5.Future<List<String>?>);

  @override
  _i5.Future<List<String>?> getExternalStoragePaths(
          {_i6.StorageDirectory? type}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExternalStoragePaths,
          [],
          {#type: type},
        ),
        returnValue: _i5.Future<List<String>?>.value(),
      ) as _i5.Future<List<String>?>);

  @override
  _i5.Future<String?> getDownloadsPath() => (super.noSuchMethod(
        Invocation.method(
          #getDownloadsPath,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
}

/// A class which mocks [LocalStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageService extends _i2.Mock
    implements _i3.LocalStorageService {
  MockLocalStorageService() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> initializeHive() => (super.noSuchMethod(
        Invocation.method(
          #initializeHive,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> cacheTodoList(dynamic val) => (super.noSuchMethod(
        Invocation.method(
          #cacheTodoList,
          [val],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> cachePendingTodoList(dynamic val) => (super.noSuchMethod(
        Invocation.method(
          #cachePendingTodoList,
          [val],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void uploadAndDeletePendingTodoList() => super.noSuchMethod(
        Invocation.method(
          #uploadAndDeletePendingTodoList,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TodoViewController].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoViewController extends _i2.Mock
    implements _i7.TodoViewController {
  MockTodoViewController() {
    _i2.throwOnMissingStub(this);
  }

  @override
  List<_i8.TodoModel> get todoItems => (super.noSuchMethod(
        Invocation.getter(#todoItems),
        returnValue: <_i8.TodoModel>[],
      ) as List<_i8.TodoModel>);

  @override
  set todoItems(List<_i8.TodoModel>? _todoItems) => super.noSuchMethod(
        Invocation.setter(
          #todoItems,
          _todoItems,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i1.GlobalKey<_i1.FormState> get formKey => (super.noSuchMethod(
        Invocation.getter(#formKey),
        returnValue: _FakeGlobalKey_0<_i1.FormState>(
          this,
          Invocation.getter(#formKey),
        ),
      ) as _i1.GlobalKey<_i1.FormState>);

  @override
  _i1.TextEditingController get textEditingController => (super.noSuchMethod(
        Invocation.getter(#textEditingController),
        returnValue: _FakeTextEditingController_1(
          this,
          Invocation.getter(#textEditingController),
        ),
      ) as _i1.TextEditingController);

  @override
  _i3.LocalStorageService get storageService => (super.noSuchMethod(
        Invocation.getter(#storageService),
        returnValue: _FakeLocalStorageService_2(
          this,
          Invocation.getter(#storageService),
        ),
      ) as _i3.LocalStorageService);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addTodoItem() => super.noSuchMethod(
        Invocation.method(
          #addTodoItem,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleTodoItem(dynamic index) => super.noSuchMethod(
        Invocation.method(
          #toggleTodoItem,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeTodoItem(int? index) => super.noSuchMethod(
        Invocation.method(
          #removeTodoItem,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}