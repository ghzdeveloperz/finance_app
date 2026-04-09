class RetryPolicy {
  final int maxRetries;

  const RetryPolicy({
    this.maxRetries = 2,
  });
}