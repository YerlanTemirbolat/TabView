//
//  ContentView.swift
//  TabView
//
//  Created by Admin on 6/21/20.
//  Copyright © 2020 Yerlan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView() {
            
            DashView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Dash")
            }.tag(0)
            
            Text("This is Schedule")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
            }.tag(1)
            
            Text("This is Account")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
            }.tag(2)
            
            Text("This is Ratings")
                .tabItem {
                    Image(systemName: "star")
                    Text("Ratings")
            }.tag(3)
            
            Text("This is Earnings")
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Earnings")
            }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct DashView: View {
    
    let febWeeks = [
        Week(date: "Current week", pay: "942.27"),
        Week(date: "Feb 18 - Feb 24", pay: "242.27"),
        Week(date: "Feb 11 - Feb 17", pay: "1,342.27"),
        Week(date: "Feb 4 - Feb 10", pay: "1.342.27")
    ]
    
    let janWeeks = [
        Week(date: "Jan 28 - Feb 3", pay: "142.27"),
        Week(date: "Jan 21 - Jan 27", pay: "242.27"),
        Week(date: "Jan 14 - Jan 20", pay: "1.342.27")
    ]
    
    let decWeeks = [
        Week(date: "Dec 28 - Jan 3", pay: "142.27"),
        Week(date: "Dec 21 - Dec 27", pay: "242.27"),
        Week(date: "Dec 14 - Dec 20", pay: "1.342.27")
    ]
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                VStack(alignment: .leading) {
                    
                    Text("Current week")
                        .font(.title)
                        .bold()
                    
                    Text("$942.27")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.green)
                }
                
                MonthLabel(month: "February", weeks: febWeeks)
                MonthLabel(month: "January", weeks: janWeeks)
                MonthLabel(month: "December", weeks: decWeeks)
            }
            .navigationBarTitle("All money we've created", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                
                Text("Edit")
            })
        )}
    }
    
    struct Week: Hashable {
        let date: String
        let pay: String
    }
    
    
    struct MonthLabel: View {
        
        let month: String
        let weeks: [Week]
        
        
        var body: some View {
            
            Group {
                
                Text(month)
                    .font(.title)
                    .bold()
                    .padding(.vertical)
                
                ForEach(weeks, id: \.self) { week in
                    
                    NavigationLink(destination: Text("Coming soon")) {
                        
                        Text(week.date)
                        
                        Spacer()
                        
                        Text(week.pay)
                    }
                }
            }
        }
    }
}
