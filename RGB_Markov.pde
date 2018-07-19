// RGB Markov //<>// //<>//
// by Kevin Ranville
//
// A computer-generated art algorithm that will create a markov chain from the changing RGB values of a source image,
// and then create random images based on the statistical probabilities from the markov chain.

PImage source;
PImage result;

int[][] redMarkovCount = new int[256][256];
int[] redMarkovTotals = new int[256];

int[][] greenMarkovCount = new int[256][256];
int[] greenMarkovTotals = new int[256];

int[][] blueMarkovCount = new int[256][256];
int[] blueMarkovTotals = new int[256];

void setup() {
  size(858, 536);
  source = loadImage("frog.jpg");
  result = createImage(source.width, source.height, RGB);

  //tally RGB chains
  for (int i = 0; i < source.pixels.length-1; i++) {
    int currentRed = int(red(source.pixels[i]));
    int nextRed = int(red(source.pixels[i+1]));

    redMarkovCount[currentRed][nextRed]++;
    
    int currentGreen = int(green(source.pixels[i]));
    int nextGreen = int(green(source.pixels[i+1]));

    greenMarkovCount[currentGreen][nextGreen]++;
    
    int currentBlue = int(green(source.pixels[i]));
    int nextBlue = int(green(source.pixels[i+1]));

    blueMarkovCount[currentBlue][nextBlue]++;
  }


  for (int i = 0; i < 255; i++) {
    for (int j = 0; j < 255; j++) {
      redMarkovTotals[i] += redMarkovCount[i][j];
      greenMarkovTotals[i] += greenMarkovCount[i][j];
      blueMarkovTotals[i] += blueMarkovCount[i][j];
    }
  }
  
  int currentR = int(red(source.pixels[0]));
  int currentG = int(green(source.pixels[0]));
  int currentB = int(green(source.pixels[0]));

  
  for (int i = 0; i < result.pixels.length-1; i++) {
    //RED PICK
    //build a pool from which to select a random element with appropriate probabilities
    int index = currentR;
    int n = 0;
    int[] rPool = new int[redMarkovTotals[index]];
    for (int j = 0; j < 255; j++) {
      if (redMarkovCount[index][j] > 0) {
        for (int k = 0; k < redMarkovCount[index][j]; k++) {
          rPool[n] = j;
          n++;
        }
      }
    }
    
    //select a random element from the pool
    int x = int(random(rPool.length));
    int rPick = rPool[x];
    
    currentR = rPick;
    
    //GREEN PICK
    //build a pool from which to select a random element with appropriate probabilities
    index = currentG;
    n = 0;
    int[] gPool = new int[greenMarkovTotals[index]];
    for (int j = 0; j < 255; j++) {
      if (greenMarkovCount[index][j] > 0) {
        for (int k = 0; k < greenMarkovCount[index][j]; k++) {
          gPool[n] = j;
          n++;
        }
      }
    }
    
    //select a random element from the pool
    x = int(random(gPool.length));
    int gPick = gPool[x];    
    
    currentG = gPick;
    
    //BLUE PICK
    //build a pool from which to select a random element with appropriate probabilities
    index = currentB;
    n = 0;
    int[] bPool = new int[blueMarkovTotals[index]];
    for (int j = 0; j < 255; j++) {
      if (blueMarkovCount[index][j] > 0) {
        for (int k = 0; k < blueMarkovCount[index][j]; k++) {
          bPool[n] = j;
          n++;
        }
      }
    }
    
    //select a random element from the pool
    x = int(random(bPool.length));
    int bPick = bPool[x];    
    
    currentB = bPick;
    
    //assign that random element to the red value of current pixel
    result.pixels[i] = color(rPick,gPick,bPick);
  }

  result.updatePixels();


  image(result, 0, 0);
}

void draw() {
}
