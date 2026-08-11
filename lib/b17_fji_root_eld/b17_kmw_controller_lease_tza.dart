import 'package:get/get.dart';

final class B17KmwControllerLeaseTza<T extends GetxController> {
  B17KmwControllerLeaseTza._(
    this.b17NqxControllerRfe,
    this.b17JvcTagPol,
    this.b17UdhOwnsRegistrationWsk,
  );

  final T b17NqxControllerRfe;
  final String? b17JvcTagPol;
  final bool b17UdhOwnsRegistrationWsk;

  static B17KmwControllerLeaseTza<T>
  b17GtzAcquireMvu<T extends GetxController>({
    required T Function() b17RhpCreateControllerXae,
    String? b17YqnTagFds,
    bool b17LkePermanentZoc = false,
  }) {
    if (Get.isRegistered<T>(tag: b17YqnTagFds)) {
      return B17KmwControllerLeaseTza<T>._(
        Get.find<T>(tag: b17YqnTagFds),
        b17YqnTagFds,
        false,
      );
    }

    return B17KmwControllerLeaseTza<T>._(
      Get.put<T>(
        b17RhpCreateControllerXae(),
        tag: b17YqnTagFds,
        permanent: b17LkePermanentZoc,
      ),
      b17YqnTagFds,
      !b17LkePermanentZoc,
    );
  }

  void b17BqyReleaseSni() {
    if (b17UdhOwnsRegistrationWsk && Get.isRegistered<T>(tag: b17JvcTagPol)) {
      Get.delete<T>(tag: b17JvcTagPol);
    }
  }
}
