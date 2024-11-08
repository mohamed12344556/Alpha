class notificationS_State {
  final bool generalNotification;
  final bool sound;
  final bool vibrate;
  final bool specialOffers;
  final bool payments;
  final bool promoDiscount;
  final bool cashback;

  notificationS_State({
    required this.generalNotification,
    required this.sound,
    required this.vibrate,
    required this.specialOffers,
    required this.payments,
    required this.promoDiscount,
    required this.cashback,
  });

  factory notificationS_State.initial() {
    return notificationS_State(
      generalNotification: true,
      sound: true,
      vibrate: true,
      specialOffers: true,
      payments: true,
      promoDiscount: true,
      cashback: true,
    );
  }

  notificationS_State copyWith({
    bool? generalNotification,
    bool? sound,
    bool? vibrate,
    bool? specialOffers,
    bool? payments,
    bool? promoDiscount,
    bool? cashback,
  }) {
    return notificationS_State(
      generalNotification: generalNotification ?? this.generalNotification,
      sound: sound ?? this.sound,
      vibrate: vibrate ?? this.vibrate,
      specialOffers: specialOffers ?? this.specialOffers,
      payments: payments ?? this.payments,
      promoDiscount: promoDiscount ?? this.promoDiscount,
      cashback: cashback ?? this.cashback,
    );
  }
}
