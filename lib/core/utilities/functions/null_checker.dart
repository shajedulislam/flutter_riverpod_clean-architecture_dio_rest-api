bool isNull(dynamic value) {
  if ([null, '', "", 'null', {}, [], "Null"].contains(value)) {
    return true;
  } else {
    return false;
  }
}

nullify(dynamic data) {
  if ([null, '', 'null', {}, [], "Null"].contains(data)) {
    return null;
  } else {
    return data;
  }
}
