#version 150

uniform sampler2D tex;
uniform vec2 screenSize;
in vec4 colorVarying;
in vec2 screenPosition;

out vec4 fragColor;

void main (void) {
	float v = gl_FragCoord.x / screenSize.x;
	v = screenPosition.x / screenSize.x;

	fragColor = texture(tex, gl_PointCoord);// * colorVarying;
	fragColor.r = gl_PointCoord.x;
	fragColor.gb = vec2(0, 1);
	if (fragColor.a == 0) discard;
}
