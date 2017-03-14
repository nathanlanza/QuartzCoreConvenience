import QuartzCore

extension CAMediaTimingFunction {
    static var linear: CAMediaTimingFunction { return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear) }
        static var easeIn: CAMediaTimingFunction { return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn) }
        static var easeOut: CAMediaTimingFunction { return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) }
        static var easeInEaseOut: CAMediaTimingFunction { return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut) }
        static var `default`: CAMediaTimingFunction { return CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault) }
}

enum FillModeType {
    case forwards
    case backwards
    case both
    case removed
    
}

extension CAAnimation {
    var fillModeType: FillModeType {
        set {
            switch newValue {
            case .forwards: fillMode = kCAFillModeForwards
            case .backwards: fillMode = kCAFillModeBackwards
            case .removed: fillMode = kCAFillModeRemoved
            case .both: fillMode = kCAFillModeBoth
            }
        }
        get {
            switch fillMode {
            case kCAFillModeForwards: return .forwards
            case kCAFillModeBackwards: return .backwards
            case kCAFillModeRemoved: return .removed
            case kCAFillModeBoth: return .both
            default: fatalError("'fillMode' is set to an unknown FillModeType")
            }
        }
    }
}

extension CATransform3D {
    var isAffine: Bool { return CATransform3DIsAffine(self) }
    static var identity: CATransform3D { return CATransform3DIdentity }
    var affineTransform: CGAffineTransform { return CATransform3DGetAffineTransform(self) }
    
    static func makeAffineTransform(_ affineTransform: CGAffineTransform) -> CATransform3D {
        return CATransform3DMakeAffineTransform(affineTransform)
    }
    static func makeTranslation(tx: CGFloat, ty: CGFloat, tz: CGFloat) -> CATransform3D {
        return CATransform3DMakeTranslation(tx, ty, tz)
    }
    static func makeScale(sx: CGFloat, sy: CGFloat, sz: CGFloat) -> CATransform3D {
        return CATransform3DMakeScale(sx, sy, sz)
    }
    static func makeRotation(angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) -> CATransform3D {
        return CATransform3DMakeRotation(angle, x, y, z)
    }
    
    mutating func translate(tx: CGFloat, ty: CGFloat, tz: CGFloat) {
        self = CATransform3DTranslate(self, tx, ty, tz)
    }
    func translated(tx: CGFloat, ty: CGFloat, tz: CGFloat) -> CATransform3D {
        return CATransform3DTranslate(self, tx, ty, tz)
    }
    
    mutating func scale(sx: CGFloat, sy: CGFloat, sz: CGFloat) {
        self = CATransform3DScale(self, sx, sy, sz)
    }
    func scaled(sx: CGFloat, sy: CGFloat, sz: CGFloat) -> CATransform3D {
        return CATransform3DScale(self, sx, sy, sz)
    }
    
    mutating func rotate(angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) {
        self = CATransform3DRotate(self, angle, x, y, z)
    }
    func rotated(angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) -> CATransform3D {
        return CATransform3DRotate(self, angle, x, y, z)
    }
    
    mutating func concatenate(_ other: CATransform3D) {
        self = CATransform3DConcat(self, other)
    }
    func concatenated(_ other: CATransform3D) -> CATransform3D {
        return CATransform3DConcat(self, other)
    }
    
    mutating func invert() {
        self = CATransform3DInvert(self)
    }
    func inverted() -> CATransform3D {
        return CATransform3DInvert(self)
    }
}

extension CATransform3D: Equatable {
    public static func ==(lhs: CATransform3D, rhs: CATransform3D) -> Bool {
        return CATransform3DEqualToTransform(lhs, rhs)
    }
        
}

