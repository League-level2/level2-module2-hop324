//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int xmember;
int ymember;

// Add a constructor with parameters to initialize each variable.
public Segment(int xyes,int yyes){
xmember = xyes;
ymember = yyes;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
int foodX;
int foodY;

int direction = UP;
int foodEaten = 0;




//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(100, 100);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);

}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(#1EAEBC);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  fill(#ED1FE0);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(#E5895A);
  rect(head.xmember, head.ymember, 10, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == UP && direction != DOWN){
  direction = UP;
  }
  else if(keyCode == RIGHT && direction != LEFT){
  direction = RIGHT;
  }
  else if(keyCode == LEFT && direction != RIGHT){
  direction = LEFT;
  }
  else if(keyCode == DOWN && direction != UP){
  direction = DOWN;
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
     head.ymember+=5;
    break;
  case DOWN:
     head.ymember-=5;
    break;
  case LEFT:
  head.xmember-=5;
    
    break;
  case RIGHT:
    head.xmember+=5;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.xmember > 500){
     head.xmember = 0;
 }
 else if(head.xmember < 0){
     head.xmember = 500;
 }
 else if(head.ymember > 500){
     head.xmember = 0;
 }
 else if(head.ymember < 0){
     head.xmember = 500;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(head.xmember == foodX && head.ymember == foodY){
  foodEaten++;
  dropFood();
  }
}
