mixin BasePurchaseApiMixin<DetailsResponse, Purchase> {
  Future<DetailsResponse> getDetails({
    required Set<String> productIds,
  });

  Future<bool> get isAvailable;

  Future<void> get restorePurchases;

  Stream<List<Purchase>?> get purchasesStream;

  Future<void> completePurchase(Purchase purchaseDetails);
}
