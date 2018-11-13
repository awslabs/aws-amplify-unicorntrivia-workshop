//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateAnswerInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap
    
    public init(username: String, answer: Optional<[Int?]?> = nil) {
        graphQLMap = ["username": username, "answer": answer]
    }
    
    public var username: String {
        get {
            return graphQLMap["username"] as! String
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "username")
        }
    }
    
    public var answer: Optional<[Int?]?> {
        get {
            return graphQLMap["answer"] as! Optional<[Int?]?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "answer")
        }
    }
}

public struct UpdateAnswerInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap
    
    public init(id: GraphQLID, username: Optional<String?> = nil, answer: Optional<[Int?]?> = nil) {
        graphQLMap = ["id": id, "username": username, "answer": answer]
    }
    
    public var id: GraphQLID {
        get {
            return graphQLMap["id"] as! GraphQLID
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "id")
        }
    }
    
    public var username: Optional<String?> {
        get {
            return graphQLMap["username"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "username")
        }
    }
    
    public var answer: Optional<[Int?]?> {
        get {
            return graphQLMap["answer"] as! Optional<[Int?]?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "answer")
        }
    }
}

public struct ModelAnswerFilterInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap
    
    public init(id: Optional<ModelIDFilterInput?> = nil, username: Optional<ModelStringFilterInput?> = nil, answer: Optional<ModelIntFilterInput?> = nil, and: Optional<[ModelAnswerFilterInput?]?> = nil, or: Optional<[ModelAnswerFilterInput?]?> = nil, not: Optional<ModelAnswerFilterInput?> = nil) {
        graphQLMap = ["id": id, "username": username, "answer": answer, "and": and, "or": or, "not": not]
    }
    
    public var id: Optional<ModelIDFilterInput?> {
        get {
            return graphQLMap["id"] as! Optional<ModelIDFilterInput?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "id")
        }
    }
    
    public var username: Optional<ModelStringFilterInput?> {
        get {
            return graphQLMap["username"] as! Optional<ModelStringFilterInput?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "username")
        }
    }
    
    public var answer: Optional<ModelIntFilterInput?> {
        get {
            return graphQLMap["answer"] as! Optional<ModelIntFilterInput?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "answer")
        }
    }
    
    public var and: Optional<[ModelAnswerFilterInput?]?> {
        get {
            return graphQLMap["and"] as! Optional<[ModelAnswerFilterInput?]?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "and")
        }
    }
    
    public var or: Optional<[ModelAnswerFilterInput?]?> {
        get {
            return graphQLMap["or"] as! Optional<[ModelAnswerFilterInput?]?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "or")
        }
    }
    
    public var not: Optional<ModelAnswerFilterInput?> {
        get {
            return graphQLMap["not"] as! Optional<ModelAnswerFilterInput?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "not")
        }
    }
}

public struct ModelIDFilterInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap
    
    public init(ne: Optional<GraphQLID?> = nil, eq: Optional<GraphQLID?> = nil, le: Optional<GraphQLID?> = nil, lt: Optional<GraphQLID?> = nil, ge: Optional<GraphQLID?> = nil, gt: Optional<GraphQLID?> = nil, contains: Optional<GraphQLID?> = nil, notContains: Optional<GraphQLID?> = nil, between: Optional<[GraphQLID?]?> = nil, beginsWith: Optional<GraphQLID?> = nil) {
        graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
    }
    
    public var ne: Optional<GraphQLID?> {
        get {
            return graphQLMap["ne"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "ne")
        }
    }
    
    public var eq: Optional<GraphQLID?> {
        get {
            return graphQLMap["eq"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "eq")
        }
    }
    
    public var le: Optional<GraphQLID?> {
        get {
            return graphQLMap["le"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "le")
        }
    }
    
    public var lt: Optional<GraphQLID?> {
        get {
            return graphQLMap["lt"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "lt")
        }
    }
    
    public var ge: Optional<GraphQLID?> {
        get {
            return graphQLMap["ge"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "ge")
        }
    }
    
    public var gt: Optional<GraphQLID?> {
        get {
            return graphQLMap["gt"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "gt")
        }
    }
    
    public var contains: Optional<GraphQLID?> {
        get {
            return graphQLMap["contains"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "contains")
        }
    }
    
    public var notContains: Optional<GraphQLID?> {
        get {
            return graphQLMap["notContains"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "notContains")
        }
    }
    
    public var between: Optional<[GraphQLID?]?> {
        get {
            return graphQLMap["between"] as! Optional<[GraphQLID?]?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "between")
        }
    }
    
    public var beginsWith: Optional<GraphQLID?> {
        get {
            return graphQLMap["beginsWith"] as! Optional<GraphQLID?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "beginsWith")
        }
    }
}

public struct ModelStringFilterInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap
    
    public init(ne: Optional<String?> = nil, eq: Optional<String?> = nil, le: Optional<String?> = nil, lt: Optional<String?> = nil, ge: Optional<String?> = nil, gt: Optional<String?> = nil, contains: Optional<String?> = nil, notContains: Optional<String?> = nil, between: Optional<[String?]?> = nil, beginsWith: Optional<String?> = nil) {
        graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
    }
    
    public var ne: Optional<String?> {
        get {
            return graphQLMap["ne"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "ne")
        }
    }
    
    public var eq: Optional<String?> {
        get {
            return graphQLMap["eq"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "eq")
        }
    }
    
    public var le: Optional<String?> {
        get {
            return graphQLMap["le"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "le")
        }
    }
    
    public var lt: Optional<String?> {
        get {
            return graphQLMap["lt"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "lt")
        }
    }
    
    public var ge: Optional<String?> {
        get {
            return graphQLMap["ge"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "ge")
        }
    }
    
    public var gt: Optional<String?> {
        get {
            return graphQLMap["gt"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "gt")
        }
    }
    
    public var contains: Optional<String?> {
        get {
            return graphQLMap["contains"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "contains")
        }
    }
    
    public var notContains: Optional<String?> {
        get {
            return graphQLMap["notContains"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "notContains")
        }
    }
    
    public var between: Optional<[String?]?> {
        get {
            return graphQLMap["between"] as! Optional<[String?]?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "between")
        }
    }
    
    public var beginsWith: Optional<String?> {
        get {
            return graphQLMap["beginsWith"] as! Optional<String?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "beginsWith")
        }
    }
}

public struct ModelIntFilterInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap
    
    public init(ne: Optional<Int?> = nil, eq: Optional<Int?> = nil, le: Optional<Int?> = nil, lt: Optional<Int?> = nil, ge: Optional<Int?> = nil, gt: Optional<Int?> = nil, contains: Optional<Int?> = nil, notContains: Optional<Int?> = nil, between: Optional<[Int?]?> = nil) {
        graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between]
    }
    
    public var ne: Optional<Int?> {
        get {
            return graphQLMap["ne"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "ne")
        }
    }
    
    public var eq: Optional<Int?> {
        get {
            return graphQLMap["eq"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "eq")
        }
    }
    
    public var le: Optional<Int?> {
        get {
            return graphQLMap["le"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "le")
        }
    }
    
    public var lt: Optional<Int?> {
        get {
            return graphQLMap["lt"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "lt")
        }
    }
    
    public var ge: Optional<Int?> {
        get {
            return graphQLMap["ge"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "ge")
        }
    }
    
    public var gt: Optional<Int?> {
        get {
            return graphQLMap["gt"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "gt")
        }
    }
    
    public var contains: Optional<Int?> {
        get {
            return graphQLMap["contains"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "contains")
        }
    }
    
    public var notContains: Optional<Int?> {
        get {
            return graphQLMap["notContains"] as! Optional<Int?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "notContains")
        }
    }
    
    public var between: Optional<[Int?]?> {
        get {
            return graphQLMap["between"] as! Optional<[Int?]?>
        }
        set {
            graphQLMap.updateValue(newValue, forKey: "between")
        }
    }
}

public final class CreateAnswerMutation: GraphQLMutation {
    public static let operationString =
    "mutation CreateAnswer($input: CreateAnswerInput!) {\n  createAnswer(input: $input) {\n    __typename\n    id\n    username\n  }\n}"
    
    public var input: CreateAnswerInput
    
    public init(input: CreateAnswerInput) {
        self.input = input
    }
    
    public var variables: GraphQLMap? {
        return ["input": input]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Mutation"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("createAnswer", arguments: ["input": GraphQLVariable("input")], type: .object(CreateAnswer.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(createAnswer: CreateAnswer? = nil) {
            self.init(snapshot: ["__typename": "Mutation", "createAnswer": createAnswer.flatMap { $0.snapshot }])
        }
        
        public var createAnswer: CreateAnswer? {
            get {
                return (snapshot["createAnswer"] as? Snapshot).flatMap { CreateAnswer(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "createAnswer")
            }
        }
        
        public struct CreateAnswer: GraphQLSelectionSet {
            public static let possibleTypes = ["Answer"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, username: String) {
                self.init(snapshot: ["__typename": "Answer", "id": id, "username": username])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var username: String {
                get {
                    return snapshot["username"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "username")
                }
            }
        }
    }
}

public final class UpdateAnswerMutation: GraphQLMutation {
    public static let operationString =
    "mutation UpdateAnswer($input: UpdateAnswerInput!) {\n  updateAnswer(input: $input) {\n    __typename\n    id\n    username\n    answer\n  }\n}"
    
    public var input: UpdateAnswerInput
    
    public init(input: UpdateAnswerInput) {
        self.input = input
    }
    
    public var variables: GraphQLMap? {
        return ["input": input]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Mutation"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("updateAnswer", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateAnswer.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(updateAnswer: UpdateAnswer? = nil) {
            self.init(snapshot: ["__typename": "Mutation", "updateAnswer": updateAnswer.flatMap { $0.snapshot }])
        }
        
        public var updateAnswer: UpdateAnswer? {
            get {
                return (snapshot["updateAnswer"] as? Snapshot).flatMap { UpdateAnswer(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "updateAnswer")
            }
        }
        
        public struct UpdateAnswer: GraphQLSelectionSet {
            public static let possibleTypes = ["Answer"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("answer", type: .list(.scalar(Int.self))),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, username: String, answer: [Int?]? = nil) {
                self.init(snapshot: ["__typename": "Answer", "id": id, "username": username, "answer": answer])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var username: String {
                get {
                    return snapshot["username"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "username")
                }
            }
            
            public var answer: [Int?]? {
                get {
                    return snapshot["answer"] as? [Int?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answer")
                }
            }
        }
    }
}

public final class GetQuestionQuery: GraphQLQuery {
    public static let operationString =
    "query GetQuestion($id: ID!) {\n  getQuestion(id: $id) {\n    __typename\n    id\n    question\n    answers\n    answerId\n  }\n}"
    
    public var id: GraphQLID
    
    public init(id: GraphQLID) {
        self.id = id
    }
    
    public var variables: GraphQLMap? {
        return ["id": id]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("getQuestion", arguments: ["id": GraphQLVariable("id")], type: .object(GetQuestion.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(getQuestion: GetQuestion? = nil) {
            self.init(snapshot: ["__typename": "Query", "getQuestion": getQuestion.flatMap { $0.snapshot }])
        }
        
        public var getQuestion: GetQuestion? {
            get {
                return (snapshot["getQuestion"] as? Snapshot).flatMap { GetQuestion(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "getQuestion")
            }
        }
        
        public struct GetQuestion: GraphQLSelectionSet {
            public static let possibleTypes = ["Question"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("question", type: .nonNull(.scalar(String.self))),
                GraphQLField("answers", type: .nonNull(.list(.scalar(String.self)))),
                GraphQLField("answerId", type: .scalar(Int.self)),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, question: String, answers: [String?], answerId: Int? = nil) {
                self.init(snapshot: ["__typename": "Question", "id": id, "question": question, "answers": answers, "answerId": answerId])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var question: String {
                get {
                    return snapshot["question"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "question")
                }
            }
            
            public var answers: [String?] {
                get {
                    return snapshot["answers"]! as! [String?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answers")
                }
            }
            
            public var answerId: Int? {
                get {
                    return snapshot["answerId"] as? Int
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answerId")
                }
            }
        }
    }
}

public final class GetAnswerQuery: GraphQLQuery {
    public static let operationString =
    "query GetAnswer($id: ID!) {\n  getAnswer(id: $id) {\n    __typename\n    id\n    username\n    answer\n  }\n}"
    
    public var id: GraphQLID
    
    public init(id: GraphQLID) {
        self.id = id
    }
    
    public var variables: GraphQLMap? {
        return ["id": id]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("getAnswer", arguments: ["id": GraphQLVariable("id")], type: .object(GetAnswer.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(getAnswer: GetAnswer? = nil) {
            self.init(snapshot: ["__typename": "Query", "getAnswer": getAnswer.flatMap { $0.snapshot }])
        }
        
        public var getAnswer: GetAnswer? {
            get {
                return (snapshot["getAnswer"] as? Snapshot).flatMap { GetAnswer(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "getAnswer")
            }
        }
        
        public struct GetAnswer: GraphQLSelectionSet {
            public static let possibleTypes = ["Answer"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("answer", type: .list(.scalar(Int.self))),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, username: String, answer: [Int?]? = nil) {
                self.init(snapshot: ["__typename": "Answer", "id": id, "username": username, "answer": answer])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var username: String {
                get {
                    return snapshot["username"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "username")
                }
            }
            
            public var answer: [Int?]? {
                get {
                    return snapshot["answer"] as? [Int?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answer")
                }
            }
        }
    }
}

public final class ListAnswersQuery: GraphQLQuery {
    public static let operationString =
    "query ListAnswers($filter: ModelAnswerFilterInput, $limit: Int, $nextToken: String) {\n  listAnswers(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      username\n      answer\n    }\n    nextToken\n  }\n}"
    
    public var filter: ModelAnswerFilterInput?
    public var limit: Int?
    public var nextToken: String?
    
    public init(filter: ModelAnswerFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
        self.filter = filter
        self.limit = limit
        self.nextToken = nextToken
    }
    
    public var variables: GraphQLMap? {
        return ["filter": filter, "limit": limit, "nextToken": nextToken]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Query"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("listAnswers", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListAnswer.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(listAnswers: ListAnswer? = nil) {
            self.init(snapshot: ["__typename": "Query", "listAnswers": listAnswers.flatMap { $0.snapshot }])
        }
        
        public var listAnswers: ListAnswer? {
            get {
                return (snapshot["listAnswers"] as? Snapshot).flatMap { ListAnswer(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "listAnswers")
            }
        }
        
        public struct ListAnswer: GraphQLSelectionSet {
            public static let possibleTypes = ["ModelAnswerConnection"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("items", type: .list(.object(Item.selections))),
                GraphQLField("nextToken", type: .scalar(String.self)),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(items: [Item?]? = nil, nextToken: String? = nil) {
                self.init(snapshot: ["__typename": "ModelAnswerConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var items: [Item?]? {
                get {
                    return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
                }
                set {
                    snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
                }
            }
            
            public var nextToken: String? {
                get {
                    return snapshot["nextToken"] as? String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "nextToken")
                }
            }
            
            public struct Item: GraphQLSelectionSet {
                public static let possibleTypes = ["Answer"]
                
                public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("username", type: .nonNull(.scalar(String.self))),
                    GraphQLField("answer", type: .list(.scalar(Int.self))),
                    ]
                
                public var snapshot: Snapshot
                
                public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                }
                
                public init(id: GraphQLID, username: String, answer: [Int?]? = nil) {
                    self.init(snapshot: ["__typename": "Answer", "id": id, "username": username, "answer": answer])
                }
                
                public var __typename: String {
                    get {
                        return snapshot["__typename"]! as! String
                    }
                    set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                    }
                }
                
                public var id: GraphQLID {
                    get {
                        return snapshot["id"]! as! GraphQLID
                    }
                    set {
                        snapshot.updateValue(newValue, forKey: "id")
                    }
                }
                
                public var username: String {
                    get {
                        return snapshot["username"]! as! String
                    }
                    set {
                        snapshot.updateValue(newValue, forKey: "username")
                    }
                }
                
                public var answer: [Int?]? {
                    get {
                        return snapshot["answer"] as? [Int?]
                    }
                    set {
                        snapshot.updateValue(newValue, forKey: "answer")
                    }
                }
            }
        }
    }
}

public final class OnCreateQuestionSubscription: GraphQLSubscription {
    public static let operationString =
    "subscription OnCreateQuestion {\n  onCreateQuestion {\n    __typename\n    id\n    question\n    answers\n  }\n}"
    
    public init() {
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Subscription"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("onCreateQuestion", type: .object(OnCreateQuestion.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(onCreateQuestion: OnCreateQuestion? = nil) {
            self.init(snapshot: ["__typename": "Subscription", "onCreateQuestion": onCreateQuestion.flatMap { $0.snapshot }])
        }
        
        public var onCreateQuestion: OnCreateQuestion? {
            get {
                return (snapshot["onCreateQuestion"] as? Snapshot).flatMap { OnCreateQuestion(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "onCreateQuestion")
            }
        }
        
        public struct OnCreateQuestion: GraphQLSelectionSet {
            public static let possibleTypes = ["Question"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("question", type: .nonNull(.scalar(String.self))),
                GraphQLField("answers", type: .nonNull(.list(.scalar(String.self)))),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, question: String, answers: [String?]) {
                self.init(snapshot: ["__typename": "Question", "id": id, "question": question, "answers": answers])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var question: String {
                get {
                    return snapshot["question"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "question")
                }
            }
            
            public var answers: [String?] {
                get {
                    return snapshot["answers"]! as! [String?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answers")
                }
            }
        }
    }
}

public final class OnUpdateQuestionSubscription: GraphQLSubscription {
    public static let operationString =
    "subscription OnUpdateQuestion {\n  onUpdateQuestion {\n    __typename\n    id\n    question\n    answers\n    answerId\n  }\n}"
    
    public init() {
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Subscription"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("onUpdateQuestion", type: .object(OnUpdateQuestion.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(onUpdateQuestion: OnUpdateQuestion? = nil) {
            self.init(snapshot: ["__typename": "Subscription", "onUpdateQuestion": onUpdateQuestion.flatMap { $0.snapshot }])
        }
        
        public var onUpdateQuestion: OnUpdateQuestion? {
            get {
                return (snapshot["onUpdateQuestion"] as? Snapshot).flatMap { OnUpdateQuestion(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateQuestion")
            }
        }
        
        public struct OnUpdateQuestion: GraphQLSelectionSet {
            public static let possibleTypes = ["Question"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("question", type: .nonNull(.scalar(String.self))),
                GraphQLField("answers", type: .nonNull(.list(.scalar(String.self)))),
                GraphQLField("answerId", type: .scalar(Int.self)),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, question: String, answers: [String?], answerId: Int? = nil) {
                self.init(snapshot: ["__typename": "Question", "id": id, "question": question, "answers": answers, "answerId": answerId])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var question: String {
                get {
                    return snapshot["question"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "question")
                }
            }
            
            public var answers: [String?] {
                get {
                    return snapshot["answers"]! as! [String?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answers")
                }
            }
            
            public var answerId: Int? {
                get {
                    return snapshot["answerId"] as? Int
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answerId")
                }
            }
        }
    }
}

public final class OnDeleteQuestionSubscription: GraphQLSubscription {
    public static let operationString =
    "subscription OnDeleteQuestion {\n  onDeleteQuestion {\n    __typename\n    id\n    question\n    answers\n    answerId\n  }\n}"
    
    public init() {
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Subscription"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("onDeleteQuestion", type: .object(OnDeleteQuestion.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(onDeleteQuestion: OnDeleteQuestion? = nil) {
            self.init(snapshot: ["__typename": "Subscription", "onDeleteQuestion": onDeleteQuestion.flatMap { $0.snapshot }])
        }
        
        public var onDeleteQuestion: OnDeleteQuestion? {
            get {
                return (snapshot["onDeleteQuestion"] as? Snapshot).flatMap { OnDeleteQuestion(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteQuestion")
            }
        }
        
        public struct OnDeleteQuestion: GraphQLSelectionSet {
            public static let possibleTypes = ["Question"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("question", type: .nonNull(.scalar(String.self))),
                GraphQLField("answers", type: .nonNull(.list(.scalar(String.self)))),
                GraphQLField("answerId", type: .scalar(Int.self)),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, question: String, answers: [String?], answerId: Int? = nil) {
                self.init(snapshot: ["__typename": "Question", "id": id, "question": question, "answers": answers, "answerId": answerId])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var question: String {
                get {
                    return snapshot["question"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "question")
                }
            }
            
            public var answers: [String?] {
                get {
                    return snapshot["answers"]! as! [String?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answers")
                }
            }
            
            public var answerId: Int? {
                get {
                    return snapshot["answerId"] as? Int
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answerId")
                }
            }
        }
    }
}

public final class OnCreateAnswerSubscription: GraphQLSubscription {
    public static let operationString =
    "subscription OnCreateAnswer {\n  onCreateAnswer {\n    __typename\n    id\n    username\n    answer\n  }\n}"
    
    public init() {
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Subscription"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("onCreateAnswer", type: .object(OnCreateAnswer.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(onCreateAnswer: OnCreateAnswer? = nil) {
            self.init(snapshot: ["__typename": "Subscription", "onCreateAnswer": onCreateAnswer.flatMap { $0.snapshot }])
        }
        
        public var onCreateAnswer: OnCreateAnswer? {
            get {
                return (snapshot["onCreateAnswer"] as? Snapshot).flatMap { OnCreateAnswer(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "onCreateAnswer")
            }
        }
        
        public struct OnCreateAnswer: GraphQLSelectionSet {
            public static let possibleTypes = ["Answer"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("answer", type: .list(.scalar(Int.self))),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, username: String, answer: [Int?]? = nil) {
                self.init(snapshot: ["__typename": "Answer", "id": id, "username": username, "answer": answer])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var username: String {
                get {
                    return snapshot["username"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "username")
                }
            }
            
            public var answer: [Int?]? {
                get {
                    return snapshot["answer"] as? [Int?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answer")
                }
            }
        }
    }
}

public final class OnUpdateAnswerSubscription: GraphQLSubscription {
    public static let operationString =
    "subscription OnUpdateAnswer {\n  onUpdateAnswer {\n    __typename\n    id\n    username\n    answer\n  }\n}"
    
    public init() {
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Subscription"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("onUpdateAnswer", type: .object(OnUpdateAnswer.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(onUpdateAnswer: OnUpdateAnswer? = nil) {
            self.init(snapshot: ["__typename": "Subscription", "onUpdateAnswer": onUpdateAnswer.flatMap { $0.snapshot }])
        }
        
        public var onUpdateAnswer: OnUpdateAnswer? {
            get {
                return (snapshot["onUpdateAnswer"] as? Snapshot).flatMap { OnUpdateAnswer(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateAnswer")
            }
        }
        
        public struct OnUpdateAnswer: GraphQLSelectionSet {
            public static let possibleTypes = ["Answer"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("answer", type: .list(.scalar(Int.self))),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, username: String, answer: [Int?]? = nil) {
                self.init(snapshot: ["__typename": "Answer", "id": id, "username": username, "answer": answer])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var username: String {
                get {
                    return snapshot["username"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "username")
                }
            }
            
            public var answer: [Int?]? {
                get {
                    return snapshot["answer"] as? [Int?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answer")
                }
            }
        }
    }
}

public final class OnDeleteAnswerSubscription: GraphQLSubscription {
    public static let operationString =
    "subscription OnDeleteAnswer {\n  onDeleteAnswer {\n    __typename\n    id\n    username\n    answer\n  }\n}"
    
    public init() {
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Subscription"]
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("onDeleteAnswer", type: .object(OnDeleteAnswer.selections)),
            ]
        
        public var snapshot: Snapshot
        
        public init(snapshot: Snapshot) {
            self.snapshot = snapshot
        }
        
        public init(onDeleteAnswer: OnDeleteAnswer? = nil) {
            self.init(snapshot: ["__typename": "Subscription", "onDeleteAnswer": onDeleteAnswer.flatMap { $0.snapshot }])
        }
        
        public var onDeleteAnswer: OnDeleteAnswer? {
            get {
                return (snapshot["onDeleteAnswer"] as? Snapshot).flatMap { OnDeleteAnswer(snapshot: $0) }
            }
            set {
                snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteAnswer")
            }
        }
        
        public struct OnDeleteAnswer: GraphQLSelectionSet {
            public static let possibleTypes = ["Answer"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("answer", type: .list(.scalar(Int.self))),
                ]
            
            public var snapshot: Snapshot
            
            public init(snapshot: Snapshot) {
                self.snapshot = snapshot
            }
            
            public init(id: GraphQLID, username: String, answer: [Int?]? = nil) {
                self.init(snapshot: ["__typename": "Answer", "id": id, "username": username, "answer": answer])
            }
            
            public var __typename: String {
                get {
                    return snapshot["__typename"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return snapshot["id"]! as! GraphQLID
                }
                set {
                    snapshot.updateValue(newValue, forKey: "id")
                }
            }
            
            public var username: String {
                get {
                    return snapshot["username"]! as! String
                }
                set {
                    snapshot.updateValue(newValue, forKey: "username")
                }
            }
            
            public var answer: [Int?]? {
                get {
                    return snapshot["answer"] as? [Int?]
                }
                set {
                    snapshot.updateValue(newValue, forKey: "answer")
                }
            }
        }
    }
}
