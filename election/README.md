# It's Election Season!

We have been tasked with tallying the votes for the next Presidental Election
(in the fictional country of Elbonia). Fortunately, the requirements are very
simple since the Elbonians are highly organized. We only need to write one
function in Javascript.

The candidates are identified by positive integers, and the votes will be
provided to us as an unsorted Array of those integers.

If any candidate reaches a majority of votes, the function should return a
single-element Array with the integer representing the winning candidate.

If there is no majority winner, then a runoff election will be held. Our
function needs to return an array of integers for the top 3 candidates, to
identify candidates that qualified for the runoff.

In the runoff case, if there are multiple 3rd place candidate in a tie, then
all candidates who tied for third place will qualify for the runoff, and
so an Array with more than three integers may need to be returned.

The results do not have to be sorted in any special order.

# Testing

Tests have already been written for these cases by one of our developers who
always writes the tests first, but she was suddenly called away to an important
meeting before she could write the actual function.

The tests were written using Tape, a simple test runner for Node.js. To run the
tests, install `npm` if you need to, then install tape with

`npm install`

Then you can run the tests with

`tape election_test.js`

The 3 tests will currently fail. Once you get them passing, commit and push up
your code.

# Performance Considerations

If you can get these tests to pass, then consider this done - for now. But,
keep in mind, the tests involve only a small sample of votes. In reality, the
Republic of Elbonia has a population of 9,007,199,254,740,992 and *everyone*
votes.  Furthermore, anyone can run for president simply by sending a postcard
to the election office, so there are typically several thousand candidates. How
will your function behave under these circumstances? Should we be concerned
about performance? Is there any way we can make it faster?

