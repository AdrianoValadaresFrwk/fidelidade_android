// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getWalletsController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetWalletsController on _GetWalletsController, Store {
  final _$walletsModelAtom = Atom(name: '_GetWalletsController.walletsModel');

  @override
  WalletsModel? get walletsModel {
    _$walletsModelAtom.reportRead();
    return super.walletsModel;
  }

  @override
  set walletsModel(WalletsModel? value) {
    _$walletsModelAtom.reportWrite(value, super.walletsModel, () {
      super.walletsModel = value;
    });
  }

  final _$getWalletsAsyncAction =
      AsyncAction('_GetWalletsController.getWallets');

  @override
  Future<bool> getWallets() {
    return _$getWalletsAsyncAction.run(() => super.getWallets());
  }

  @override
  String toString() {
    return '''
walletsModel: ${walletsModel}
    ''';
  }
}
