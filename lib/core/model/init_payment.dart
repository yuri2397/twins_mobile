// To parse this JSON data, do
//
//     final initPayment = initPaymentFromJson(jsonString);

import 'dart:convert';

InitPayment initPaymentFromJson(String str) => InitPayment.fromJson(json.decode(str));

String initPaymentToJson(InitPayment data) => json.encode(data.toJson());

class InitPayment {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods? automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? livemode;
  List<dynamic>? metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodConfigurationDetails? paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  InitPayment({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory InitPayment.fromJson(Map<String, dynamic> json) => InitPayment(
    id: json["id"],
    object: json["object"],
    amount: json["amount"],
    amountCapturable: json["amount_capturable"],
    amountDetails: json["amount_details"] == null ? null : AmountDetails.fromJson(json["amount_details"]),
    amountReceived: json["amount_received"],
    application: json["application"],
    applicationFeeAmount: json["application_fee_amount"],
    automaticPaymentMethods: json["automatic_payment_methods"] == null ? null : AutomaticPaymentMethods.fromJson(json["automatic_payment_methods"]),
    canceledAt: json["canceled_at"],
    cancellationReason: json["cancellation_reason"],
    captureMethod: json["capture_method"],
    clientSecret: json["client_secret"],
    confirmationMethod: json["confirmation_method"],
    created: json["created"],
    currency: json["currency"],
    customer: json["customer"],
    description: json["description"],
    invoice: json["invoice"],
    lastPaymentError: json["last_payment_error"],
    latestCharge: json["latest_charge"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    nextAction: json["next_action"],
    onBehalfOf: json["on_behalf_of"],
    paymentMethod: json["payment_method"],
    paymentMethodConfigurationDetails: json["payment_method_configuration_details"] == null ? null : PaymentMethodConfigurationDetails.fromJson(json["payment_method_configuration_details"]),
    paymentMethodOptions: json["payment_method_options"] == null ? null : PaymentMethodOptions.fromJson(json["payment_method_options"]),
    paymentMethodTypes: json["payment_method_types"] == null ? [] : List<String>.from(json["payment_method_types"]!.map((x) => x)),
    processing: json["processing"],
    receiptEmail: json["receipt_email"],
    review: json["review"],
    setupFutureUsage: json["setup_future_usage"],
    shipping: json["shipping"],
    source: json["source"],
    statementDescriptor: json["statement_descriptor"],
    statementDescriptorSuffix: json["statement_descriptor_suffix"],
    status: json["status"],
    transferData: json["transfer_data"],
    transferGroup: json["transfer_group"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "amount": amount,
    "amount_capturable": amountCapturable,
    "amount_details": amountDetails?.toJson(),
    "amount_received": amountReceived,
    "application": application,
    "application_fee_amount": applicationFeeAmount,
    "automatic_payment_methods": automaticPaymentMethods?.toJson(),
    "canceled_at": canceledAt,
    "cancellation_reason": cancellationReason,
    "capture_method": captureMethod,
    "client_secret": clientSecret,
    "confirmation_method": confirmationMethod,
    "created": created,
    "currency": currency,
    "customer": customer,
    "description": description,
    "invoice": invoice,
    "last_payment_error": lastPaymentError,
    "latest_charge": latestCharge,
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "next_action": nextAction,
    "on_behalf_of": onBehalfOf,
    "payment_method": paymentMethod,
    "payment_method_configuration_details": paymentMethodConfigurationDetails?.toJson(),
    "payment_method_options": paymentMethodOptions?.toJson(),
    "payment_method_types": paymentMethodTypes == null ? [] : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
    "processing": processing,
    "receipt_email": receiptEmail,
    "review": review,
    "setup_future_usage": setupFutureUsage,
    "shipping": shipping,
    "source": source,
    "statement_descriptor": statementDescriptor,
    "statement_descriptor_suffix": statementDescriptorSuffix,
    "status": status,
    "transfer_data": transferData,
    "transfer_group": transferGroup,
  };
}

class AmountDetails {
  List<dynamic>? tip;

  AmountDetails({
    this.tip,
  });

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
    tip: json["tip"] == null ? [] : List<dynamic>.from(json["tip"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tip": tip == null ? [] : List<dynamic>.from(tip!.map((x) => x)),
  };
}

class AutomaticPaymentMethods {
  String? allowRedirects;
  bool? enabled;

  AutomaticPaymentMethods({
    this.allowRedirects,
    this.enabled,
  });

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) => AutomaticPaymentMethods(
    allowRedirects: json["allow_redirects"],
    enabled: json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "allow_redirects": allowRedirects,
    "enabled": enabled,
  };
}

class PaymentMethodConfigurationDetails {
  String? id;
  dynamic parent;

  PaymentMethodConfigurationDetails({
    this.id,
    this.parent,
  });

  factory PaymentMethodConfigurationDetails.fromJson(Map<String, dynamic> json) => PaymentMethodConfigurationDetails(
    id: json["id"],
    parent: json["parent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent": parent,
  };
}

class PaymentMethodOptions {
  List<dynamic>? ideal;

  PaymentMethodOptions({
    this.ideal,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) => PaymentMethodOptions(
    ideal: json["ideal"] == null ? [] : List<dynamic>.from(json["ideal"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ideal": ideal == null ? [] : List<dynamic>.from(ideal!.map((x) => x)),
  };
}
