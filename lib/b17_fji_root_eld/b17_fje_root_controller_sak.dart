import 'dart:async';

import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fhi_event_bean_feo.dart';
import 'package:b17pdf/b17_dji_hep_jdo/b17_fhi_event_hep_ejo/b17_fji_event_hep_eji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class B17FjeRootControllerSak extends GetxController {
  StreamSubscription<B17FhiEventBeanFeo>? b17JeiEventSubscriptiondDji;

  @override
  void onInit() {
    super.onInit();
    if (b17FeiRegisterEventJif()) {
      b17JeiEventSubscriptiondDji = B17FjiEventHepEji.instance
          .b17UejRegisterEventhIfe(
            b17DzwEventCallbackXqn: b17RifHandleEventhJei,
          );
    }
  }

  bool b17FeiRegisterEventJif() => false;

  void b17RifHandleEventhJei(B17FhiEventBeanFeo b17QzmEventXva) {}

  @override
  void onClose() {
    if (b17FeiRegisterEventJif()) {
      b17JeiEventSubscriptiondDji?.cancel();
      b17JeiEventSubscriptiondDji = null;
    }
    super.onClose();
  }
}
