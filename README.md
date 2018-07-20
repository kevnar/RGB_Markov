# RGB_Markov
Turns out creating a markov chain from RGB values trained from a jpg gives you streaks of noise, but it was fun.

This processing sketch reads the RGB values from a jpg, and creates a markov chain from the red, green, and blue components of the pixels. Then it uses those statistics to color the pixels of a new image based on the probabilities from the markov chain. It was an interesting idea in theory, but mostly it just produces noise. 

RGB_Markov2 is kind of a messy hack that produce the markov chain by entire colors, as opposed to individual RGB values. It still looks like random streaks, but it's less noisy, and more obviously taken from a source image. It's also terribly slow as I merely simulate the markov process on the fly, without creating a dictionary of probabilities in advance.
