class EnvironmentVariables {
  final String webSocketUrl;

  EnvironmentVariables._({
    required this.webSocketUrl,
  });

  factory EnvironmentVariables.staging() {
    return EnvironmentVariables._(
      webSocketUrl: "wss://stream.binance.com:9443/ws/",
    );
  }

  //todo: set PROD values when available
  factory EnvironmentVariables.production() {
    return EnvironmentVariables._(
      webSocketUrl: "",
    );
  }
}
