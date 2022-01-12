int? convertToInteger(value) {
  try {
    if ((value is! int) && (value is! double) && (value is! bool) && (value is! String)) {
      throw FormatException('error to convert $value to bool');
    }
    if (value is int) return value;
    if (value is double) return num.parse(value.toString()).toInt();
    if (value is bool) {
      if (value == false) {
        return 0;
      } else {
        return 1;
      }
    }
    if (value is String) {
      try {
        if (value.toUpperCase() == 'FALSE') return 0;
        if (value.toUpperCase() == 'TRUE') return 1;
        var resultado = num.parse(value).toInt();
        return resultado;
      } catch (e) {
        throw FormatException('error to convert a String $value to int');
      }
    }
  } catch (e) {
    throw FormatException('error to convert $value to int');
  }
}

bool? convertToBool(value) {
  try {
    if ((value is! int) && (value is! String)) {
      throw FormatException('error to convert $value to bool');
    }
    if (value is int) {
      if (value == 0) {
        return false;
      } else {
        if (value == 1) {
          return true;
        } else {
          throw FormatException('error to convert a int $value to bool');
        }
      }
    }
    if (value is String) {
      try {
        if (value == '0') return false;
        if (value == '1') return true;
        if (value.toUpperCase() == 'FALSE') {
          return false;
        } else {
          if (value.toUpperCase() == 'TRUE') {
            return true;
          } else {
            throw FormatException('error to convert a String $value to bool');
          }
        }
      } catch (e) {
        throw FormatException('error to convert a String $value to bool');
      }
    }
  } catch (e) {
    throw FormatException('error to convert $value to bool');
  }
}

double? convertToDouble(value) {
  try {
    if ((value is! int) && (value is! double) && (value is! String)) {
      throw FormatException('error to convert $value to double');
    }
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) {
      try {
        var resultado = num.parse(value).toDouble();
        return resultado;
      } catch (e) {
        throw FormatException('error to convert a String $value to double');
      }
    }
  } catch (e) {
    throw FormatException('error to convert $value to double');
  }
}

String convertToString(value) {
  try {
    return value.toString();
  } catch (e) {
    throw FormatException('error to convert $value to String');
  }
}
