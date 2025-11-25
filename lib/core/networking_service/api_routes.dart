class ApiRoutes {
  static const getBtcBloc = "${ApiBaseUrls.btcBaseUrl}/latestblock";
  static getBtcTransactionById(String hashId) =>
      "${ApiBaseUrls.btcBaseUrl}/rawblock/$hashId";
  static const gettzktBloc = "${ApiBaseUrls.tzktBaseUrl}/blocks";
}

class ApiBaseUrls {
  static const btcBaseUrl = "https://blockchain.info";
  static const tzktBaseUrl = "https://api.tzkt.io/v1";
}
