boolean white = true;
boolean showCode = false;
boolean flip = false;
String[] letters = {
  "a", "b", "c", "d", "e", "f", "g", "h"
};
int[] numbers = {
  8, 7, 6, 5, 4, 3, 2, 1
};
int randomX;
int randomY;

void setup() {
  size(800, 800);
  background(255);
  setSquare();
}

void draw() {
  background(255);
  //-------------------------------draw board----------------------------------
  int i;
  for (i=0; i<8; i++) {
    int j;
    for (j=0; j<8; j++) {
      if ((i+j)%2==0) {
        fill(255);
      } else {
        fill(0);
      }
      rect(100*j, 100*i, 100, 100);
    }
  }
  //--------------------------------draw highlighted square--------------------
  fill(255, 255, 0);
  rect(100*randomX, 100*randomY, 100, 100);

  //--------------------------------draw top pieces--------------------------------
  if (flip) {
    fill(255);
    stroke(0);
  } else {
    fill(0);
    stroke(255);
  }
  for (i=0; i<2; i++) {
    int j;
    for (j=0; j<8; j++) {
      ellipse(100*j+50, 100*i+50, 50, 50);
    }
  }

  //--------------------------------draw bottom pieces--------------------------------
  if (flip) {
    stroke(255);
    fill(0);
  } else {
    fill(255);
    stroke(0);
  }
  for (i=6; i<8; i++) {
    int j;
    for (j=0; j<8; j++) {
      ellipse(100*j+50, 100*i+50, 50, 50);
    }
  }
    stroke(0);
  //--------------------------------label--------------------------------
  if (showCode) {
    fill(255, 0, 255);
    textSize(35);
    text(letters[randomX]+numbers[randomY], randomX*100+30, randomY*100+60);
  }
}

void keyPressed() {
  if (key == ' ') {
    setSquare();
    showCode = false;
  }
  if (key == 's') {
    showCode=true;
  }
  if (key == 'r') {
    flip = !flip;
    //reverse numbers arrays
    reverseArray(numbers);
    reverseArray(letters);

  }
}
void reverseArray(int[] array){
    int i;
    for(i=0;i<4;i++){
    int temp = array[i];
    array[i] = array[8-i-1];
    array[8-i-1] = temp;  
}
}
void reverseArray(String[] array){
    int i;
    for(i=0;i<4;i++){
    String temp = array[i];
    array[i] = array[8-i-1];
    array[8-i-1] = temp;  
}
}

void setSquare() {
  randomX = int(random(0, 8));
  randomY = int(random(0, 8));
}
