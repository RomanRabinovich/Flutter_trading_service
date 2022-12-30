import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class IPopupBase {
  Widget render();
}

class CustomPopup extends IPopupBase {
  CustomPopup({
    required this.child,
    required this.backgroundColor,
    required this.closeOnBackground,
    required this.width,
  }) : assert(child != null);
  final Widget child;
  final Color backgroundColor;
  final bool closeOnBackground;
  final double width;

  @override
  Widget render() => Builder(
    builder: (context) {
      return GestureDetector(
        onTap: () {
          if (closeOnBackground) Navigator.of(context).pop(true);
        },
        child: Container(
          width: width ?? MediaQuery.of(context).size.width / 1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0.0,
                backgroundColor: backgroundColor ??
                    Theme.of(context).colorScheme.secondary,
                child: child,
              ),
            ],
          ),
        ),
      );
    },
  );
}

class MessagePopup extends IPopupBase {
  MessagePopup({
    required this.message,
    required this.backgroundColor,
    required this.fontColor,
  });

  final Color backgroundColor;
  final String message;
  final Color fontColor;
  @override
  Widget render() {
    return Builder(
      builder: (context) {
        AppLocalizations? locale =AppLocalizations.of(context);

        return GestureDetector(
          onTap: () => Navigator.of(context).pop(true),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0.0,
                  backgroundColor: backgroundColor ??
                      Theme.of(context).colorScheme.secondary,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      margin: EdgeInsets.all(0),
                      child: Center(
                        child: Text(
                          message ?? 'someMessega', //locale.someMessage,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: fontColor ?? Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PopupBuilder extends StatefulWidget {
  const PopupBuilder({
    required this.popup,
    required this.dissapearTime,
  }) : assert(popup != null);

  final IPopupBase popup;
  final int dissapearTime;

  static Future<bool?> show(context,
      {required IPopupBase popup, required int dissapearTime, required Color backdropColor}) {
    return showDialog<bool>(
        barrierColor: Colors.amberAccent,
        context: context,
        builder: (_) => PopupBuilder(
          popup: popup,
          dissapearTime: dissapearTime,
        ));
  }

  @override
  _PopupBuilderState createState() => _PopupBuilderState();
}

class _PopupBuilderState extends State<PopupBuilder> {
  @override
  void initState() {
    setDisappearingTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.popup.render();

  setDisappearingTimeout() {
    if (widget.dissapearTime != null) {
      Future.delayed(Duration(milliseconds: widget.dissapearTime), () {
        if (mounted) Navigator.of(context).pop(true);
      });
    }
  }
}
