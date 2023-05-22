


import 'package:flutter/cupertino.dart';

import '../../data/error/app_error.dart';
import 'generic_dialog.dart';

Future<void> showAppError({
  required AppError error,
  required BuildContext context,
}) {
  return showGenericDialog<bool>(
    context: context,
    title: error.title,
    content: error.description,
    optionsBuilder: () => {
      'OK': true,
    },
  );
}
