import 'package:flutter/material.dart';
import 'package:forecast_flutter/app/ServiceLocator.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseView<T extends Model> extends StatelessWidget {
  final ScopedModelDescendantBuilder<T> _builder;

  BaseView({@required ScopedModelDescendantBuilder<T> builder}) : _builder = builder;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
        model: locator<T>(),
        child: ScopedModelDescendant<T>(builder: _builder));
  }
}
