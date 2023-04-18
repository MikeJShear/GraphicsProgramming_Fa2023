precision mediump float;

uniform vec3 uLightDirection;
uniform vec3 uCameraPosition; // eyePoint
uniform sampler2D uTexture;

varying vec2 vTexcoords;
varying vec3 vWorldNormal;
varying vec3 vWorldPosition; // surfaceVector

void main(void) {
    // diffuse contribution
    
    // todo #1 normalize the light direction and store in a separate variable
    vec3 normalizedLight = normalize(uLightDirection);
    
    // todo #2 normalize the world normal and store in a separate variable
    vec3 normalWorld = normalize(vWorldNormal);
    
    // todo #3 calculate the lambert term
    float lambert = max(dot(normalWorld, normalizedLight), 0.0);
    // specular contribution
    
    // todo #4 in world space, calculate the direction from the surface point to the eye (normalized)
        vec3 surfaceToEye = normalize(uCameraPosition-vWorldPosition);

    // todo #5 in world space, calculate the reflection vector (normalized)
        vec3 reflection = (normalWorld - normalizedLight)* (2.0*lambert);
    // todo #6 calculate the phong term
        float phong = pow(dot(reflection,surfaceToEye),64.0);

    // combine
    // todo #7 apply light and material interaction for diffuse value by using the texture color as the material
    // todo #8 apply light and material interaction for phong, assume phong material color is (0.3, 0.3, 0.3)


    vec3 albedo = texture2D(uTexture, vTexcoords).rgb;

    vec3 ambient = albedo * 0.1;
     vec3 diffuseColor = albedo*lambert;
     vec3 specularColor = albedo*phong;

    // todo #9
    // add "diffuseColor" and "specularColor" when ready
    vec3 finalColor = ambient + diffuseColor + specularColor;

    // todo #10 Add the ability to rotate the light vector via input

     // gl_FragColor = vec4(lambert,lambert,lambert, 1.0);
     // gl_FragColor = vec4(surfaceToEye, 1.0);
     // gl_FragColor = vec4(reflection,1.0);
    // gl_FragColor = vec4(phong,phong,phong,1.0);
        gl_FragColor = vec4(diffuseColor,1.0);
        gl_FragColor = vec4(specularColor,1.0);
        gl_FragColor = vec4(finalColor,1.0);


}

// EOF 00100001-10