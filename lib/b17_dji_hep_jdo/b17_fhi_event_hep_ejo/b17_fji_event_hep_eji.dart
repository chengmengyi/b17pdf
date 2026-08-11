import 'dart:async';

import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fhi_event_bean_feo.dart';
import 'package:event_bus/event_bus.dart';

typedef B17DzwEventCallbackXqn =
    void Function(B17FhiEventBeanFeo b17FhiEventBeanFeo);

class B17FjiEventHepEji {
  static final B17FjiEventHepEji _b17FjieventHepEji = B17FjiEventHepEji();
  static B17FjiEventHepEji get instance => _b17FjieventHepEji;

  final EventBus _b17JijEventBusfIfe = EventBus();

  void b17JijSendMsgFEio(B17FhiEventBeanFeo b17FhiEventBeanFeo) {
    _b17JijEventBusfIfe.fire(b17FhiEventBeanFeo);
  }

  StreamSubscription<B17FhiEventBeanFeo> b17UejRegisterEventhIfe({
    required B17DzwEventCallbackXqn b17DzwEventCallbackXqn,
  }) {
    return _b17JijEventBusfIfe.on<B17FhiEventBeanFeo>().listen(
      b17DzwEventCallbackXqn,
    );
  }
}
