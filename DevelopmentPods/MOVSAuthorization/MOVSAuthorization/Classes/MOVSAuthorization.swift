
import Alamofire

public enum TypeAuth: String {
    case bearer = "Bearer "
    case token = "Token "
    case noToken = ""
}

public class MOVSAuthorization {
    
    private let typeAuthorizationTokenn: TypeAuth
    private let session: Session
    public init(typeAuth: TypeAuth) {
        let configuration = URLSessionConfiguration.af.default

        self.session = Session(configuration: configuration, interceptor: AlamofireEnvironmentInterceptor())
        self.typeAuthorizationTokenn = typeAuth
    }

}

public struct AlamofireEnvironmentInterceptor: RequestInterceptor {
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
    }
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))

    }
}
