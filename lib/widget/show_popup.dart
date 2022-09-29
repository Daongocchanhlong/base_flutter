import 'package:base_src/base/base_mixin.dart';

class ShowPopup with BaseMixin {
  Future<T?> notifi<T>({
    required String? content,
    String? title,
    String? titleDone,
    String? titleClose,
    bool showButtonCLose = true,
    bool barrierDismissible = true,
    Function()? clickDone,
  }) async =>
      await Get.dialog<T>(
        Dialog(
          elevation: 0,
          backgroundColor: color.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title ?? '通知',
                  style: textStyle.semiBold(size: 16, color: color.green),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 1,
                ),
              ),
              Divider(
                height: 1,
                color: color.black,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: Text(
                    content ?? '',
                    style: textStyle.custom(size: 14, color: color.green),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (clickDone != null) {
                            clickDone();
                          } else {
                            Get.back();
                          }
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(child: Text(titleDone ?? 'OK ')),
                        ),
                      ),
                    ),
                    if (!showButtonCLose)
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Center(child: Text(titleClose ?? 'Close')),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: barrierDismissible,
      );

  Future<T?> custom<T>({
    required Widget content,
    bool barrierDismissible = true,
  }) async =>
      await Get.dialog<T>(
        Dialog(
          elevation: 0,
          backgroundColor: color.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[content],
            ),
          ),
        ),
        barrierDismissible: barrierDismissible,
      );
}
