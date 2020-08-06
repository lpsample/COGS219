## Part 1
# Pay attention to whether different patches of your visual world are subtly tinted red or cyan. How are different colors spatially organized? How do these organization change over time?  

When I look only through the left eye or tilt my head to the right, the red looks yellow and the cyan looks cyan. When I look only with the right or. turn my head to the left, the cyan disappears and the red looks red. both the cyan and red are darker with the glasses than without. When I look with both eyes, I can see both colors, again darker than without glasses.

# When you are shown a display of horizontal red and vertical cyan stripes (by pressing the “stripes” button), how does your perception of horizontal and vertical stripes change over time? Pay particular attention to the transitions between perceptions of horizon]tal versus vertical stripes.

As I turn my head I can see more vertical or horizontal lines, and If I focus on them. The yellow/ disappearing effect still happens with I close one eye.

# Try blinking. How did that change your immediate perceptual experience upon re-opening your eyes?

Blinking shakes up what I was seeing before blinking. The blue vertical lines seem more responsively changing to the blinking.

# Try creating different displays consisting of red and blue regions. How do changes in these visual patterns change what you see over time? 

(See 1)

# When you shift your gaze to a red or blue patch, how does that change the appearance of the patch?

(See 1)

## Part 2

# Show the model a blank gray screen and set the mystery parameter to 10 and randomness to 70. The model should oscillate between "seeing" a mostly red-tinted world to seeing a mostly cyan-tinted world. Why? Does the oscillation behavior continue if ranomdness is set to a much lower value? Why or why not?


Model becomes more blue over time. Oscillation slows seriously when randomness is lower. Randomness of activation is diminished so each moment there is less change.

# Draw a small cyan-colored loop. Set cyan-red bias to -20 so that the model will mostly be seeing the world with its right eye, and set the mystery parameter to 10. Try resetting and running the model several times. Does the model see the world in the same way that you do? How so and how not?

I see it as oscillating from red to blue background over time. The model doesn’t oscillate to blue in the same way my eyes do, it stays mostly on red. After resetting it stays on cyan too long. After blinking it does a bit better

# Show the model a display with a long vertical red line and a long horizontal cyan line. Set the External Drive parameter to 70, the mystery parameter to 5, and the cyan-red bias to reflect which eye tends to dominate for you. In what ways does the model's perception match and mismatch how you see the display? How do you think the model might be modified to make it better match what you see?

I see a blurred middle part where the lines cross, the model makes more blurring happen all over and blurs the colors of the cross whereas my eyes can see the lines distinctly with only blurring in the middle. The model could be modified to only blur the middle.  

# Show the model the lattice of cyan and red stripes by pressing the "Stripes" button. What parameter values comes closest to letting the model see the display in the same way that you do? With these parameter values, what does the model get right and wrong in terms of matching how you dynamically see this display? 

When I blink it switches back to cyan and I can see horizontal red lines better. If I fixate my eyes it changes to red and I can see the vertical lines better. Change is slow. The parameters that best fit this are C-R: -9, mystery: 37, ED: 25, randomness: 18
My vision doesn’t expand when it changes the way the model does, and it changes slowly. There are not small boxes but rather an unclear structure/ general blur.

# Play around with different values for the mystery parameter, with different displays. Based on your observations, what do you think the mystery parameter does? 

Perhaps the mystery parameter controls the background? (Not the lines or shapes that you’re focusing on but how much the background is blurred between blue and red?)  