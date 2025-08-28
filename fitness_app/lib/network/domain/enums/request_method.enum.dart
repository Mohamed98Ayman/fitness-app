enum HttpRequestMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  patch('PATCH'),
  delete('DELETE');

  const HttpRequestMethod(this.name);
  final String name;
}
