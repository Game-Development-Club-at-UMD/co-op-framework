shader_type canvas_item;

varying vec2 world_position;

void vertex() {
	world_position = VERTEX + (4.0 * TIME);
}

void fragment() {
    // Get position-aligned pixel coordinates
    float pixel_coord = world_position.y - 80.0;
    
    // Determine which color to use based on pos
	float color_coord = mod(pixel_coord, 2.0);
    if (color_coord >= 1.0) {
		// alternates between white and red
		vec4 tex = texture(TEXTURE, UV);
    	tex.g *= 0.6;
    	tex.b *= 0.6;
		tex.r *= 0.6;
    	COLOR = tex;
		}
	else COLOR;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}