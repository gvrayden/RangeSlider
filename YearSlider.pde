class YearSlider
{
  float x,y,x2,y2;
  float mmin,mmax;
  int yearMin;
  int yearMax;
  YearSlider(float x, float y, float x2, float y2)
  {
    this.x = x;
    this.y = y;
    this.x2 = x2;
    this.y2 = y2;
    yearMin = 1890;
    yearMax = 2012;
  }
  
  void drawSlider()
  {
    rectMode(CORNERS);
    fill(#35402F,200);
    //rect(x,y,w,h);
    
    int yearInterval = 10;
    int totalYears = 2012-1890;//should be done prior to this in map
    int currentYear = 1890;
    
    
    //draws lines for slider
    for(currentYear=1890;currentYear<2012;currentYear++){
      float m = map(currentYear, yearMin, yearMax, x,x2);
      if(currentYear%yearInterval == 0){
        stroke(#ffffff,200);
        line(m,y,m,y2);
      }
    }
    
    //draws min ellipse
    fill(#35402F,200);
    stroke(#A02CF5);
    strokeWeight(2);
    mmin = map(currentMinYear,yearMin, yearMax, x, x2);
    ellipse(mmin,(y+y2)/2,y2*0.05,y2*0.05);
    line(mmin,(y+y2)/2,mmin,y2); //line on the ellipse indicating year of selection
    fill(#A02CF5);
    text(currentMinYear,mmin,y2);
    fill(#35402F,200);
    fill(#ffffff);
    textAlign(CENTER,TOP);
    text("1890",x,y2);
    
    //draws max ellipse
    stroke(#F5552C);
    fill(#35402F,200);
    mmax = map(currentMaxYear,yearMin, yearMax, x, x2);
    ellipse(mmax,(y+y2)/2,y2*0.05,y2*0.05);
    line(mmax,(y+y2)/2,mmax,y2); //line on the ellipse indicating year of selection
    fill(#F5552C);
    text(currentMaxYear,mmax,y2);
    fill(#35402F,200);
    fill(#ffffff);
    text("2012",x2,y2);
    
    stroke(#ffffff,50);
    line(x,(y+y2)/2,x2,(y+y2)/2); //center line of the range slider.
  }
  
  void updateSlider(float mx, float my){
     if(isWithinSlider(mx,my))
     {
       if(currentMinYear < currentMaxYear )
         updatePosition(mx,my);
     }
  }
  
  boolean isWithinSlider(float mx, float my)
  {
    if (mx >= x && mx <= x2 && 
      my >= y && my <= y2) {
      return true;
    }
    else return false;
  }
  
  void updatePosition(float mx, float my)
  {
    float disMinX = (mx > mmin)? mx-mmin: mmin-mx;
    float disMaxX = (mx > mmax)? mx-mmax: mmax-mx;
    if(disMinX < disMaxX)
    {
       int v = getYearPosition(mx); 
       if(v < currentMaxYear)
         currentMinYear = v;
    }
    else
    {
      int v = getYearPosition(mx); 
      if(v > currentMinYear)
        currentMaxYear = v;
    }
  }
  
  int getYearPosition(float inx)
  {
    return (int)map(inx,x,x2,yearMin,yearMax);
  }
}
