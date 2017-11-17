/*:
 #### Sequences
 A sequence is a list of values that you can step through, one at a time, the most common way being a _for-in_ loop. Sequences also offer a large variety of operations, including a few that are functional in nature.

*/
import PlaygroundSupport
import Foundation
import XCTest
/*:
###### A Sequence Example
 While the Swift standard and Foundation libraries offer built-in Sequence types like Array, ArraySlice, Range et al, it is very easy to have your own type conform to the Sequence protocol.
 
You can read more about Sequence here: https://developer.apple.com/documentation/swift/sequence

 It is simple to conform to the Sequence protocol. Let us take an example of an abstraction that represents a Swift program. Let us call it program. A program is a stream of tokens. So, we may want to have the Program type be a Sequence of Tokens. We are expected to do two things for this conformance:
 * Define an iterator that conforms to the IteratorProtocol and define the next() method
 * Program must conform to Sequence, for which we need to define the makeIterator() method
 
 Take a look at the Program abstraction here. It's a simple wrapper around a String.
*/
struct Program {
    let text: String
    
    public init(_ text: String) {
        self.text = text
    }
}
/*:
Now we want Program to be a sequence of tokens. So, let us begin by defining a TokenIterator that conforms to the IteratorProtocol. Just fill in the code for the next() function!
*/
struct TokenIterator : IteratorProtocol {
    let tokens: [String]
    var index = 0
    
    init( _ program: Program) {
        tokens = program.text
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { $0.count > 0 }
    }
    
    mutating func next() -> String? {
        //YOUR CODE GOES HERE
        return nil
    }
}
/*:
Great, we now have an interator that iterates through the tokens of a Program. But we need to connect it to our Program type through the Sequence protocol. Just fill in the code for the makeIterator() function and we'll be good to go!
*/
extension Program : Sequence {
    func makeIterator() -> TokenIterator {
        //YOUR CODE GOES HERE
    }
}


/*:
 Make sure the `testSequence()` test passes with the code you wrote above! And this brings us to the end of the first part of this exercise. We now know how to make your custom type behave like a Sequence.
 
 You may also try running the `for-in` loop with the Program type!
*/

//Test
func testSequence() {
    let text = """
        struct Program {
            let text : String
            public init ( _ text : String ) {
                self.text = text
            }
        }
    """
    
    let program = Program(text)
    XCTAssertEqual(program.filter { $0 == "}" || $0 == "{" }.count, 4)
}

testSequence()


