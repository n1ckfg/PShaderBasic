uniform vec3 iResolution; 

uniform sampler2D texture;

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec4 col = texture2D(texture, uv);

    fragColor = vec4(1.0 - col.x, col.y * 0.5, col.z, 1.0);
}

void main() {
	mainImage(gl_FragColor, gl_FragCoord.xy);
}

