//
//  Zipper.swift
//  WalleTon
//
//  Created by Arseni Laputska on 24.03.23.
//

import Foundation
import zlib

class Zipper {
    
//    func isGzippedData(_ data: NSData) -> Bool {
//        let bytes = UnsafeRawPointer<UInt8>(data.bytes)
//        return (data.length >= 2  && bytes[0] == 0x1f && bytes[1] == 0x8b)
//    }
    
    func gzipData(_ data: NSData, _ level: Float) -> NSData {
//        if (data.length == 0 || isGzippedData(data)) {
//            return data
//        }
        
        var stream = z_stream()
        stream.zalloc = nil
        stream.zfree = nil
        stream.opaque = nil
        stream.avail_in = uInt(data.length)
        stream.next_in = UnsafeMutableRawPointer(mutating: data.bytes).assumingMemoryBound(to: Bytef.self)
        stream.total_out = 0
        stream.avail_out = 0
        
        let chunkSize: NSInteger = 16384
        
        var output: NSMutableData? = nil
        
        let compression: Int32 = (level < 0.0) ? Z_DEFAULT_COMPRESSION : Int32(roundf(level * 9))
        
        if (deflateInit2_(&stream, compression, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY, ZLIB_VERSION, Int32(MemoryLayout<z_stream>.size)) == Z_OK) {
            output = NSMutableData(length: chunkSize)
            while (stream.avail_out == 0) {
                if (stream.total_out >= output?.length ?? 0) {
                    output?.length += chunkSize
                }
                stream.next_out = output?.mutableBytes.advanced(by: Int(stream.total_out)).bindMemory(to: UInt8.self, capacity: (output?.count ?? 0) - Int(stream.total_out))
                stream.avail_out = uInt((output?.length ?? 0) - Int(stream.total_out))
                deflate(&stream, Z_FINISH)
            }
            deflateEnd(&stream)
            output?.length = Int(stream.total_out)
        }
        
        return output ?? NSMutableData()
    }
    
    func gunzipData(_ data: NSData, _ sizeLimit: UInt) -> NSData? {
//        if (data.length == 0 || isGzippedData(data)) {
//            return nil
//        }
        
        var stream = z_stream()
        stream.zalloc = nil
        stream.zfree = nil
        stream.avail_in = uInt(data.length)
        stream.next_in = UnsafeMutableRawPointer(mutating: data.bytes).assumingMemoryBound(to: Bytef.self)
        stream.total_out = 0
        stream.avail_out = 0
        
        var output: NSMutableData? = nil
        
        if (inflateInit2_(&stream, 47, ZLIB_VERSION, Int32(MemoryLayout<z_stream>.size)) == Z_OK) {
            var status = Z_OK
            output = NSMutableData(capacity: data.length * 2)
            
            while (status == Z_OK) {
                if (sizeLimit > 0 && stream.total_out > sizeLimit) {
                    return nil
                }
                
                if (stream.total_out >= output?.length ?? 0) {
                    output?.length = (output?.length ?? 0) + data.length / 2
                }
                stream.next_out = output?.mutableBytes.advanced(by: Int(stream.total_out)).bindMemory(to: UInt8.self, capacity: (output?.count ?? 0) - Int(stream.total_out))
                stream.avail_out = uInt((output?.length ?? 0) - Int(stream.total_out))
                status = inflate(&stream, Z_SYNC_FLUSH)
            }
            
            if (inflateEnd(&stream) == Z_OK) {
                if (status == Z_STREAM_END) {
                    output?.length = Int(stream.total_out)
                } else if (sizeLimit > 0 && output?.length ?? 0 > sizeLimit) {
                    return nil
                }
            }
        }
        
        return output
    }
    
}
