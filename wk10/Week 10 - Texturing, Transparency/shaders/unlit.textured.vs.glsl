precision mediump float;


attribute vec3 aVertexPosition;  // attribure is constant all the time and gets information from buffers
attribute vec2 aTexcoords;      // pre determined value that is perserved and used by 

uniform mat4 uWorldMatrix;    // changes out side the shader and is passed in
uniform mat4 uViewMatrix;
uniform mat4 uProjectionMatrix;

// todo #2 - make sure to pass texture coordinates for interpolation to fragment shader (varying)
// 1. Declare the variable correctly, // Declared and used entirely within the shaders, interpolates value for fragment shader.

    varying vec2 vTextureCoodinates;

// 2. Set it correctly inside main

void main(void) 
{
    gl_Position = uProjectionMatrix * uViewMatrix * uWorldMatrix * vec4(aVertexPosition, 1.0);
    vTextureCoodinates = aTexcoords; // gets values for undefined points

}

// EOF 00100001-10