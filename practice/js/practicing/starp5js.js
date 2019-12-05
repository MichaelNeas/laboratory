function setup() {
    createCanvas(400, 400);
  }
  
  function draw() {
    colorMode(HSB);
    strokeWeight(4);
    var angle = TWO_PI / 5;
    var halfAngle = angle / 2.0;
    beginShape();
    var j = 0
    for (var i = 0; i < TWO_PI; i += angle) {
      if (j % 2 === 0){
        stroke(200, 204, 100);
      } else {
        stroke(255, 20, 20);
      }
      var sx = 200 + cos(i) * 30;
      var sy = 200 + sin(i) * 30;
      vertex(sx, sy);
      sx = 200 + cos(i + halfAngle) * 60;
      sy = 200 + sin(i + halfAngle) * 60;
      vertex(sx, sy);
      j += 1
    }
    endShape(CLOSE);
  }