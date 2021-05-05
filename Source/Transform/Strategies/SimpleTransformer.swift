import AVFoundation

public final class SimpleTransformer: Transformer {
  enum SimpleTransformerError: Error {
    case floatChannelDataIsNil
  }

  public func transform(buffer: AVAudioPCMBuffer) throws -> Buffer {
    guard let pointer = buffer.floatChannelData else {
      throw SimpleTransformerError.floatChannelDataIsNil
    }

    let elements = Array.fromUnsafePointer(pointer.pointee, count:Int(buffer.frameLength))
    return Buffer(elements: elements)
  }
}
