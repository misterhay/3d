font="Calibri:style=Bold";
cubeSize = 40;
letterSize = 10;
textDepth=1.5;
smooth=300;
middle = cubeSize/2 - textDepth;

text1="he";
text2="open";
text3="do"; // bottom of cube
text4="put";
text5="you";
text6="she";


// thingiverse.com/thing:2793326
// makezine.com/2015/09/18/design-your-own-dice-in-openscad

module letter(line1) {
    translate([0,0,middle]) {
        linear_extrude(height=textDepth*2) {
            text(line1, size=letterSize, font=font, halign="center", valign="center", $fn=smooth);
        }
    }
}


difference() {
    intersection() {
        cube(cubeSize, center=true, $fn=smooth);
        sphere(cubeSize/1.4, center=true, $fn=smooth);
    }
    letter(text1); // face 1
    rotate([90,180,0]){letter(text2);} // face 2
    rotate([180,0,90]){letter(text3);} // face 3
    rotate([-90,180,0]){letter(text4);} // face 4
    rotate([0,90,0]){letter(text5);} // face 5
    rotate([0,-90,0]){letter(text6);} // face 6
}
