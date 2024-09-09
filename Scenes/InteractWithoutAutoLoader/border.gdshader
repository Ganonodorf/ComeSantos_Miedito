shader_type canvas_item;

uniform vec4 outline_tint: source_color;
uniform bool enabled = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 size = vec2(5.0/float(textureSize(TEXTURE, 0).x), 5.0/float(textureSize(TEXTURE, 0).y));
	vec4 pixel_color = texture(TEXTURE, UV);
	float alpha = -4.0 * pixel_color.a;
	alpha += texture(TEXTURE, UV + vec2(size.x, 0)).a;
	alpha += texture(TEXTURE, UV + vec2(-size.x, 0)).a;
	alpha += texture(TEXTURE, UV + vec2(0, size.y)).a;
	alpha += texture(TEXTURE, UV + vec2(0, -size.y)).a;
	vec4 outline_mask = mix(pixel_color, outline_tint, clamp(alpha, 0.0, 1.0) * sin(3.0 * TIME));
	
	if (enabled) {
		COLOR = vec4(outline_mask.rgb, clamp(abs(alpha) + pixel_color.a, 0.0, 1.0));
	} else { 
		COLOR = texture(TEXTURE, UV);
	}
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
