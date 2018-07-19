# RGB_Markov
Turns out creating a markov chain from RGB values trained from a jpg gives you streaks of noise, but it was fun.

This processing sketch reads the RGB values from a jpg, and creates a markov chain from the red, green, and blue components of the pixels. Then it uses those statistics to color the pixels of a new image based on the probabilities from the markov chain. It was an interesting idea in theory, but mostly it just produces noise. 
