int currentMinYear = 1890;
int currentMaxYear = 2000;
YearSlider slider;
void setup(){
  size(800,600);
  //YearSlider(graphX1,graphY2,graphX2,graphY2+rangeSliderW);
  slider = new YearSlider(width-(width*0.75),height-200,width-(width*0.25),height-150);
}

void draw(){
  background(#35402F);
  color(#000000);
  smooth();
  slider.drawSlider();

}

void mousePressed(){
  slider.updateSlider(mouseX,mouseY);
}

void mouseDragged(){
  slider.updateSlider(mouseX,mouseY);
}
