$vpr = [$t*360, $t*720, 0];
color([$t<0.5?$t*2:2-($t*2), $t<0.5?1-($t*2):($t*2)-1, 0])
    rotate([0, 90, $t*1080]) 
        rotate_extrude($fn=32)
            translate([18, 0])
                rotate([0, 0, $t*360])            
                    scale([1, 3])
                        circle(d=12, $fn=16);
