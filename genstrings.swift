#!/usr/bin/swift

import Foundation

let fileManager = NSFileManager.defaultManager()
let acceptedFileExtensions = ["swift", "m"]

class GenStrings {
    
    func begin() {
        print("Searching for source files")
        let rootPath = NSURL(fileURLWithPath:fileManager.currentDirectoryPath)
        let allFiles = fetchFilesInFolder(rootPath)
        print("Found \(allFiles.count) files")
    }
    
    func fetchFilesInFolder(rootPath: NSURL) -> [NSURL] {
        var files = [NSURL]()
        do {
            let directoryContents = try fileManager.contentsOfDirectoryAtURL(rootPath, includingPropertiesForKeys: [], options: .SkipsHiddenFiles)
            for urlPath in directoryContents {
                if let stringPath = urlPath.path {
                    var isDir : ObjCBool = false
                    if fileManager.fileExistsAtPath(stringPath, isDirectory:&isDir) {
                        if isDir {
                            let dirFiles = fetchFilesInFolder(urlPath)
                            files.appendContentsOf(dirFiles)
                        } else {
                            if let pathExtension = urlPath.pathExtension {
                                if acceptedFileExtensions.contains(pathExtension) {
                                    files.append(urlPath)
                                }
                            }
                        }
                    }
                    
                }
            }
        } catch {}
        return files
    }
}

let genStrings = GenStrings()
genStrings.begin()


