Player p;
Field grass;
Credit[] credits = new Credit[10];
int preMs = 0;
int cnt = 0;

void setup(){

    p = new Player();
    grass = new Field();

    size(1200, 800);
    smooth();
    frameRate(100);
}

void draw(){
    background(255);

    p.setPosition(mouseX);

    p.display();
    grass.display();

    /* 1s毎に実行 */
    if(millis() > (preMs + 1000)){
        /* ランダムな位置に単位を生成 */
        credits[cnt] = new Credit(100.0);
        credits[cnt].display();
        println(cnt);
        cnt++;
        preMs = millis();
    }
}


class Player{
    float x, y;
    PImage img;
    Player(){
        img = loadImage("./img/charactor.png");
        img.resize(0, 200);
        x = width/2;
        y = 580;
    }

    void setPosition(float _x){
        x = _x;
        if(x <= 0) x = 0;
        if(x >= width - this.img.width) x = width - this.img.width;
    }

    void display(){
        image(img, x, y);
    }
}

class Field{
    float x, y;
    PImage img;
    Field(){
        img = loadImage("./img/line_shibafu.png");
        img.resize(width, 0);
        x = 0;
        y = height - this.img.height;
    }
    void display(){
        image(img, x, y);
    }
}

class Credit{
    float x, y;
    PImage img;

    Credit(float _x){
        img = loadImage("./img/tanni.png");
        img.resize(100, 0);
        x = _x;
        y = 0;
    }

    float getNowX(){
        return x;
    }

    float getNowY(){
        return y;
    }

    void erase(){

    }

    void display(){
        image(img, x, y);
    }
}