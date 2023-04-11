precision mediump float;

uniform sampler2D uTexture;
uniform float uAlpha;

varying vec2 vTextureCoodinates; // represents a interpolated texture value that is good for any fragment

// todo #3 - receive texture coordinates and verify correctness by 
// using them to set the pixel color 



void main(void) {
    // todo #5

    // todo #3
    //gl_FragColor = vec4(vTextureCoodinates, 0.0, uAlpha);

    gl_FragColor =texture2D(uTexture,vTextureCoodinates);
}

// EOF 00100001-10
