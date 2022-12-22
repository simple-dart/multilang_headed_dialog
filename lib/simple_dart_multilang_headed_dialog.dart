import 'package:simple_dart_dialog/simple_dart_dialog.dart';
import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

abstract class MultilangHeadedDialog<T> extends AbstractDialog<T> {
  Panel headerPanel = Panel()..addCssClass('HeadedDialogHeader');
  MultilangLabel headerLabel = MultilangLabel()..padding = '10px';
  Panel bodyPanel = Panel()
    ..addCssClass('HeadedDialogBody')
    ..vertical = true
    ..padding = '10px'
    ..spacing = '5px';

  MultilangHeadedDialog() : super('HeadedDialog') {
    vertical = true;
    spacing = '5px';
    headerPanel.add(headerLabel);
    addAll([headerPanel, bodyPanel]);
  }

  String get langKey => headerLabel.langKey;

  set langKey(String newLangKey) {
    headerLabel.langKey = newLangKey;
  }

  void complete(T? result) {
    completer.complete(result);
    closeDialog();
  }

  @override
  void reRender() {
    headerLabel.reRender();
    bodyPanel.reRender();
  }
}
