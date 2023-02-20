# Hi Floww iOS engineers 👋

Thanks for taking the time to look at my code.

I've enjoyed this challenge!

If you have any questions let me know, and I'd love to hear your feedback. I've been using SwiftUI for about 9 months, so very keen to keep learning and improving my knowledge.

[What I've built](#what-ive-built)
[iPhone Demo Video](#iphone-demo-video)
[iPad Demo Video](#ipad-demo-video)
[My Thought Process](#my-thought-process)

## What I've built

I time-boxed this project, and I must admit I ran out of time before I could complete all of the stretch goals.

Here's the finished task list:

- [x] Markets List
- [x] Market chart
- [x] Pull to refresh markets list
- [x] Filter markets list
- [x] iPad Support
- [x] Loading states
- [x] Error states
- [x] Unit tests
- [ ] Chart drag gesture
- [ ] Chart period control
- [ ] UI tests (Not specifically mentioned in the PDF. However, unit test coverage is good)

I ran out of Bitrise credits before I finished, so I'm not sure if the final CI job is going to complete.

Here's a screenshot of the tests I ran manually before merging the final PR:

<img width="418" alt="Screenshot 2023-02-20 at 3 34 34 PM" src="https://user-images.githubusercontent.com/125687596/220147956-732eb455-bb26-4412-8fa6-82d7ab5fa65b.png">

## iPhone Demo Video

I've shown an example of hitting a rate limit error and getting throttled in the below video

Once that happens, if you skip through to the end you can see me refresh the app, get the data, and hide the error (it takes a couople of mins for the rate limit to clear, and it's not exactly fun to watch that part 😅):

https://user-images.githubusercontent.com/125687596/220144640-ca9f788a-fd7d-42fd-b40a-459ffcad1199.mov

## iPad Demo Video

https://user-images.githubusercontent.com/125687596/220144861-575767ff-50b6-42ea-8c96-faed96d65baa.mov

## My Thought Process

I thought it might be useful to include some details about the planning I did before writing any code.

### I defined these key goals:

1. CoinGecko API must be easy to swap out, without changes in the view, presentation and business logic layers.

CoinGecko is a third party dependency, and a key one at that. We must have the flexibility to switch to something else quickly.
  
2. Currently, there's no need to keep state in sync between multiple live views. So, we should *avoid* reference semantics. 

Everything should be `struct`.

3. The app is currently very simple. The architecture should allow complexity to be added without necessarily needing changes codebase-wide.

For example, it should be possible to add a feature such as caching without disrupting the view/presentation layer.

### Architecure diagram

I came up with a rough architecture as below (which I stuck to for the most part when implementing this).

**Note:** Some of the bits on this diagram are for illustrationn only. I wanted to show where certain features may fit in the future (there's no caching in the final code, for example):

<img width="710" alt="Screenshot 2023-02-20 at 3 53 26 PM" src="https://user-images.githubusercontent.com/125687596/220152082-bb50953a-4479-46eb-82bf-a07a6fb5cf14.png">

