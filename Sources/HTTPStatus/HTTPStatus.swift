import Foundation

public protocol HTTPStatusCode: Hashable, CaseIterable, RawRepresentable where RawValue == Int {
	
	var message: String { get }
	
}

public enum HTTPStatusCodes {
	
	public enum Information: Int {
		case `continue`						= 100
		case switching						= 101
		case processing						= 102
		case earlyHints						= 103
	}
	
	public enum Success: Int {
		case ok								= 200
		case created						= 201
		case accepted						= 202
		case nonauthoritativeInformation	= 203
		case noContent						= 204
		case resetContent					= 205
		case partialContent					= 206
		case multiStatus					= 207
		case alreadyReported				= 208
		case imUsed							= 226
	}
	
	public enum Redirection: Int {
		case multipleChoices				= 300
		case movedPermanently				= 301
		case found							= 302
		case seeOther						= 303
		case notModified					= 304
		case useProxy						= 305
		case temporaryRedirect				= 307
		case permanentRedirect				= 308
		
	}
	
	public enum ClientError: Int {
		case badRequest						= 400
		case unauthorized					= 401
		case paymentRequired				= 402
		case forbidden						= 403
		case notFound						= 404
		case methodNotAllowed				= 405
		case notAcceptable					= 406
		case proxyAuthentication			= 407
		case requestTimeout					= 408
		case conflict						= 409
		case gone							= 410
		case lengthRequired					= 411
		case preconditionFailed				= 412
		case payloadTooLarge				= 413
		case uriTooLong						= 414
		case unsupportedMediaType			= 415
		case rangeNotSatisfiable			= 416
		case expectationFailed				= 417
		case imATeapot						= 418
		case misdirectedRequest				= 421
		case unprocessableEntity			= 422
		case locked							= 423
		case failedDependency				= 424
		case tooEarly						= 425
		case upgradeRequired				= 426
		case preconditionRequired			= 428
		case tooManyRequests				= 429
		case requestHeaderFieldsTooLarge	= 431
		case unavailableForLegalReasons		= 451
	}
	
	public enum ServerError: Int {
		case internalServerError			= 500
		case notImplemented					= 501
		case badGateway						= 502
		case serviceUnavailable				= 503
		case gatewayTimeout					= 504
		case httpVersionNotSupported		= 505
		case variantAlsoNegotiable			= 506
		case insufficientStorage			= 507
		case loopDetected					= 508
		case notExtended					= 510
		case networkAuthenticationRequired	= 511
	}
	
	public static let informationStatusCodes: [any HTTPStatusCode] = Information.allCases
	
	public static let successStatusCodes: [any HTTPStatusCode] = Success.allCases
	
	public static let errorStatusCodes: [any HTTPStatusCode] = ClientError.allCases + ServerError.allCases
	
	public static let webdavStatusCodes: [any HTTPStatusCode] = [
		Information.processing,
		Success.multiStatus,
		Success.alreadyReported,
		ClientError.unprocessableEntity,
		ClientError.locked,
		ClientError.failedDependency,
		ServerError.insufficientStorage,
		ServerError.loopDetected
	]
	
	public static let experimentalStatusCodes: [any HTTPStatusCode] = [
		ClientError.paymentRequired,
		ClientError.tooEarly
	]
	
	public static func statusCode(_ rawValue: Int) -> (any HTTPStatusCode)? {
		if let statusCode = Information(rawValue: rawValue) {
			return statusCode
		} else if let statusCode = Success(rawValue: rawValue) {
			return statusCode
		} else if let statusCode = Redirection(rawValue: rawValue) {
			return statusCode
		} else if let statusCode = ClientError(rawValue: rawValue) {
			return statusCode
		} else if let statusCode = ServerError(rawValue: rawValue) {
			return statusCode
		} else {
			return nil
		}
	}
	
}

extension HTTPStatusCodes.Information: HTTPStatusCode {
	
	public var message: String {
		get {
			switch self {
			case .continue:
				return "Continue"
			case .switching:
				return "Switching"
			case .processing:
				return "Processing"
			case .earlyHints:
				return "Early Hints"
			}
		}
	}
	
}

extension HTTPStatusCodes.Success: HTTPStatusCode {
	
	public var message: String {
		get {
			switch self {
			case .ok:
				return "OK"
			case .created:
				return "Created"
			case .accepted:
				return "Accepted"
			case .nonauthoritativeInformation:
				return "Non-Authoritative Information"
			case .noContent:
				return "No Content"
			case .resetContent:
				return "Reset Content"
			case .partialContent:
				return "Partial Content"
			case .multiStatus:
				return "Multi-Status"
			case .alreadyReported:
				return "Already Reported"
			case .imUsed:
				return "IM Used"
			}
		}
	}
	
}

extension HTTPStatusCodes.Redirection: HTTPStatusCode {
	
	public var message: String {
		get {
			switch self {
			case .multipleChoices:
				return "Multiple Choices"
			case .movedPermanently:
				return "Moved Permanently"
			case .found:
				return "Found"
			case .seeOther:
				return "See Other"
			case .notModified:
				return "Not Modified"
			case .useProxy:
				return "Use Proxy"
			case .temporaryRedirect:
				return "Temporary Redirect"
			case .permanentRedirect:
				return "Permanent Redirect"
			}
		}
	}
	
}

extension HTTPStatusCodes.ClientError: LocalizedError, HTTPStatusCode {
	
	public var message: String {
		get {
			switch self {
			case .badRequest:
				return "Bad Request"
			case .unauthorized:
				return "Unauthorized"
			case .paymentRequired:
				return "Payment Required"
			case .forbidden:
				return "Forbidden"
			case .notFound:
				return "Not Found"
			case .methodNotAllowed:
				return "Method Not Allowed"
			case .notAcceptable:
				return "Not Acceptable"
			case .proxyAuthentication:
				return "Proxy Authentication"
			case .requestTimeout:
				return "Request Timeout"
			case .conflict:
				return "Conflict"
			case .gone:
				return "Gone"
			case .lengthRequired:
				return "Length Required"
			case .preconditionFailed:
				return "Precondition Failed"
			case .payloadTooLarge:
				return "Payload Too Large"
			case .uriTooLong:
				return "URI Too Long"
			case .unsupportedMediaType:
				return "Unsupported Media Type"
			case .rangeNotSatisfiable:
				return "Range Not Satisfiable"
			case .expectationFailed:
				return "Expectation Failed"
			case .imATeapot:
				return "I’m a Teapot"
			case .misdirectedRequest:
				return "Misdirected Request"
			case .unprocessableEntity:
				return "Unprocessable Entity"
			case .locked:
				return "Locked"
			case .failedDependency:
				return "Failed Dependency"
			case .tooEarly:
				return "Too Early"
			case .upgradeRequired:
				return "Upgrade Required"
			case .preconditionRequired:
				return "Precondition Required"
			case .tooManyRequests:
				return "Too Many Requests"
			case .requestHeaderFieldsTooLarge:
				return "Request Header Fields Too Large"
			case .unavailableForLegalReasons:
				return "Unavailable for Legal Reasons"
			}
		}
	}
	
	public var localizedDescription: String {
		get {
			return "HTTP \(self.rawValue) \(self.message)"
		}
	}
	
	public var errorDescription: String? {
		get {
			return "An HTTP client error occurred: “\(self.message)”."
		}
	}
	
}

extension HTTPStatusCodes.ServerError: LocalizedError, HTTPStatusCode {
	
	public var message: String {
		get {
			switch self {
			case .internalServerError:
				return "Internal Server Error"
			case .notImplemented:
				return "Not Implemented"
			case .badGateway:
				return "Bad Gateway"
			case .serviceUnavailable:
				return "Service Unavailable"
			case .gatewayTimeout:
				return "Gateway Timeout"
			case .httpVersionNotSupported:
				return "HTTP Version Not Supported"
			case .variantAlsoNegotiable:
				return "Variant Also Negotiable"
			case .insufficientStorage:
				return "Insufficient Storage"
			case .loopDetected:
				return "Loop Detected"
			case .notExtended:
				return "Not Extended"
			case .networkAuthenticationRequired:
				return "Network Authentication Required"
			}
		}
	}
	
	public var localizedDescription: String {
		get {
			return "HTTP \(self.rawValue) \(self.message)"
		}
	}
	
	public var errorDescription: String? {
		get {
			return "An HTTP server error occurred: “\(self.message)”."
		}
	}
	
}
