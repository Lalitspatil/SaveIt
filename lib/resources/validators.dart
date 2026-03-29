import 'package:flutter/material.dart';
import 'package:saveit/resources/validation.dart';

extension TextFieldValidation on TextEditingController {
  String? isNameEmpty() {
    if (text.trim().isEmpty) {
      return Validation.shared.messages['name_error'];
    }
    return null;
  }

  String? isNumeric() {
    if (text.trim().isEmpty) {
      return 'Please enter a number';
    } else if (double.tryParse(text.trim()) == null) {
      return 'Invalid number';
    }
    return null;
  }

  String? isPhoneEmpty() {
    const phonePattern = r'^\d{10}$';
    final regex = RegExp(phonePattern);
    String? phone;
    if (text.length <= 10) {
      phone = text.trim();
    } else {
      phone = text.substring(text.length - 10);
    }
    if (text.trim().isEmpty) {
      return Validation.shared.messages['empty_phone_error'];
    } else if (!regex.hasMatch(phone) || text.trim().length > 10) {
      return Validation.shared.messages['phone_error'];
    }
    return null;
  }

  String? isEmailEmpty() {
    const emailPattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(emailPattern);
    if (text.trim().isEmpty) {
      return Validation.shared.messages['empty_email_error'];
    } else if (!regex.hasMatch(text.trim())) {
      return Validation.shared.messages['email_error'];
    }
    return null;
  }

  String? isVisitEmpty() {
    if (text.trim().isEmpty) {
      return Validation.shared.messages['visit_error'];
    }
    return null;
  }

  String? isChannelReferenceEmpty() {
    if (text.trim().isEmpty) {
      return Validation.shared.messages['channel_reference_error'];
    }
    return null;
  }

  String? isAddressEmpty() {
    if (text.trim().isEmpty) {
      return Validation.shared.messages['address_error'];
    }
    return null;
  }
}

extension StringValidation on String? {
  String? isStatusEmpty() {
    if (this == null) {
      return Validation.shared.messages['status_error'];
    }
    return null;
  }

  String? isProjectTypeEmpty() {
    if (this == null) {
      return Validation.shared.messages['project_type_error'];
    }
    return null;
  }

  String? isChannelEmpty() {
    if (this == null) {
      return Validation.shared.messages['channel_error'];
    }
    return null;
  }

  String? isCityEmpty() {
    if (this == null) {
      return Validation.shared.messages['city_error'];
    }
    return null;
  }

  String? isHouseTypeEmpty() {
    if (this == null) {
      return Validation.shared.messages['house_type_error'];
    }
    return null;
  }
}
