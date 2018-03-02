font="Calibri:style=Bold";
cubeSize = 70;
letterSize = 10;
textDepth=1;
smooth=600;
middle = cubeSize/2 - textDepth;

text1a="This book";
text1b="is about";

text2a="I liked";
text2b="when";

text3a="I didn't";
text3b="like when";

text4a="This book";
text4b="reminds me";

text5a="My favorite";
text5b="part was";

text6a="I";
text6b="wonder";

// thingiverse.com/thing:2793326
// makezine.com/2015/09/18/design-your-own-dice-in-openscad

module letter(line1,line2) {
    translate([0,letterSize/1.5,middle]) {
        linear_extrude(height=textDepth*2) {
            text(line1, size=letterSize, font=font, halign="center", valign="center", $fn=smooth);
        }
    }
    translate([0,-letterSize/1.5,middle]) {
        linear_extrude(height=textDepth*2) {
            text(line2, size=letterSize, font=font, halign="center", valign="center", $fn=smooth);
        }
    }
}


difference() {
    intersection() {
        cube(cubeSize, center=true, $fn=smooth);
        sphere(cubeSize/1.4, center=true, $fn=smooth);
    }
    letter(text1a, text1b); // face 1
    rotate([90,180,0]){letter(text2a, text2b);} // face 2
    rotate([180,0,90]){letter(text3a, text3b);} // face 3
    rotate([-90,180,0]){letter(text4a, text4b);} // face 4
    rotate([0,90,0]){letter(text5a, text5b);} // face 5
    rotate([0,-90,0]){letter(text6a, text6b);} // face 6
}
