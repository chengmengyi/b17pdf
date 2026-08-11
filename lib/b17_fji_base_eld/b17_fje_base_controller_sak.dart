import 'dart:async';

import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fhi_signal_bean_feo.dart';
import 'package:b17pdf/b17_dji_func_jdo/b17_fhi_signal_func_ejo/b17_fji_signal_func_eji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class B17FjeBaseControllerSak extends GetxController {
  StreamSubscription<B17FhiSignalBeanFeo>? b17JeiEventSubscriptiondDji;

  @override
  void onInit() {
    super.onInit();
    if (b17FeiRegisterEventJif()) {
      b17JeiEventSubscriptiondDji = B17FjiSignalFuncEji.instance
          .b17UejRegisterEventhIfe(
            b17DzwEventCallbackXqn: b17RifHandleEventhJei,
          );
    }
  }

  bool b17FeiRegisterEventJif() => false;

  void b17RifHandleEventhJei(B17FhiSignalBeanFeo b17QzmEventXva) {}

  @override
  void onClose() {
    if (b17FeiRegisterEventJif()) {
      b17JeiEventSubscriptiondDji?.cancel();
      b17JeiEventSubscriptiondDji = null;
    }
    super.onClose();
  }
}
