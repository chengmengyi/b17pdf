import 'dart:async';

import 'package:b17pdf/b17_gve_telemetry_rkx/b17_fhi_signals_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:event_bus/event_bus.dart';

typedef B17DzwSignalCallbackXqn =
    void Function(B17FhiSignalBeanFeo b17FhiEventBeanFeo);

class B17FjiSignalFuncEji {
  static final B17FjiSignalFuncEji _b17FjieventHepEji = B17FjiSignalFuncEji();
  static B17FjiSignalFuncEji get instance => _b17FjieventHepEji;

  final EventBus _b17JijEventBusfIfe = EventBus();

  void b17JijSendMsgFEio(B17FhiSignalBeanFeo b17FhiEventBeanFeo) {
    _b17JijEventBusfIfe.fire(b17FhiEventBeanFeo);
  }

  StreamSubscription<B17FhiSignalBeanFeo> b17UejRegisterEventhIfe({
    required B17DzwSignalCallbackXqn b17DzwEventCallbackXqn,
  }) {
    return _b17JijEventBusfIfe.on<B17FhiSignalBeanFeo>().listen(
      b17DzwEventCallbackXqn,
    );
  }
}
