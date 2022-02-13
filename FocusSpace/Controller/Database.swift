//
//  Database.swift
//  pusheenDev
//
//  Created by user199782 on 1/15/22.
//

import PostgresClientKit

struct Summary {
    var activity: String
    var insist_time: Double
}

class Database {
    static func connect() -> [Summary] {
        var result: [Summary] = []
        do {
            var config = PostgresClientKit.ConnectionConfiguration()
            config.host = "free-tier.gcp-us-central1.cockroachlabs.cloud"
            config.port = 26257
            config.database = "pusheenu-cluster1-5477.defaultdb"
            config.user = "senni0418"
            config.credential = .cleartextPassword(password: "n3_9HPFB8U3X8Asq")
            
            let connection = try PostgresClientKit.Connection(configuration: config)
            defer {connection.close()}
            
            let text = "select activity, sum(insist_time) as insist_time from summary group by activity;"
            let statement = try connection.prepareStatement(text: text)
            defer {
                statement.close()
            }
            
            let cursor = try statement.execute()
            defer {
                cursor.close()
            }
            
            for row in cursor {
                let columns = try row.get().columns
                let activity = try columns[0].string()
                let insist_time = try columns[1].double()
                
                result.append(Summary(activity: activity, insist_time: insist_time))
            }
        } catch {
            print(error)
        }
        return result
    }
}
