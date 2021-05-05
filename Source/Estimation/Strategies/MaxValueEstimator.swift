public final class MaxValueEstimator: LocationEstimator {
  public func estimateLocation(buffer: Buffer) throws -> Int {
    return try maxBufferIndex(from: buffer.elements)
  }
}
