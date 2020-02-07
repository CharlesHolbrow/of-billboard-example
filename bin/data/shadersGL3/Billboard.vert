#version 150

uniform mat4 orientationMatrix;
uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 textureMatrix;
uniform mat4 modelViewProjectionMatrix;

uniform vec2 screenSize;

in vec4  position;
in vec4  color;
in vec3  normal;

out vec4 colorVarying;

void main() {
	vec4 eyePos = modelViewMatrix * position;
	vec4 projVoxel = projectionMatrix * vec4(64, 64, eyePos.z, eyePos.w);
	vec2 projSize = screenSize * projVoxel.xy / projVoxel.w;
	gl_PointSize = 0.25 * (projSize.x + projSize.y);
	gl_Position = projectionMatrix * eyePos;
	colorVarying = color;
}





