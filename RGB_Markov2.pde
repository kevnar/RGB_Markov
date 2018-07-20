// RGB Markov //<>//
// by Kevin Ranville
//
// A computer-generated art algorithm that will create a markov chain from the changing RGB values of a source image,
// and then create random images based on the statistical probabilities from the markov chain.

PImage source;
PImage result;

void setup() {
  size(858, 536);
  source = loadImage("frog.jpg");
  result = createImage(source.width, source.height, RGB);

  //tally RGB chains
  color curCol = source.pixels[0];
  result.pixels[0] = curCol; //<>//
  for (int i = 1; i < result.pixels.length; i++) {
    result.pixels[i] = markov(curCol); 
    curCol = result.pixels[i];
    float prog = float(i) / float(source.pixels.length) * 100.0;
    println(prog);
    result.updatePixels();
    image(result, 0, 0);
  }
  result.updatePixels();
  image(result, 0, 0);
}

color markov(color col) {
  // find all instances of color col in the source image, add them to an integer list
  // select one random item from the array
  // return the color that follows the random item
  color nextColor;
  IntList colors = new IntList();

  for (int i = 0; i < source.pixels.length-1; i++) {
    if (source.pixels[i] == col) colors.append(i);
  }

  if (colors.size() > 1) {
    int x = int(random(colors.size())); //<>//
    int n = colors.get(x);
    if (n > source.pixels.length -2) n = source.pixels.length - 1;

    nextColor = source.pixels[n + 1];

    return nextColor;
  } 

  int n = colors.get(0);

  nextColor = source.pixels[n + 1];

  return nextColor;
}
