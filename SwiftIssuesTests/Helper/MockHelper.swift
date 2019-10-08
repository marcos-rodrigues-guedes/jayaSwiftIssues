struct MockHelper {

    static func getMockIssues() -> [Issues] {
        let data = readJSON(name: "dataset-issues")
         return Helper.decodeJSON(type: Issues.self, from: data)
    }


    static func readJSON(name: String) -> Data? {
        let bundle = Bundle(for: IssuesListPresenterSpec.self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else { return nil }
        do {
            return try Data(contentsOf: url, options: .mappedIfSafe)
        }
        catch {
            return nil
    }
  }
}