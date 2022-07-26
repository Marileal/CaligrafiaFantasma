import processing.svg.*;
ArrayList <PVector> V;
ArrayList <ArrayList<PVector>> listaV;
int[] iterators = {0, 0, 0, 0, 0};
boolean sorteia = false;
int j, o = 0;
int indRes = 0;

PImage fundo;

int largpena;
color [] paleta = {#00916e, #259ad0, #ffcf00, #ee6123, #fa003f};

void setup() {
  //fullScreen();
  size(900, 900);
  background(255);
  noStroke();
  largpena = 50;
  listaV = new ArrayList();
  strokeCap(ROUND);
  //blendMode(DIFFERENCE);
}

void draw() {
  if (frameCount % 89 == 0) {
    o += 1;
    println(o);
  } else if (o > 10) {
    o =  0;
  }
  fill(255, o);
  rect (-10, -10, width + 10, height + 10);
  if (frameCount % 7 == 0 &&  listaV.size() <= 5) {
    selecionare(0, fileMaker());
  } else if ( sorteia) {
    println(indRes);
    listaV.remove(indRes);
    selecionare(indRes, fileMaker());
    println(listaV.size());
    sorteia = !sorteia;
  }
  if (V != null) {
    for (int i = 0; i < listaV.size() - 1; i++) {
      if (iterators[i] < listaV.get(i).size() - 2) {
        switch (i) {
        case 0:
          iterators[0]++;
          j = iterators[0];
          fill(paleta[0]);
          if (listaV.get(i).get(j).x == -1 || listaV.get(i).get(j + 1).x == -1) {
            noStroke();
            noFill();
            iterators[0]++;
          }
          break;
        case 1:
          iterators[1]++;
          j = iterators[1];
          fill(paleta[1]);
          if (listaV.get(i).get(j).x == -1 || listaV.get(i).get(j + 1).x == -1) {
            noStroke();
            noFill();
            iterators[1]++;
          }
          break;
        case 2:
          iterators[2]++;
          j = iterators[2];
          fill(paleta[2]);
          if (listaV.get(i).get(j).x == -1 || listaV.get(i).get(j + 1).x == -1) {
            noStroke();
            noFill();
            iterators[2]++;
          }
          break;
        case 3:
          iterators[3]++;
          j = iterators[3];
          fill(paleta[3]);
          if (listaV.get(i).get(j).x == -1 || listaV.get(i).get(j + 1).x == -1) {
            noStroke();
            noFill();
            iterators[3]++;
          }
          break;
        case 4:
          iterators[4]++;
          j = iterators[4];
          fill(paleta[4]);
          if (listaV.get(i).get(j).x == -1 || listaV.get(i).get(j + 1).x == -1) {
            noStroke();
            noFill();
            iterators[4]++;
          }
          break;
        }
        float x = listaV.get(i).get(j + 1).x;
        float y = listaV.get(i).get(j + 1).y;
        float px = listaV.get(i).get(j).x;
        float py = listaV.get(i).get(j).y;
        quad(x + largpena * cos(QUARTER_PI), y - largpena * sin(QUARTER_PI),
          x - largpena * cos(QUARTER_PI), y + largpena * sin(QUARTER_PI),
          px - largpena * cos(QUARTER_PI), py + largpena * sin(QUARTER_PI),
          px + largpena * cos(QUARTER_PI), py - largpena * sin(QUARTER_PI));
      } else {
        iterators[i] = 0;//listaV.get(i).size() - 2;
        indRes = i;
        sorteia = !sorteia;
      }
    }
  }
}

void selecionare(int indAdd, File selection) {

  V = new ArrayList();
  String[] input = loadStrings( selection.getAbsolutePath() );
  for (int i = 0; i < input.length; i++) {
    String[] spl = split(input[i], ", ");
    V.add(new PVector( float(spl[0]), float(spl[1]) ));
  }
  listaV.add(indAdd, V);
  redraw();
}

String fileNameMaker() {
  int sortido = int(random(1, 10.5));
  String txt = ".txt";
  String nome = nf(sortido) + txt;
  return nome;
}

String pathMaker() {
  String path = "data/" + fileNameMaker();
  //println(path);
  return path;
}

File fileMaker() {
  File file = new File(sketchPath()+ "/" + pathMaker());
  //println(file);
  return file;
}
