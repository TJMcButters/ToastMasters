//
//  CustomViewInserts.swift
//  ToastMasters3
//
//  Created by Tyler Moncur on 8/31/23.
//

import SwiftUI

struct CustomViewInserts: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MyDivider: View {
    
    @State var height: CGFloat
    @State var color: Color
    @State var padding: Bool
    
    var body: some View {
        if padding == true {
            Rectangle()
                .frame(height: height)
                .foregroundStyle(color)
                .padding(.horizontal)
        }
        else {
            Rectangle()
                .frame(height: height)
                .foregroundStyle(color)
        }
    }
}

#Preview {
    CustomViewInserts()
}
