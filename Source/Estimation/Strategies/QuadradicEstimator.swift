import Foundation

public class QuadradicEstimator: EstimationAware {

  public func estimateLocation(transformResult: TransformResult, sampleRate: Float) throws -> Int {
    let buffer = transformResult.buffer
    let maxIndex = try maxBufferIndex(buffer)

    let y2 = abs(buffer[maxIndex])
    let y1 = maxIndex == 0 ? y2 : abs(buffer[maxIndex - 1])
    let y3 = maxIndex == buffer.count - 1 ? y2 : abs(buffer[maxIndex + 1])
    let d = (y3 - y1) / (2 * (2 * y2 - y1 - y3))
    let location = maxIndex + Int(round(d))

    return sanitize(location, reserveLocation: maxIndex, buffer: buffer)
  }
}
