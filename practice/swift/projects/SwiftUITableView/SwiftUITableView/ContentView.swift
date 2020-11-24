//
//  ContentView.swift
//  SwiftUITableView
//
//  Created by Michael Neas on 11/23/20.
//

import SwiftUI

struct ContentView: View {
    @State var isEditing = false
    @State var content = ["Test1Test1Test1Test1Test1Test1t1Test1Test1Test1Test1Test1Test1Test1Test1Test1t1Test1Test1Test1Test1Test1Test1Test1Test1Test1t1Test1Test1Test1Test1Test1Test1Test1Test1Test1t1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1", "Test2", "Test3","Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1", "Test2", "Test3","Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1", "Test2", "Test3","Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1", "Test2", "Test3","Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1Test1", "Test2", "Test3"]

    var body: some View {
        NavigationView {
            TableViewRepresentable($content, post: "This is the post text!", isEditing: self.$isEditing)
            .navigationBarTitle("Nav title", displayMode: .inline)
                .navigationBarItems(leading: Button("Add") {
                    withAnimation {
                    content.insert("0w0sdnj 0j0 hj0 h 0djsa f09sj0 f9jas09jfd0 aj09 j0j 0j 0fj0d jn2340 92j 09j 0 j1029 j40912jnwlriunei bui ub iun iu niu ni uebwtptpoeri hopie jop jgig oidnogindosinfgoingoisdnfgoifdsngoinfsdgoinsdogindsoifngoisdn  in ofingosioi no ino in oignfdi u  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc varius dui massa, ac convallis neque tempor eget. Nunc tincidunt diam a purus blandit, eu porta mauris efficitur. Cras molestie arcu metus, ut finibus quam pulvinar non. Integer nec lorem ac odio dignissim vulputate vel at ex. Duis ullamcorper lobortis arcu. Vestibulum nec quam turpis. Integer ultricies massa id nibh hendrerit rutrum. Aliquam eget suscipit magna. Vestibulum eleifend tellus enim, sit amet maximus nibh ornare a. Aliquam lobortis lectus ultricies eleifend tincidunt. Mauris vel ornare massa, ut pellentesque eros. Ut fermentum convallis massa vel consectetur. Ut volutpat enim ut ligula ultricies facilisis vel eget metus.Vestibulum dui neque, blandit a tincidunt ac, malesuada eget dolor. Donec tempor dapibus euismod. Aenean tristique elit in ipsum eleifend rutrum. Duis pulvinar velit nunc. Vestibulum venenatis ligula ac lacinia feugiat. Aliquam sed tempor tellus, in imperdiet ante. Nullam eu tempus turpis, suscipit condimentum neque. Praesent in justo nibh. Aenean ac velit id mi faucibus eleifend quis a velit. Etiam euismod et ex id lacinia. Vivamus quis risus justo. Integer non ex quis nunc ullamcorper efficitur. Quisque vel nisi malesuada, ornare risus at, maximus leo. Nullam accumsan mollis arcu, non maximus enim viverra eget. Ut pretium est enim, ac gravida quam laoreet porta. Praesent a venenatis sem, eu vestibulum lacus. ", at: 0)
                    }
                }, trailing: Button("Edit") {
                self.isEditing.toggle()
            })
        }
    }
}
